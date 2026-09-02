# RobustVis

`RobustVis` is an R package designed to streamline the visualization of risk-of-bias assessments, inspired by the workflow of tools like `robvis`.

## Overview

When conducting systematic reviews or methodological research involving ROBUST-RCT risk-of-bias evaluations, effectively communicating quality assessment results is crucial. `RobustVis` provides dedicated functions to generate publication-ready, Cochrane-style summary barplots.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")

devtools::install_github("tcmchen7410-bot/RobustVis")
```

## Quick Start

```R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
```

## Features

* **Custom Summary Plots**: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.
* **Seamless Integration**: Built to work smoothly with standard data manipulation and visualization workflows in R using `dplyr` and `ggplot2`.

## Author Information

* **Guang Chen** (Author, Creator) — `tcm_chen7410@163.com`
* **Fanrong Liang** (Author) — `acuresearch@126.com`

## License

This project is open source and available under the MIT License.
