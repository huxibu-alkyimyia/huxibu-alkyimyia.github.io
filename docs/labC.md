# 实验十二  寄存器与寄存器传输

## 一  实验目的

1. 了解寄存器的基本功能与设计
2. 了解寄存器传输系统的功能与设计

## 二  实验环境

1. EDA 工具： Logisim Evolution、Vivado
2. SWORD 开发板
3. 操作系统： Windows 10+

## 三  实验原理

寄存器是一组可以存储二进制数据的逻辑单元，能够完成**读**和**写**的基本操作。

在对寄存器进行写操作时，寄存器需要将数据输入的值存入自身的状态中；在对寄存器进行读操作时，寄存器需要将自身状态输出。

## 四  实验步骤

1. 按照上一部分所述原理，借助状态图、状态表等工具设计完成 1 位寄存器模块和 4 位寄存器模块。
2. 基于上一步骤所设计的寄存器模块，搭建寄存器传输系统，要求如下：
      1. 系统中含有 4 个 4 位寄存器和一个 ALU。
      2. 使用 SW[9] 来表示当前寄存器传输系统所需要进行的操作是进行 ALU 运算还是直接向寄存器中写数据。
      3. SW[9] 为 0 时，表示当前寄存器传输系统进行 ALU 运算。此时，使用 SW[1:0] 和 SW[3:2] 来表示 ALU 的操作数的源寄存器，使用 SW[6:4] 来表示 ALU 进行的运算，使用 SW [8:7] 来表示 ALU 运算结果的目标寄存器（即运算结果要存到哪个寄存器中）。
      4. SW[9] 为 1 时，表示当前寄存器传输系统要向寄存器中直接写数据。此时，使用 SW[8:7] 来表示要存数据的目标寄存器，使用SW[13:10] 来表示要存储的数据。
      5. 使用子板七段数码管来显示四个寄存器中的存储的二进制数的值。
      6. 使用 SW[15] 作为读取输入的时钟。即 SW[15] 正边沿时，令寄存器传输系统执行一次当前 SW[13:0] 所指示的操作。

## 五 实验提交

1. 包含本实验所使用的所有 Logisim 电路图文件、Verilog 源文件、仿真激励文件和引脚约束文件的 zip 压缩包
2. 一份 PDF 格式的实验报告（无需封面），内容包含：
      - 寄存器设计思路
      - 寄存器传输系统上板验证结果及其分析
      - 上板验证结果以及分析
      - 思考题，包含：
          1. 如何借助 verilog 宏定义，增强寄存器传输系统使用的代码的可读性？请简述思路并给出示例。

