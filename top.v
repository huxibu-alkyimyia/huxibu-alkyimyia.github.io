`timescale 1ns / 1ps

module top(
    input [9:0] SW,
    output [7:0] SEG,
    output [3:0] AN
    );
    
    assign AN = {4{SW[9]}} & SW[7:4];
    assign SEG[7] = SW[8];
    // fill sth. here
    
endmodule
