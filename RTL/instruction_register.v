`timescale 1ns / 1ps


/*
li :low to load instructions from wbus
ei:low to put lower part of instruction (data partion) in wbus
*/

module instruction_register(

input 				clk,
input					clr_n,
input					li_n,
input					ei_n,
input		[7:0]		w_bus,

output	[3:0]		address,
output	[3:0]		op_code

    );


reg 		[7:0] 	ir ;

always @(posedge clk )
begin
	if(clr_n==1'b0)
		begin
			ir <= 8'b0000_0000;
		end
	else if(li_n==1'b0)
		begin
			ir<=w_bus;
		end	
	else
		begin
			ir <= ir;
		end
	
end		

assign   address  = (ei_n==1'b0)?    ir[3:0]:4'bzzzz;

assign   op_code=  ir[7:4];


endmodule
