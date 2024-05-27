`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/22 10:35:00
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input [1:0] SW,
    input clk,
    output [7:0] SEG,
    output [3:0] AN,
    output LED
    );
    
    wire [15:0] in;
    wire has_input;
    wire _input;
    wire reset;
    
    MC14495 segmenter(.AN(AN), .EN(4'b1111), .HEXS(in), .SEG(SEG), .clk(clk), .points(4'b1111), .rst(reset));
    shift Shift(.SW(SW), .rst(reset), .clk(clk), .recorded_in(in), .has_input(has_input), .next_input(_input));
    
    DFA fa(.has_input(has_input), ._input(_input), .rst(reset), .o(LED));
    
endmodule
