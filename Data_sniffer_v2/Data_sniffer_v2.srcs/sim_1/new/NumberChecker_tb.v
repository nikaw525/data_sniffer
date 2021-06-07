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


//Reset signal
initial
begin
     reset <= 1'b1;
     #5 reset <= 1'b0;
end 

initial begin
   address = 0;
   #10 $monitor ("address = %h, data = %h", address, data);
   for (i = 0; i < 99; i = i +1 )begin
        # 5 address = i;
        $display("%h", data); 
   end
 end

endmodule
