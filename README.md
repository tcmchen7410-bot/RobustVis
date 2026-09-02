# RobustVis

Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in *BMJ*. The `RobustVis` package can visualize Robust-RCT assessments in a Cochrane style.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
install.packages("devtools")
devtools::install_github("tcmchen7410-bot/RobustVis")
```

## Create plots 

The package contains two plotting functions:

1. `rob_bar`
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

```R
library(RobustVis)
rob_bar(data_step1, step = 1)
```
<img src="bar1.png" alt="bar1" width="100%" />

```R
library(RobustVis)
rob_bar(data_step1, step = 2)
```
<img src="bar1.png" alt="bar2" width="100%" />


2. `rob_traffic_light`
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (`step = 1`) or Item 1–6 (`step = 2`).

```R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
```

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

## 致谢

我们参考了 robvis package 对 RobustVis package 进行了制作
