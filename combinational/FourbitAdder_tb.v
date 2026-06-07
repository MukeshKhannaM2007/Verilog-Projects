`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2026 11:27:43 AM
// Design Name: 
// Module Name: FourbitAdder_tb
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


module FourbitAdder_tb();
    reg [3:0]A;
    reg [3:0]B;
    reg cin;
    wire [3:0]sum;
    wire cout;
    FourbitAdder FBD(A,B,cin,sum,cout);
    initial begin
    A=4'b1110;B=4'b0001;cin=1; #10
    A=4'b1000;B=4'b0010; #10
    $stop;
    end
endmodule
