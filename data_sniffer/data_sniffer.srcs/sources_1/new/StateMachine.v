`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 20:02:47
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
    input logic clk,
    input logic[7:0] input_data,
    input logic new_data_flag,
    output logic [29:0] output_data,
    output logic [1:0] info
);

reg   Gt, Lt, Eq; 

integer counter = 0;
integer space_counter = 0;



localparam PESEL_NR_OF_DIGITS = 4'd11;
localparam PHONE_NR_OF_DIGITS = 4'd9;
localparam BANK_ACCOUNT_NR_OF_DIGITS = 5'd26;
localparam INDEX_NR_OF_DIGITS = 3'd6;

enum {IDLE=0, CHECK_BANK_ACCOUNT, CHECK_PHONE, NUMBER, PESEL, PHONE, INDEX, BANK_ACCOUNT} state;

always_ff @(posedge clk) begin: fsm
     case(state)
        IDLE: begin
                counter <= 0;
                if data jest cyfra >0x30 and <0x39
                    state <= NUMBER;

                counter <= counter + 1;
        end
        NUMBER: begin
               /* cout_number ++;
               if data jest znakiem specjalnym (spacja lub -)
                    space_counter++;
               if space_counter == 1 and cout_number == 2
                    state <= CHECK_BANK_ACCOUNT
               else if space_counter == 1 and cout_number == 3
                    state <= CHECK_PHONE
               else
                    state <= IDLE;
               
               if data nie jest cyfra <0x30 or >0x39 i nie jestem znakiem specjalnym 
                    state <= IDLE;
               */
        end
        endcase
    end: fsm
endmodule
