`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2021 21:48:19
// Design Name: 
// Module Name: fifo
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


module fifo(
	clk,
	rst_n,
	data_in,
	wr,
	rd,
	full,
	empty,
	data_out,
	fifo_cnt);

	input clk;
	input rst_n;
	input [7:0] data_in;
	input wr;
	input rd;
	output full;
	output empty;
	output [7:0] data_out;
	output [3:0] fifo_cnt;

	wire clk;
	wire rst_n;
	wire [7:0] data_in;
	wire wr;
	wire rd;
	wire full;
	wire empty;
	reg [7:0] data_out;
	reg [3:0] fifo_cnt;

	`define DEL 1 // Clock-to-output delay
	
	reg [7:0] fifo_ram[0:7];  // fifo_ram initialized
	reg [2:0] rd_ptr;  // Read pointer
	reg [2:0] wr_ptr;  // Write pointer 
	
	assign empty = ( fifo_cnt == 0 ) ? 1 : 0;  //Empty signal
	assign full  = ( fifo_cnt == 8 ) ? 1 : 0;  //Full signal
	
	// fifo_cnt changed
	// While rd is valid, cnt--
	// While wr is valid, cnt++
	always @( posedge clk or negedge rst_n) begin
	  if( ~rst_n ) begin
	    fifo_cnt <= #`DEL 4'h0;
	  end
	  else if( rd && ~wr ) begin
	    fifo_cnt <= #`DEL fifo_cnt - 1;
	  end
	  else if( ~rd && wr ) begin
	    fifo_cnt <= #`DEL fifo_cnt + 1;
	  end
	  else begin 
	    fifo_cnt <= fifo_cnt;
	  end
	end      
	
	// Increment of rd_ptr 
	// Check if the read pointer has gone beyond the depth of fifo  
	always @( posedge clk or negedge rst_n) begin
	  if( ~rst_n ) begin
	    rd_ptr <= #`DEL 3'h0;
	  end
	  else if( rd ) begin
	    if( rd_ptr == 3'h7 ) begin
	      rd_ptr <= #`DEL 3'h0;
	    end
	    else begin
	      rd_ptr <= #`DEL rd_ptr +1;
	    end
	  end
	  else begin
	    rd_ptr <= rd_ptr;
	  end
	end    
	
	// Increment of wr_ptr 
	// Check if the write pointer has gone beyond the depth of fifo  
	always @( posedge clk or negedge rst_n) begin
	  if( ~rst_n ) begin
	    wr_ptr <= #`DEL 3'h0;
	  end
	  else if( wr ) begin
	    if( wr_ptr == 3'h7 ) begin
	      wr_ptr <= #`DEL 3'h0;
	    end
	    else begin
	      wr_ptr <= #`DEL wr_ptr +1;
	    end
	  end
	  else begin
	    wr_ptr <= wr_ptr;
	  end
	end 
	
	//
	// Deal with the data 
	//
	always @( posedge clk or negedge rst_n) begin
	  if( ~rst_n ) begin
	    data_out <= #`DEL 8'h0;
	  end
	  else if( wr ) begin
	    fifo_ram[wr_ptr] <= #`DEL data_in;
	  end
	  else if( rd ) begin 
	    data_out <= #`DEL fifo_ram[rd_ptr];
	  end
	end      
	
	
endmodule    //fifo
