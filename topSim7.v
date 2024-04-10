`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/05 19:34:49
// Design Name: 
// Module Name: topSim
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


module topSim;
    reg clk;
    reg [15:0] SW;
    reg BTNY;
    wire [7:0] SEG;
    wire [3:0] AN;
    
    top top(clk,SW,BTNY,SEG,AN);
    
    initial begin
        clk = 1'b1;
        SW = 16'hABCD;
        BTNY = 1'b0;
    end
    
    always begin
        clk = ~clk;
        #5;
    end
endmodule
