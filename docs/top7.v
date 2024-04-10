`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/24 09:44:33
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
    input clk,
    input [15:0] SW,
    input BTNY,
    output [7:0] SEG,
    output [3:0] AN
    );
    

    wire BTN;
    // please Add Sources: Anti_jitter.v
    Anti_jitter btn_ok(.clk(clk), .BTN(BTNY), .BTN_OK(BTN));

    DispNum display(.HEXS(SW), .clk(clk), .rst(BTN), .EN(4'b1111), .P(4'b1001), .AN(AN), .SEG(SEG));
    
endmodule
