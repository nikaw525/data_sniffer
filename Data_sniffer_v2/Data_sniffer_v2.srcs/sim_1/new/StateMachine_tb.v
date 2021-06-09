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

wire [2:0] state;
reg [7:0] address;

integer i;
wire [28:0] index;


memory U(
address , // Address input
char_in    , // Data output
);


StateMachine UU(
    clock,
    reset,
    char_in,
    state,
    index
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
    address = 0;
end 

always@( posedge clock ) begin
     if ( reset == 1'b0 && address < 244) begin // new value arrived
        address <= address + 1; 
        if(state != 1'b0) begin
            $display("State = %h, index = %d, adres = %d", state, index, address);
        end
     end
end
 
endmodule
