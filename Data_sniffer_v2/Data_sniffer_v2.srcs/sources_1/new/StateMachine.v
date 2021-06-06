`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2021 12:55:23
// Design Name: 
// Module Name: StateMachine
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
module StateMachine(
    input wire clk,
    input wire reset,
    input wire [7:0] input_char
    );
    
integer counter = 0;
integer special_char_counter = 0;

reg [7:0] output_char;
reg [31:0] index;
reg is_number;

reg [31:0] start_index;

NumberChecker num_1 (.clk(clk),
                      .reset(reset),
                      .character_in(input_char),
                      .character_out(output_char),
                      .index(index),
                      .is_number(is_number)
                      );
//FSM
enum {IDLE=0, NUMBER_CHECK} state;

    always_ff @(posedge clk) begin: fsm
        case(state)
                IDLE: begin
                    if(reset == 1'b1) begin
                        state <= IDLE;
                    end else begin
                        if(is_number == 1'b1) begin
                            $display("Number = %h, index = %h",character_out,  index);
                            start_index <= index;
                            counter <= counter + 1;
                            state <= NUMBER_CHECK;
                        end
                    end
                 end
                 NUMBER_CHECK: begin
                   if(is_number == 1'b1) begin
                        $display("Number = %h, index = %h",character_out,  index);
                        counter <= counter + 1;
                    end else begin
                        state <= IDLE;
                    end   
                end 
           endcase
 end: fsm

endmodule
