`timescale 1ns / 1ps

module ram(

input 				ce_n,					//cell enable
input		[3:0]		address,	

output 	[7:0]		w_bus

    );

reg		[7:0]	 	ram	[15:0];  
  
  
 
	 /*				Instructio
	 
	Mnemonic 			Operation 							OPCODE
	LDA 		Load addressed memory contents into accumulator	 	0000
	ADD		 Add addressed memory contents to accumulator	 	0001
	SUB		 Subtract addressed memory contents from accumulator 	0010
	OUT		 Load accumulator data into output register			 1110
	HLT 		Stop processing								 1111
	 */
  
initial 
begin
	 //		Instructio
	ram	[4'b0000]=	8'b0000_0101;
	ram	[4'b0001]=	8'b0001_1010;
	ram	[4'b0010]=	8'b0010_1100;
	ram	[4'b0011]=	8'b1110_xxxx;
	ram	[4'b0100]=	8'b1111_xxxx;
	
	
	//		data
	ram	[4'b0101] = 8'b1010_1010; 	 
	ram	[4'b0110] = 8'b0001_0001; 	
	ram	[4'b0111] = 8'b0010_0010; 	
	ram	[4'b1000] = 8'b0011_0011;	
	ram	[4'b1001] = 8'b0000_0100;	
	ram	[4'b1010] = 8'b0101_0101;	
	ram	[4'b1011] = 8'b0000_0110;	
	ram	[4'b1100] = 8'b0111_0111;	
	ram	[4'b1101] = 8'b1000_1000;	
	ram	[4'b1110] = 8'b1001_1001;	
	ram	[4'b1111] = 8'b1010_1010;	
	                                         

end

assign  w_bus =	(ce_n==1'b0)?      ram[address] : 8'bzzzz_zzzz;	 

endmodule
