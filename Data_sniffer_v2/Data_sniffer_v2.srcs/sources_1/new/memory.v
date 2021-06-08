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
	@description		-> pami�� dwuportowa (posiada dwa adresy i dwa wyj�cia)

	@param dlength 	-> d�ugo�� pojedynczego s�owa/danej w pami�ci
	@param depth		-> liczba s��w/danych w pami�ci
	@param add_length	-> rozmiar magistrali adresowej
	
	@input clk 			-> sygna� zegarowy
	@input wr			-> zapis do pami�ci
	@input din			-> dane wej�ciowe pami�ci
	@input addressa	-> pierwsze wej�cie adresowe
	@input addressb	-> drugie wej�cie adresowe
	
	@output douta		-> pierwsze wyj�cie pami�ci
	@output doutb		-> drugie wyj�cie pami�ci

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
