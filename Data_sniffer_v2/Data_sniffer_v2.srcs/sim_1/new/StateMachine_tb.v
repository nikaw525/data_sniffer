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
wire [7:0] char_in;

wire state;
reg [7:0] address;

integer i;


memory U(
address , // Address input
char_in    , // Data output
);


StateMachine UU(
    clock,
    reset,
    char_in,
    state
);

always
begin
 clock = 1'b0;
 #5; // low for 5 * timescale = 5 ns
 clock = 1'b1;
 #5; // high for 5 * timescale = 5 ns
end


initial
begin
    reset <= 1'b0;
end 

initial begin
   address = 0;
   for (i = 0; i < 1000; i = i +1 )begin
       #10 address = i;
   end
 end

 
endmodule
