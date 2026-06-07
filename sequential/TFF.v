`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2026 02:54:16 PM
// Design Name: 
// Module Name: TFF
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


module TFF(
    input wire clk,
    input wire t,
    output reg q
    );
    initial begin
        q = 1;
    end
    always@(posedge clk)begin
        if(t)
            q<=~q;
    end
endmodule
