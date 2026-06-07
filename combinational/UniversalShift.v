`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2026 01:15:28 PM
// Design Name: 
// Module Name: UniversalShift
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


module UniversalShift(
 input clk,
   input rst,
   input [1:0] sel,
   input [3:0] parallel_in,
   input shift_left_in,
   input shift_right_in,
   output reg [3:0] q
);

always @(posedge clk or posedge rst)
begin
   if (rst)
       q <= 4'b0000;
   else
   begin
       case (sel)
           2'b00: q <= q;                          // Hold
           2'b01: q <= {shift_right_in, q[3:1]};   // Shift Right
           2'b10: q <= {q[2:0], shift_left_in};    // Shift Left
           2'b11: q <= parallel_in;                // Parallel Load
       endcase
   end
end

endmodule