`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2021 22:40:10
// Design Name: 
// Module Name: read_data
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


module read_data();

reg [7:0] data [0:547]; //Tablica 10 rejestrów 8 bitowych 
reg clk;

reg reset;
wire write_en;
wire [31:0]   index_out;
reg [7:0] input_character;
integer i;   
    
    
initial $readmemh("ASCII_hex.dat", data);

initial begin
    //Reset module
    //$display("Reset");
    reset = 1'b1;
    #5;
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
    reset = 1'b0;
    //$display("Test start");
    //End of Reset procedure
    
	for(i=0; i<548; i=i+1) begin
	   
        input_character = data[i];
	    clk = 1'b1;
	    #5;
		clk = 1'b0;
		$display("%d: DataIn:%h WriteEn: %b IndexOut: %d",i , data[i], write_en, index_out);
		$display("%b %d",write_en, index_out); 
		#5;
		
	end	

    
	
end




endmodule
