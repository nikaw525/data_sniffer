`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 19:19:42
// Design Name: 
// Module Name: bit_comparator_tb
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


module bit_comparator_tb;

 // Inputs
 reg [7:0] In1;
 reg [7:0] In2;
 // Outputs
 wire Gt;
 wire Lt;
 wire Eq;
 // Instantiate the Unit Under Test (UUT)
 bit_comparator uut (
  .In1(In1),
  .In2(In2), 
  .Gt(Gt), 
  .Lt(Lt), 
  .Eq(Eq)
 );

 initial begin
  // Initialize Inputs
  In1 = 8'b0;
  In2 = 8'b0;
  // Wait 100 ns for global reset to finish
  #100;   

  // Add stimulus here
  In1 = 8'd8;
  In2 = 8'd7;
  #20;
  In1 = 8'd100;
  In2 = 8'd120;
  #20;
  In1 = 8'd250;
  In2 = 8'd250;
  #20;
  In1 =  8'd0;
  In2 = -8'd5;
  #20;
  In1 = -8'd5;
  In2 = -8'd5;
  #20;
 end

endmodule
