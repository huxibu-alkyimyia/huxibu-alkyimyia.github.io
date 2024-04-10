`timescale 1ns / 1ps

module top(
    /* description of SW[9:0]:
     * SW[3:0] : the four bits that control the number that the segments display
     * SW[7:4] : four enables that control which ones of four segments does display numbers
     * SW[8] : controls if the decimal point is displayed
     * SW[9] : global enable
     */
    input [9:0] SW,
    output [7:0] SEG,
    output [3:0] AN
    );
    
    assign AN = {4{SW[9]}} & SW[7:4];
    assign SEG[7] = SW[8];
    // fill sth. here
    
endmodule
