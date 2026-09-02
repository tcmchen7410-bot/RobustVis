#' Produce a summary risk-of-bias barplot for Step 1 or Step 2 tools
#'
#' @description A function to convert risk-of-bias assessment data for Step 1 or Step 2
#'   into tidy data and plot a summary stacked barplot matching the standard Cochrane style
#'   with a boxed legend and custom labels.
#'
#' @param data A dataframe containing the study IDs in the first column, followed by
#'   item evaluation columns (columns B to F for Step 1, or columns B to G for Step 2).
#' @param step An integer or character specifying the evaluation step, either \code{1} or \code{2}.
#'   Default is \code{1}.
#' @param colour A character vector specifying the colour scheme. Defaults to \code{NULL},
#'   which automatically applies standard Cochrane-style colors.
#' @param ... Additional arguments to be passed to internal functions.
#'
#' @return A ggplot2 risk-of-bias summary barplot figure.
#' @family custom functions
#' @export
#'
#' @examples
#' rob_bar(data_step1, step = 1)
#' rob_bar(data_step2, step = 2)

rob_bar <- function(data,
                    step = 1,
                    colour = NULL,
                    ...) {
  step <- as.character(step)
  if (!step %in% c("1", "2")) {
    stop("Error: 'step' must be either 1 or 2.")
  }

  # 如果用户没有提供自定义颜色（即 colour 为 NULL），则设定默认配色
  if (is.null(colour)) {
    colour <- c("#02c101", "#e2df06", "#c00000", "#4fa1f7")
  }

  if (step == "1") {
    domain_names <- c(
      "Item 1: Random sequence generation",
      "Item 2: Allocation concealment",
      "Item 3: Blinding of participants",
      "Item 4: Blinding of healthcare providers",
      "Item 5: Blinding of outcome assessors"
    )
    if (ncol(data) >= 6) {
      colnames(data)[2:6] <- domain_names
    }
    max_domain_col <- 6

    judgement_levels <- c("dy", "py", "pn", "dn")
    judgement_labels <- c(
      dy = "Definitely Yes",
      py = "Probably Yes",
      pn = "Probably No",
      dn = "Definitely No"
    )

  } else {
    domain_names <- c(
      "Item 1: Random sequence generation",
      "Item 2: Allocation concealment",
      "Item 3: Blinding of participants",
      "Item 4: Blinding of healthcare providers",
      "Item 5: Blinding of outcome assessors",
      "Item 6: Outcome data not included in analysis"
    )
    if (ncol(data) >= 7) {
      colnames(data)[2:7] <- domain_names
    }
    max_domain_col <- 7

    judgement_levels <- c("dl", "pl", "ph", "dh")
    judgement_labels <- c(
      dl = "Definitely Low",
      pl = "Probably Low",
      ph = "Probably High",
      dh = "Definitely High"
    )
  }

  data_subset <- data[, 1:max_domain_col, drop = FALSE]
  for (i in 2:max_domain_col) {
    data_subset[[i]] <- tolower(trimws(as.character(data_subset[[i]])))
  }

  rob.tidy <- tidyr::gather(data_subset, key = "domain", value = "judgement", -1)

  rob.tidy$judgement <- factor(rob.tidy$judgement, levels = judgement_levels)
  rob.tidy$domain <- factor(rob.tidy$domain, levels = rev(domain_names))

  plot_data <- rob.tidy |>
    dplyr::group_by(.data$domain, .data$judgement) |>
    dplyr::summarise(count = dplyr::n(), .groups = "drop") |>
    dplyr::group_by(.data$domain) |>
    dplyr::mutate(percentage = .data$count / sum(.data$count))

  plot <- ggplot2::ggplot(plot_data, ggplot2::aes(x = .data$percentage, y = .data$domain, fill = .data$judgement)) +
    ggplot2::geom_bar(stat = "identity", position = ggplot2::position_fill(reverse = TRUE), color = "black", linewidth = 0.3, width = 0.8) +
    ggplot2::scale_x_continuous(
      labels = scales::percent_format(accuracy = 1),
      breaks = c(0, 0.25, 0.5, 0.75, 1.0),
      limits = c(0, 1)
    ) +
    ggplot2::scale_fill_manual(
      values = colour,
      labels = judgement_labels,
      drop = FALSE,
      limits = force
    ) +
    ggplot2::labs(
      x = NULL,
      y = NULL,
      fill = NULL
    ) +
    ggplot2::theme_classic(base_size = 11) +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank(),
      axis.line.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 11, color = "black"),
      axis.text.x = ggplot2::element_text(size = 10, color = "black"),
      legend.position = "bottom",
      legend.direction = "horizontal",
      legend.key.size = ggplot2::unit(0.4, "cm"),
      legend.box.background = ggplot2::element_rect(color = "black", linewidth = 0.5),
      legend.background = ggplot2::element_blank()
    )

  return(plot)
}
