`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2021 22:51:16
// Design Name: 
// Module Name: memory
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


/*
	@description		-> pamiêæ dwuportowa (posiada dwa adresy i dwa wyjœcia)

	@param dlength 	-> d³ugoœæ pojedynczego s³owa/danej w pamiêci
	@param depth		-> liczba s³ów/danych w pamiêci
	@param add_length	-> rozmiar magistrali adresowej
	
	@input clk 			-> sygna³ zegarowy
	@input wr			-> zapis do pamiêci
	@input din			-> dane wejœciowe pamiêci
	@input addressa	-> pierwsze wejœcie adresowe
	@input addressb	-> drugie wejœcie adresowe
	
	@output douta		-> pierwsze wyjœcie pamiêci
	@output doutb		-> drugie wyjœcie pamiêci

*/

module memory(
address,
data,
);

input [7:0] address;
input [7:0] data;

reg [7:0] mem [0:255];


assign data = mem[address];

initial begin
   $readmemh("D:\\Na_uczelnie\\Magisterka\\Semestr_1\\SDUP\\Project\\repo\\Data_sniffer_v2\\ASCII_hex.dat", mem);
end

endmodule 
