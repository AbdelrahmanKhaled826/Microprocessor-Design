`timescale 1ns / 1ps


module memory_addres_register(

input wire				clk,
input	wire				lm_n,  //load in memory
input	wire	[3:0]		w_bus,

output wire	[3:0]		ram_addres
    
    );

reg			[3:0]		register;

always @(posedge clk)
begin
	if(lm_n ==1'b0)
		begin
			register<=w_bus;
		end
	else
		begin
			register<=register;
		end

end


assign ram_addres =register;
endmodule
