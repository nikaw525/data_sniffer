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
    input wire [7:0] input_char, 
    output reg state_out
    );
    
integer counter = 1;

reg [7:0] output_char;
reg [31:0] index;
reg is_number;
reg is_sapce;
reg is_plus;
reg is_dash;
reg is_other;

reg [31:0] start_index;

NumberChecker num_1 (.clk(clk),
                      .reset(reset),
                      .character_in(input_char),
                      .character_out(output_char),
                      .index(index),
                      .is_number(is_number),
                      .is_space(is_space),
                      .is_plus(is_plus),
                      .is_dash(is_dash),
                      .is_other(is_other)
                      );

assign state_out = state;

//FSM
enum {IDLE=0, NUMBER_CHECK, PHONE_NR_1, PHONE_NR_2, ACCOUNT_NR} state;

always_ff @(posedge clk) begin: fsm
        case(state)
                IDLE: begin                                       
                    if(reset == 1'b1) begin
                        state <= IDLE;
                    end else begin
                        if(is_number == 1'b1) begin
                            //$display("IDLE: Number = %h, index = %d, is_number = %h, counter = %d",output_char,  index, is_number, counter);
                            start_index <= index; 
                            counter <= counter + 1;                           
                            state <= NUMBER_CHECK;
                        end
                        else if(is_plus == 1'b1) begin
                            start_index <= index;
                            counter <= counter + 1;
                            state <= PHONE_NR_1;
                        end                    
                    end
                 end
                 
                 NUMBER_CHECK: begin  
                    if(is_other == 1'b1 & counter == 7) begin   //123456 
                        //indeks_nr
                        $display("Indeks number, index = %d", index);
                        counter = 1;
                        state <= IDLE;
                    end  
                    if(is_other == 1'b1 & counter == 10) begin  //123456789
                        //phone_nr
                        $display("Phone number, index = %d", index);
                        counter = 1;
                        state <= IDLE;
                    end                                   
                    else if(is_other == 1'b1 & counter == 12) begin //45826896441
                        //pesel
                        $display("Pesel number, index = %d", index); 
                        counter = 1;
                        state <= IDLE;                        
                    end
                    else if(is_other == 1'b1 & counter == 27) begin //87101013970055002221000000
                        //account_nr
                        $display("Account number, index = %d", index);
                        counter = 1;
                        state <= IDLE;                         
                    end                     
                    else if((is_space == 1'b1 | is_dash == 1'b1) & counter == 4) begin                            
                        counter <= counter + 1;
                        state <= PHONE_NR_2;
                    end
                    else if(is_space == 1'b1 & counter == 3) begin
                        state <= ACCOUNT_NR;
                        counter <= counter + 1;
                        //$display("CHECKER: Special char = %h, index = %d, is_number = %h, counter = %d",output_char,  index, is_number, counter);
                    end                    
                    else if(is_number == 1'b1) begin
                        //$display("CHECKER: Number = %h, index = %d, is_number = %h, counter = %d",output_char,  index, is_number, counter);
                        counter <= counter + 1;
                    end
                    else begin
                        counter = 1;
                        state <= IDLE;
                    end   
                end
                                
                ACCOUNT_NR: begin
                    if(is_number == 1'b1 
                    & (counter == 4 | counter == 5 | counter == 6 | counter == 7 | counter == 9 | counter == 10 
                    | counter == 11 | counter == 12 | counter == 14 | counter == 15 | counter == 16 | counter == 17
                    | counter == 19 | counter == 20 | counter == 21 | counter == 22 | counter == 24 | counter == 25  
                    | counter == 26 | counter == 27 | counter == 29 | counter == 30 | counter == 31 | counter == 32) 
                    | (is_space == 1'b1 & (counter == 8 | counter == 13 | counter == 18 | counter ==  23 | counter == 28)))begin 
                        counter <= counter + 1; //87 1010 1397 0055 0022 2100 0000
                        state <= ACCOUNT_NR;                    
                    end
                    else if(counter == 33) begin
                        //account_nr
                        $display("Account number, index = %d", index);
                        state <= IDLE;
                        counter = 1;
                    end
                    else begin
                        counter = 1;
                        state <= IDLE;
                    end                    
                end
                
                PHONE_NR_2: begin
                    if((is_number == 1'b1 & (counter == 5 | counter == 6 | counter == 7 | counter == 9 | counter == 10 | counter == 11))
                    || ((is_dash == 1'b1 | is_space == 1'b1) & (counter == 4 | counter == 8)))begin //123 123 456 or 123-456-789
                        counter <= counter + 1;
                        state <= PHONE_NR_2;
                    end
                    else if(counter == 12) begin
                        //phone_nr
                        $display("Phone number, index = %d", index);
                        state <= IDLE;
                        counter = 1;
                    end
                    else begin
                        counter = 1;
                        state <= IDLE;
                    end  
                end
                
                PHONE_NR_1: begin
                    if(is_number == 1'b1  
                    & (counter == 2 | counter == 3 | counter == 4 | counter == 5 | counter == 6
                    | counter == 7 | counter == 8 | counter == 9 | counter == 10 | counter == 11 
                    | counter == 12 | counter == 13))begin  //+48 123 456 789
                        counter <= counter + 1;
                        state <= PHONE_NR_1;
                    end
                    else if(counter == 13) begin
                        //phone_nr
                        $display("Phone number, index = %d", index);
                        state <= IDLE;
                        counter = 1;
                    end
                    else if((is_number == 1'b1 
                    & (counter == 2 | counter == 3 | counter == 5 | counter == 6 | counter == 7 | counter == 9 
                    | counter == 10 | counter == 11 | counter == 13 | counter == 14 | counter == 15))
                    | (is_space == 1'b1 & (counter == 4 | counter == 8 | counter == 12)))begin //+48123456789
                        counter <= counter + 1;
                        state <= PHONE_NR_1;
                    end
                    else if(counter == 16) begin
                        //phone_nr
                        $display("Phone number, index = %d", index);
                        state <= IDLE;
                        counter = 1;
                    end
                    else begin
                        counter = 1;
                        state <= IDLE;
                    end 
                end
           endcase
 end: fsm

endmodule
