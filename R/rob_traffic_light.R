#' Produce traffic-light plots of risk-of-bias assessments
#'
#' @description
#' Draw a robvis-style traffic-light grid for step 1 or step 2 assessments.
#' The first column of `data` contains study labels; the remaining columns map
#' by position to Item 1--5 (`step = 1`) or Item 1--6 (`step = 2`).
#'
#' @param data A data frame. Column 1 contains study labels. Step 1 requires
#'   five assessment columns; step 2 requires six assessment columns.
#' @param step Assessment step, either `1` or `2`.
#' @param colour A character vector of four colours. It may be unnamed (in the
#'   documented level order) or named with full labels/abbreviations. Defaults
#'   to green, yellow, red, and blue.
#' @param psize Diameter of the traffic-light circles in millimetres.
#'
#' @return A `ggplot2` object.
#' @export
#'
#' @examples
#' rob_traffic_light(data = data_step1, step = 1)
#' rob_traffic_light(data = data_step2, step = 2)

rob_traffic_light <- function(
    data,
    step,
    colour = NULL,
    psize = 10
) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required.", call. = FALSE)
  }
  if (!is.data.frame(data) || nrow(data) == 0L) {
    stop("`data` must be a non-empty data frame.", call. = FALSE)
  }
  if (length(step) != 1L || is.na(step) || !step %in% c(1, 2)) {
    stop("`step` must be either 1 or 2.", call. = FALSE)
  }
  if (length(psize) != 1L || !is.finite(psize) || psize <= 0) {
    stop("`psize` must be one positive number.", call. = FALSE)
  }

  spec <- if (step == 1) {
    list(
      n_items = 5L,
      levels = c("Definitely Yes", "Probably Yes",
                 "Definitely No", "Probably No"),
      abbreviations = c(DY = "Definitely Yes", PY = "Probably Yes",
                        DN = "Definitely No", PN = "Probably No"),
      symbols = c("Definitely Yes" = "+", "Probably Yes" = "+",
                  "Definitely No" = "-", "Probably No" = "-"),
      descriptions = c(
        "Item 1: Random sequence generation",
        "Item 2: Allocation concealment",
        "Item 3: Blinding of participants",
        "Item 4: Blinding of healthcare providers",
        "Item 5: Blinding of outcome assessors"
      )
    )
  } else {
    list(
      n_items = 6L,
      levels = c("Definitely Low", "Probably Low",
                 "Definitely High", "Probably High"),
      abbreviations = c(DL = "Definitely Low", PL = "Probably Low",
                        DH = "Definitely High", PH = "Probably High"),
      symbols = c("Definitely Low" = "+", "Probably Low" = "+",
                  "Definitely High" = "-", "Probably High" = "-"),
      descriptions = c(
        "Item 1: Random sequence generation",
        "Item 2: Allocation concealment",
        "Item 3: Blinding of participants",
        "Item 4: Blinding of healthcare providers",
        "Item 5: Blinding of outcome assessors",
        "Item 6: Outcome data not included in analysis"
      )
    )
  }

  expected_cols <- spec$n_items + 1L
  if (ncol(data) != expected_cols) {
    stop(
      sprintf("`step = %s` requires exactly %s columns: one study column and %s item columns.",
              step, expected_cols, spec$n_items),
      call. = FALSE
    )
  }
  if (anyNA(data[[1]]) || any(!nzchar(trimws(as.character(data[[1]]))))) {
    stop("The first column contains a missing or empty study label.", call. = FALSE)
  }
  if (anyDuplicated(as.character(data[[1]]))) {
    stop("Study labels in the first column must be unique.", call. = FALSE)
  }

  default_colours <- c("#02c101", "#e2df06", "#c00000", "#4fa1f7")
  names(default_colours) <- spec$levels
  if (is.null(colour)) {
    palette <- default_colours
  } else {
    if (!is.character(colour) || length(colour) != 4L || anyNA(colour)) {
      stop("`colour` must be a character vector containing exactly four colours.",
           call. = FALSE)
    }
    colour_ok <- vapply(colour, function(x) {
      !inherits(try(grDevices::col2rgb(x), silent = TRUE), "try-error")
    }, logical(1))
    if (!all(colour_ok)) {
      stop("Every value in `colour` must be a valid R colour.", call. = FALSE)
    }
    if (is.null(names(colour)) || any(!nzchar(names(colour)))) {
      palette <- stats::setNames(colour, spec$levels)
    } else {
      key <- trimws(names(colour))
      key[toupper(key) %in% names(spec$abbreviations)] <-
        unname(spec$abbreviations[toupper(key[toupper(key) %in% names(spec$abbreviations)])])
      if (!setequal(key, spec$levels)) {
        stop("Named `colour` values must use the four full judgements or their abbreviations.",
             call. = FALSE)
      }
      palette <- stats::setNames(colour, key)[spec$levels]
    }
  }

  raw <- as.matrix(data[, -1L, drop = FALSE])
  judgement <- trimws(as.character(raw))
  upper <- toupper(judgement)
  is_abbreviation <- upper %in% names(spec$abbreviations)
  judgement[is_abbreviation] <- unname(spec$abbreviations[upper[is_abbreviation]])
  bad <- is.na(judgement) | !judgement %in% spec$levels
  if (any(bad)) {
    bad_values <- unique(ifelse(is.na(judgement[bad]), "NA", judgement[bad]))
    stop(
      sprintf("Invalid judgement(s) for step %s: %s. Allowed: %s.",
              step, paste(bad_values, collapse = ", "),
              paste(c(names(spec$abbreviations), spec$levels), collapse = ", ")),
      call. = FALSE
    )
  }

  studies <- as.character(data[[1]])
  item_names <- paste("Item", seq_len(spec$n_items))
  plot_data <- data.frame(
    Study = factor(rep(studies, times = spec$n_items), levels = studies),
    domain = factor(rep(item_names, each = length(studies)), levels = item_names),
    judgement = factor(judgement, levels = spec$levels),
    x = 1,
    y = 1,
    stringsAsFactors = FALSE
  )
  panel_data <- unique(plot_data[c("Study", "domain")])
  panel_data$xmin <- -Inf
  panel_data$xmax <- Inf
  panel_data$ymin <- -Inf
  panel_data$ymax <- Inf
  legend_data <- data.frame(
    x = NA_real_, y = NA_real_,
    judgement = factor(spec$levels, levels = spec$levels)
  )
  ssize <- psize - (psize / 4)
  adjust_caption <- -0.7 + length(spec$levels) * -0.6
  caption <- paste0(
    "  Items:\n  ", paste(spec$descriptions, collapse = "\n  "),
    "\n\n\n                "
  )

  # Keep the original robvis traffic-light geometry and layout. Only the
  # domain text, judgement text, symbols and colours differ.
  ggplot2::ggplot(
    plot_data,
    ggplot2::aes(x = x, y = y, colour = judgement)
  ) +
    ggplot2::facet_grid(
      Study ~ factor(domain, levels = item_names),
      switch = "y", space = "free"
    ) +
    ggplot2::geom_point(
      data = legend_data,
      ggplot2::aes(x = x, y = y, colour = judgement),
      inherit.aes = FALSE, size = 6, na.rm = TRUE
    ) +
    ggplot2::geom_point(
      data = legend_data,
      ggplot2::aes(x = x, y = y, shape = judgement),
      inherit.aes = FALSE, size = 4, colour = "black", na.rm = TRUE
    ) +
    ggplot2::geom_rect(
      data = panel_data,
      ggplot2::aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax),
      inherit.aes = FALSE,
      fill = "#FFFFFF", colour = "#FFFFFF",
      show.legend = FALSE
    ) +
    ggplot2::geom_point(size = psize, show.legend = FALSE) +
    ggplot2::geom_point(
      shape = 1, colour = "black", size = psize, show.legend = FALSE
    ) +
    ggplot2::geom_point(
      size = ssize, colour = "black",
      ggplot2::aes(shape = judgement), show.legend = FALSE
    ) +
    ggplot2::scale_x_discrete(position = "top", name = "Risk of bias") +
    ggplot2::scale_y_continuous(
      limits = c(1, 1), labels = NULL, breaks = NULL,
      name = "Study", position = "left"
    ) +
    ggplot2::scale_size(range = c(5, 20)) +
    ggplot2::scale_colour_manual(
      values = palette, labels = spec$levels,
      breaks = spec$levels, drop = FALSE
    ) +
    ggplot2::scale_shape_manual(
      values = stats::setNames(c(43, 43, 45, 45), spec$levels),
      labels = spec$levels, breaks = spec$levels, drop = FALSE
    ) +
    ggplot2::labs(
      shape = "Judgement", colour = "Judgement", caption = caption
    ) +
    ggplot2::guides(
      shape = ggplot2::guide_legend(override.aes = list(fill = NA))
    ) +
    ggplot2::theme_bw() +
    ggplot2::theme(
      panel.border = ggplot2::element_rect(colour = "grey"),
      panel.spacing = grid::unit(0, "line"),
      legend.position = "bottom",
      legend.justification = "right",
      legend.direction = "vertical",
      legend.margin = ggplot2::margin(
        t = -0.2, r = 0, b = adjust_caption, l = -10, unit = "cm"
      ),
      strip.text.x = ggplot2::element_text(size = 10),
      strip.text.y.left = ggplot2::element_text(angle = 0, size = 10),
      legend.text = ggplot2::element_text(size = 9),
      legend.title = ggplot2::element_text(size = 9),
      strip.background = ggplot2::element_rect(fill = "#A9A9A9"),
      plot.caption = ggplot2::element_text(
        size = 10, hjust = 0, vjust = 1
      )
    )
}
