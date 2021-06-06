`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2021 23:58:40
// Design Name: 
// Module Name: NumberChecker_tb
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


module NumberChecker_tb();
reg clock, reset;
wire is_number;
wire [7:0] char_in;
wire [7:0] char_out;
wire [31:0] index;

reg [7:0] address;
 
integer i;

memory U(
address , // Address input
char_in    , // Data output
);

NumberChecker UU(
    clock,
    reset,
    char_in,
    char_out,
    index,
    is_number
);

//Clock generator
initial
    clock <= 1'b1;
always
    #5 clock <= ~clock;

//Reset signal
initial
begin
     address <= 0;
     reset <= 1'b1;
     #5 reset <= 1'b0;
end 

always@(posedge clock)
begin
    #10
    $display("Char = %h, is_digit = %h, index = %d", char_out, is_number, index);
    address <= address + 1;
end


endmodule
