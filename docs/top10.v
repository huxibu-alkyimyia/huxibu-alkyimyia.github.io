module top (
	input clk,
    input rst,
    input ...,
    output [3:0] R, G, B,
    output HS, VS,
    output ...
);

​    reg [2:0] clkdiv;
​	initial clkdiv = 3'b0;
​	always @(posedge clk) clkdiv = clkdiv + 3'b1;



​	wire [8:0] row;

​	wire [9:0] col;
​	wire rdn;
​	wire [11:0] pixel;

​	VGA vga0(.clk(clkdiv[2]), .rst(rst), .R(R), .G(G), .B(B), .HS(HS), .VS(VS), .row(row), .col(col), .rdn(rdn), .Din(pixel));
​	other_module others(.row(row), .col(col), .rdn(rdn), .pixel(pixel), ...);

endmodule
	