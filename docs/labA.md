# 实验十 VGA交互的使用

## 一  实验目的

1. 了解VGA接口的使用方法

## 二  实验环境

1. EDA 工具： Logisim Evolution、Vivado
2. SWORD 开发板
3. 操作系统： Windows 10+

## 三  实验原理

### 1. VGA接口的原理

在 Sword 开发板上，VGA包含`R`、`G`、`B`、`HS`、`VS`几个接口。其中，`R`、`G`、`B` 为表示像素颜色的信号，`HS`、`VS` 分别为行同步信号和场同步信号。显示屏通过 VGA 接口传入的 `HS` 信号和 `VS` 信号来确定当前需要显示的像素，并且将 `R`、`G`、`B` 信号对应的颜色显示在该像素的位置上。根据显示屏大小和扫描频率的不同，需要让 `HS`、`VS` 信号按照不同的周期发生变化，其具体细节由下面的 VGA 模块实现。

VGA 各个接口的引脚约束如右：[VGA.xdc](VGA.xdc)

## 2. VGA模块的使用

VGA 模块的代码如右：[VGA.v](VGA.v)

VGA 模块的模块接口定义如下：

```verilog
module VGA(
	input clk,                  // vga clk = 25 MHz
	input rst,
    input [11:0]Din,            // bbbb_gggg_rrrr, pixel
    output reg [8:0]row,        // pixel ram row address, 480 (512) lines
    output reg [9:0]col,        // pixel ram col address, 640 (1024) pixels
	output reg rdn,	            // read pixel RAM (active_low)
    output reg [3:0]R, G, B,    // red, green, blue colors
	output reg HS, VS           // horizontal and vertical synchronization
   );
```

其中，clk 为 25 MHz 的时钟信号 VGA 模块可以根据输入的 clk 输入信号，生成对应大小为 `600 * 480`、扫描频率为 `60 Hz`（与板子上的屏幕相匹配）的 `HS` 和 `VS` 信号，同时通过 `row` 和 `col` 输出信号传出当前的 `HS` 和 `VS` 信号对应的像素位置。其他模块可以通过读取 `row` 和 `col` 的值，来判断输出像素的 RGB 值，并将其传入 `Din` 接口，随后 VGA 模块会将 `Din` 接口的十二为数据按照 `bbbb_gggg_rrrr` 的模式由 `R`、`G`、`B` 接口传出。`rdn` 接口为读使能接口，当 `rdn` 为 1 时，无需其他模块传入 `Din` 的值。`R`、`G`、`B`、`HS`、`VS` 五个接口则是直接连接到顶层模块的五个 VGA 输出信号的接口。

为此，我们可以参考右侧的[代码](top10.v)编写顶层模块，以调用VGA接口。

## 四  实验步骤

借助上一部分所阐述的 VGA 接口和 VGA 模块使用方式，编写在用于屏幕上显示一个圆的电路，要求可以通过输入信号改变圆的位置和大小（输入与圆位置和大小之间的映射关系由你自己决定）。

## 五  实验提交

1. 包含本实验所使用的所有 Logisim 电路图文件、Verilog 源文件、仿真激励文件和引脚约束文件的 zip 压缩包
2. 一份不超过 2 页的 PDF 格式的实验报告，内容包含：
      - 各模块设计思路
      - 上板验证结果以及分析







