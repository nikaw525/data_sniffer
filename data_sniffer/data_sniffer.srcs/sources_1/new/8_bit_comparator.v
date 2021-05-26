`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 18:49:22
// Design Name: 
// Module Name: 8_bit_comparator
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


module bit_comparator(In1,In2,Gt,Lt,Eq); 

input [7:0]  In1,  In2; //The two 8-bit Inputs In1 and In2 
output Gt, Lt, Eq; //The Outputs of comparison 
reg   Gt, Lt, Eq; 
always @ (In1 or In2) //Check the state of the input lines 
begin 
    Gt <= ( In1 > In2 )? 1'b1 : 1'b0; 
    Lt <= ( In1 < In2 )? 1'b1 : 1'b0; 
    Eq <= ( In1 == In2)? 1'b1 : 1'b0; 
end 
endmodule

