`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2026 08:44:52 PM
// Design Name: 
// Module Name: CLAA_tb
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


module CLAA_tb();
    reg [3:0]A,B;
    reg cin;
    wire [3:0]sum;
    wire cout;
    CLAA c(A,B,cin,sum,cout);
    initial begin
    A=4'b0101;B=4'b0011;cin=0; #10
    A=4'b1010;B=4'b0010;cin=1; #10
    A=4'b1111;B=4'b0001;cin=0; #10
    $stop;
    end
endmodule
