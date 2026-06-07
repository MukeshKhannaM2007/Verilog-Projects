`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 05:17:32 PM
// Design Name: 
// Module Name: AsyncUpDownCounter_tb
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


module AsyncUpDownCounter_tb();
    reg clk;
reg reset;
reg up_down;
wire [2:0] q;
AsyncUpDownCounter uut(clk,reset,up_down,q);
always #5 clk = ~clk; 

initial
begin
    clk = 0;
    reset = 1;
    up_down = 1;

    #10 reset = 0;   

    #50 up_down = 0;

    #50 $finish;
end
endmodule
