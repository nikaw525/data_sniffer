`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2021 23:51:10
// Design Name: 
// Module Name: NumberChecker
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


module NumberChecker(
    input wire clk,
    input wire reset,
    input wire [7:0] character_in,
    output reg [7:0] character_out,
    output reg [31:0] index,
    output reg is_number,
    output reg is_space,
    output reg is_plus,
    output reg is_dash,
    output reg is_other
    );
    
    localparam ASCII_NUMBER_0 = 8'h30, ASCII_NUMBER_9 = 8'h39;
    
    reg [31:0] index_nxt = 0;
    reg is_number_nxt;
    reg is_space_nxt;
    reg is_plus_nxt;
    reg is_dash_nxt;
    reg is_other_nxt;
    reg [7:0] character_nxt; 
    
always @(posedge reset or posedge clk)
begin
    if(reset)
    begin
        character_out <= 0;
        index <= 0;
    end
    else
    begin
        character_out <=  character_nxt;
        index <= index_nxt;
        is_number <= is_number_nxt;
        is_space <= is_space_nxt;
        is_plus <= is_plus_nxt;
        is_dash <= is_dash_nxt;
        is_other <= is_other_nxt;
    end
end

always @*
begin
    if((character_in - ASCII_NUMBER_0 <= 9) && (character_in - ASCII_NUMBER_0 >= 0))
    begin
        is_number_nxt = 1;
        is_space_nxt = 0;
        is_plus_nxt = 0;
        is_dash_nxt = 0;
        is_other_nxt = 0;
        character_nxt = character_in;
    end
    else if(character_in == 7'h20)
    begin
        is_space_nxt = 1;
        is_number_nxt = 0;
        is_plus_nxt = 0;
        is_dash_nxt = 0;
        is_other_nxt = 0;
        character_nxt = character_in;
    end
    else if(character_in == 7'h2B)
    begin
        is_plus_nxt = 1;
        is_space_nxt = 0;
        is_number_nxt = 0;        
        is_dash_nxt = 0;
        is_other_nxt = 0;
        character_nxt = character_in;
    end
    else if(character_in == 7'h2D)
    begin
        is_dash_nxt = 1;
        is_plus_nxt = 0;
        is_space_nxt = 0;
        is_number_nxt = 0; 
        is_other_nxt = 0;     
        character_nxt = character_in;
    end
    else
    begin 
        is_other_nxt = 1;
        is_number_nxt = 0;
        is_space_nxt = 0;       
        is_plus_nxt = 0;
        is_dash_nxt = 0;
        character_nxt = character_in;
    end
    index_nxt = index_nxt + 1;
end 
    
    
endmodule
