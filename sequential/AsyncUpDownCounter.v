`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 04:41:00 PM
// Design Name: 
// Module Name: AsyncUpDownCounter
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


module AsyncUpDownCounter(
   input clk,
   input reset,
    input up_down,
    output reg [2:0] q
    );
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 3'b000;
        else
        begin
            if (up_down)
                q <= q + 1;   // Up counting
            else
                q <= q - 1;   // Down counting
        end
    end

endmodule
