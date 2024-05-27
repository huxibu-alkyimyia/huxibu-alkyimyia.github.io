`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/22 10:45:08
// Design Name: 
// Module Name: shift
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


module shift(
    input [1:0] SW,
    input clk,
    output reg [15:0] recorded_in,
    output has_input,
    output next_input,
    output  rst
    );
    
    
    initial recorded_in = 16'b0;
    
    always @(posedge SW[0] or posedge rst) begin
        if (rst) recorded_in = 0;
        else begin
            recorded_in <= {recorded_in[14:0], SW[1]};
        end
    end
    
    assign has_input = SW[0];
    assign next_input = SW[1];
    
    wire next_rst;
    assign next_rst = recorded_in[15];
    assign rst = next_rst && ~SW[1];
    
endmodule
