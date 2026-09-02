
Gemini
New chat
Search chats
Images
Library
New notebook
穴位数据格式转换指南
RobustVis R包使用指南
RobustVis: R包用于评估偏倚风险
RobustVis Package Installation and Troubleshooting
ROBUST-RCT Step 1 R代码与文档
R Package Build and Warning Diagnostics
R包上传CRAN的条件与要求
Overview of the R Language
R语言风险偏好交通灯图函数修改
交通灯图函数自定义修改
R函数rob_traffic_light修改代码
R语言rob_traffic_light函数修改
重写偏倚风险交通图函数
Fixing Corrupt R Package Installation
R语言自定义偏倚风险交通图函数
R函数偏倚风险条形图绘制
Custom Risk of Bias Plot Function
Fixing Corrupted R Packages
RCT大模型总结性能评估方法
大模型摘要生成性能评估
临床试验方案与发表不一致现象
Skill子目录嵌入向量实现RAG方案
抗肿瘤中药证据再现性研究亮点撰写
Meta分析结局定义模糊方法学研究
康莱特论文优势局限性分析
Impact of Data Extraction Errors
亚组分析讨论部分写作
Subgroup Analysis of Meta-Analysis Errors
多中心区组随机化Shiny应用
Conversation with Gemini
# RobustVis

 

 

写一下robust-RCT是最新的评估随机对照研究偏倚风险的工具，发表于BMJ，RobustVis package可以可视化robust-RCT，具有Cochrane风格。

 

 

## Installation

 

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

 

```R

Install.packages("devtools")

 

devtools::install_github("tcmchen7410-bot/RobustVis")

```

 

## Create plots 

The package contains two plotting functions:

1 rob_bar

A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

 

library(RobustVis)

rob_bar(data_step1, step = 1)

图片

rob_bar(data_step1, step = 2)

图片

2 rob_traffic_light

 

Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 ('step = 1') or Item 1–6 ('step = 2').

rob_traffic_light(data = data_step1, step = 1)

图片

rob_traffic_light(data = data_step2, step = 2)

图片

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

致谢

我们参考了robvis package对RobustVis package进行了制作

RobustVis 是专门用于可视化新型偏倚风险评估工具 ROBUST-RCT（发表于 BMJ，旨在平衡评估的简便性与方法学严谨性）的 R 语言扩展包。该包支持生成具有经典 Cochrane 风格的风险偏倚汇总图和交通灯图。

Installation
您可以通过 devtools 从 GitHub 直接安装 RobustVis 的开发版本：

R
install.packages("devtools")
devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
该包内置了多项可视化函数，能够快速将 Step 1 或 Step 2 的偏倚评估数据转化为整洁的数据结构并进行绘图：

1. rob_bar / rob_summary_robust
用于绘制标准的 Cochrane 风格堆积条形图，带有带框的图例和自定义标签。

R
library(RobustVis)

# 绘制 Step 1 或 Step 2 的汇总条形图
rob_bar(data_step1, step = 1)
rob_bar(data_step2, step = 2)

# 或直接加载内置数据集进行汇总绘制
data(data_step2)
rob_summary_robust(data_step2)
2. rob_traffic_light
用于绘制类似于 robvis 风格的交通灯矩阵图（Traffic-light grid）。数据框的第一列包含研究标签，其余列按位置依次对应 Step 1（项目 1–5）或 Step 2（项目 1–6）的评估条目。

R
rob_traffic_light(data = data_step1, step = 1)
rob_traffic_light(data = data_step2, step = 2)
Features
Custom Summary Plots: 专为 ROBUST-RCT 评估量身定制的标准化偏倚风险汇总条形图。  
The BMJ

Seamless Integration: 基于 dplyr 和 ggplot2 开发，完美融入 R 语言常规的数据处理与可视化工作流。

Author Information
Guang Chen (作者、开发者) — tcm_chen7410@163.com

Fanrong Liang (作者) — acuresearch@126.com

License  
The BMJ
本项目开源并采用 MIT License 协议。

致谢：本项目在制作过程中参考并借鉴了经典的 robvis 绘图包的设计理念。

写到一个markdown里边，英文的

Create Plots
The package contains dedicated plotting functions for both Step 1 and Step 2 assessments of ROBUST-RCT:

1. Summary Bar Plots (rob_bar / rob_summary_robust)
Convert risk-of-bias assessment data into tidy formats and plot summary stacked bar plots matching the standard Cochrane style, complete with boxed legends and custom labels.

R
library(RobustVis)

# Plot summary bar plots for Step 1 or Step 2
rob_bar(data_step1, step = 1)
rob_bar(data_step2, step = 2)

