`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2021 23:05:20
// Design Name: 
// Module Name: memory_tb
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


module memory_tb;
 reg [7:0] address;
 wire [7:0] data;
 integer i;
 
memory U(
address , // Address input
data    , // Data output
);

 
 initial begin
   address = 0;
   for (i = 0; i < 1000; i = i +1 )begin
        # 5 address = i;
        $monitor ("address = %d, data = %h", address, data);
   end
 end
 
endmodule
