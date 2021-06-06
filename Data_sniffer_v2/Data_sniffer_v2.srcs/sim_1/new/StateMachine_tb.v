`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2021 13:43:48
// Design Name: 
// Module Name: StateMachine_tb
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


module StateMachine_tb();

reg clock, reset;
wire is_number;
wire [7:0] char_in;

reg [7:0] address;
 
integer i;

memory U(
address , // Address input
char_in    , // Data output
);

StateMachine UU(
    clock,
    reset,
    char_in
);

//Clock generator
initial
    clock <= 1'b1;
always
    #5 clock <= ~clock;

//Reset signal
initial
begin
     reset <= 1'b1;
     #5 reset <= 1'b0;
end 

always@(posedge clock)
begin
    #10
    address <= address + 1;
end
endmodule