# Load built-in dataset and generate a summary risk-of-bias bar plot
data(data_step2)
rob_summary_robust(data_step2)
2. Traffic-Light Plots (rob_traffic_light)
Draw a robvis-style traffic-light grid for Step 1 or Step 2 assessments. The first column of the dataset contains study labels, while the remaining columns map by position to Item 1–5 (for step = 1) or Item 1–6 (for step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
rob_traffic_light(data = data_step2, step = 2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias bar plots tailored specifically for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

Acknowledgments
We acknowledge and thank the developers of the robvis package, which served as a valuable reference and inspiration during the creation of RobustVis.
"""

with open("RobustVis.md", "w", encoding="utf-8") as f:
f.write(markdown_content)
print("Markdown file generated successfully.")


```text?code_stdout&code_event_index=1
Markdown file generated successfully.

Your Markdown file is ready

MD icon
RobustVis
 MD 
听不懂吗？把所有的内容系到一个markdown

Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作
"""

with open("RobustVis.md", "w", encoding="utf-8") as f:
f.write(markdown_content)
print("Markdown file generated successfully.")


```text?code_stdout&code_event_index=1
Markdown file generated successfully.

Your Markdown file is ready

MD icon
RobustVis
 MD 
我已经将您提供给我的所有原始内容（包括中文说明、英文代码、函数介绍以及最后的致谢部分）完整地整合并写入到了一个 Markdown 文件中。

。。。。

[file-tag: code-generated-file-875c934b-4b23-4cc7-8bf2-64f4b48e7bb6]

把所有内容写到一个markdown，然后我可以直接一次复制粘贴到read me

Markdown
# RobustVis

Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in *BMJ*. The `RobustVis` package can visualize Robust-RCT assessments in a Cochrane style.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
install.packages("devtools")

devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

仍然不是一个

Markdown
# RobustVis

Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in *BMJ*. The `RobustVis` package can visualize Robust-RCT assessments in a Cochrane style.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
install.packages("devtools")

devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

把所有的内容放在一个markdo

Markdown
# RobustVis

Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in *BMJ*. The `RobustVis` package can visualize Robust-RCT assessments in a Cochrane style.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
install.packages("devtools")

devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

你现在只把第一段放在了markdo

RobustVis
Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in BMJ. The RobustVis package can visualize Robust-RCT assessments in a Cochrane style.

Installation
You can install the development version of RobustVis directly from GitHub using devtools:

R
install.packages("devtools")
devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

你现在只把第一段放在了markdown，所以请把所有内容放在markdown

请直接复制下方完整的内容到你的 README.md 中（所有内容已经全部包含在一个 Markdown 代码块中了）：

Markdown
# RobustVis

Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in *BMJ*. The `RobustVis` package can visualize Robust-RCT assessments in a Cochrane style.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
install.packages("devtools")
devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

你还是没听懂

为了避免任何格式渲染或代码块嵌套导致你复制不便，我这次不使用任何 Markdown 代码块包裹，而是直接把所有内容用纯文本排版好。

你可以直接从下方 # RobustVis 开始，一直全选复制到最底部的最后一行，然后直接粘贴到你的 README.md 中：

RobustVis
Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in BMJ. The RobustVis package can visualize Robust-RCT assessments in a Cochrane style.

Installation
You can install the development version of RobustVis directly from GitHub using devtools:

R
install.packages("devtools")
devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

你可以直接从下方 # RobustVis 开始，一直全选复制到最底部的最后一行，然后直接粘贴到你的 README.md 中：



 但是你现在给我的哥是不是markdo

对，我这次直接把所有的 Markdown 文本放在了普通的聊天对话文本中（没有用 Markdown 代码块嵌套），这样你就可以直接在聊天窗口里把从 # RobustVis 到最后一行的所有内容全部按住鼠标左键拖动选中，然后直接复制，粘贴进你的 README.md 文件里。

如果你希望它被一个完整的 Markdown 代码块（markdown ... ）包起来、方便你直接点击右上角的“一键复制”按钮，请看下方：

Markdown
# RobustVis

Robust-RCT is the latest tool for evaluating the risk of bias in randomized controlled trials, published in *BMJ*. The `RobustVis` package can visualize Robust-RCT assessments in a Cochrane style.

## Installation

You can install the development version of `RobustVis` directly from GitHub using `devtools`:

```R
install.packages("devtools")
devtools::install_github("tcmchen7410-bot/RobustVis")
Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作

把以上内容帮我生成一个markdowm文件

Create plots
The package contains two plotting functions:

rob_bar
A function to convert risk-of-bias assessment data for Step 1 or Step 2 into tidy data and plot a summary stacked barplot matching the standard Cochrane style with a boxed legend and custom labels.

R
library(RobustVis)
rob_bar(data_step1, step = 1)
# 图片
rob_bar(data_step1, step = 2)
# 图片
rob_traffic_light
Draw a robvis-style traffic-light grid for step 1 or step 2 assessments. The first column of 'data' contains study labels; the remaining columns map by position to Item 1–5 (step = 1) or Item 1–6 (step = 2).

R
rob_traffic_light(data = data_step1, step = 1)
# 图片
rob_traffic_light(data = data_step2, step = 2)
# 图片
R
library(RobustVis)

# Load your risk-of-bias assessment dataset
data(data_step2)

# Generate a summary risk-of-bias barplot
rob_summary_robust(data_step2)
Features
Custom Summary Plots: Quickly produce standardized risk-of-bias barplots tailored for ROBUST-RCT assessments.

Seamless Integration: Built to work smoothly with standard data manipulation and visualization workflows in R using dplyr and ggplot2.

Author Information
Guang Chen (Author, Creator) — tcm_chen7410@163.com

Fanrong Liang (Author) — acuresearch@126.com

License
This project is open source and available under the MIT License.

致谢
我们参考了 robvis package 对 RobustVis package 进行了制作
"""

with open("README.md", "w", encoding="utf-8") as f:
f.write(markdown_content)
print("README.md generated successfully.")


```text?code_stdout&code_event_index=1
README.md generated successfully.

Your Markdown file is ready

MD icon
README
 MD 
我已将所有完整的内容成功打包并写入到了 README.md 文件中。




 
Gemini is AI and can make mistakes.

Analyzing
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
# 图片
rob_bar(data_step1, step = 2)
# 图片
```

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
README.md
Displaying README.md.
