`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2026 01:40:17 PM
// Design Name: 
// Module Name: JKFF
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


module JKFF(
    input clk,
    input J,
    input K,
    output reg q
    );
    initial begin
        q = 1;
    end
    always@(posedge clk)begin
        if(J==0 & K==0)
            q = q;
        else if(J==0 & K==1)
            q<=~q;
        else if(J==1 & K==0)
            q<=~q;
        else if(J==1 & K==1)
            q<=~q;
    end
endmodule
