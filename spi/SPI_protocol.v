`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2026 08:28:11 AM
// Design Name: 
// Module Name: SPI_protocol
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


module SPI_protocol(
       input wire clk,
input wire rst,
input wire start,
input wire cshold,
input wire miso, 
input wire wdelay_enable,
input wire [7:0]data_tx,
output reg mosi,
output reg sclk,
output reg cs,
output reg [7:0]data_rx,
output reg done
);

parameter c2t_d = 4;
parameter t2c_d = 4;
parameter w_delay = 6;

reg [7:0] tx_shift, rx_shift;
reg [2:0] bit_cnt;
reg [7:0] delay_cnt;
reg [2:0] state;

localparam IDLE     = 3'd0,
        CS_SETUP = 3'd1,
        TRANSFER = 3'd2,
        CS_HOLD  = 3'd3,
        WAIT_SPI = 3'd4; 
        
reg clk_div;

always @(posedge clk) begin
 if(rst)
     clk_div <= 1'b0;
 else
     clk_div <= ~clk_div;
end

always @(posedge clk_div) begin
 if(rst) begin
     cs <= 1'b1;
     mosi <= 1'b0;
     done <= 1'b0;
     sclk <= 1'b0;
     data_rx <= 8'd0;
     tx_shift <= 8'd0;
     rx_shift <= 8'd0;
     bit_cnt <= 3'd0;
     delay_cnt <= 8'd0;
     state <= IDLE;
 end
 else begin
     case(state)
        
         IDLE: begin
             done <= 1'b0;
             sclk <= 1'b0;

             if(start) begin
                 cs <= 1'b0;
                 tx_shift <= data_tx;
                 rx_shift <= 8'd0;
                 bit_cnt <= 3'd7;
                 delay_cnt <= c2t_d;

                 // First MOSI bit is made ready before clock starts
                 mosi <= data_tx[7];

                 state <= CS_SETUP;
             end
         end
            
         CS_SETUP: begin
             if(delay_cnt == 0) begin 
                 state <= TRANSFER;
             end
             else begin
                 delay_cnt <= delay_cnt - 1'b1;
             end
         end
       
         TRANSFER: begin
             sclk <= ~sclk;

             // When old sclk = 0, new sclk becomes 1
             // Sample MISO on rising edge
             if(sclk == 1'b0) begin
                 rx_shift[bit_cnt] <= miso;
             end

             // When old sclk = 1, new sclk becomes 0
             // Prepare next MOSI bit on falling edge
             else begin
                 if(bit_cnt == 0) begin
                     sclk <= 1'b0;
                     delay_cnt <= t2c_d;

                     if(wdelay_enable)
                         state <= WAIT_SPI;
                     else
                         state <= CS_HOLD;
                 end
                 else begin
                     bit_cnt <= bit_cnt - 1'b1;
                     mosi <= tx_shift[bit_cnt - 1'b1];
                 end
             end
         end
             
         WAIT_SPI: begin
             sclk <= 1'b0;

             if(delay_cnt == 0) begin
                 delay_cnt <= w_delay;
                 state <= CS_HOLD;
             end
             else begin
                 delay_cnt <= delay_cnt - 1'b1;
             end
         end

         CS_HOLD: begin
             sclk <= 1'b0;

             if(delay_cnt == 0) begin
                 if(cshold == 1'b0)
                     cs <= 1'b1;
                 else
                     cs <= 1'b0;

                 data_rx <= rx_shift; 
                 done <= 1'b1;
                 state <= IDLE;
             end
             else begin
                 delay_cnt <= delay_cnt - 1'b1;
             end
         end
       
         default: begin
             state <= IDLE;
         end

     endcase      
 end
end

endmodule