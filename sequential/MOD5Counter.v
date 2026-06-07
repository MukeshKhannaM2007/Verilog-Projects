`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2026 01:03:44 PM
// Design Name: 
// Module Name: MOD5Counter
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


module MOD5Counter(
    input clk,
    input reset,
    output reg [2:0] count
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        count <= 3'b000;

    else if(count == 3'b100)   // 4 in decimal
        count <= 3'b000;       // reset to 0

    else
        count <= count + 1;
end
endmodule
