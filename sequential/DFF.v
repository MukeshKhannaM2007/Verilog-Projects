`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2026 02:36:02 PM
// Design Name: 
// Module Name: DFF
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


module DFF(
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
    );
    always@(posedge clk)begin
        if(reset)begin
            q <= 1'b0;
        end else begin
            q<=d;
        end
end
endmodule
