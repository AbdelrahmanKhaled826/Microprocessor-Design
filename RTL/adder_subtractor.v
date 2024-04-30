`timescale 1ns / 1ps


// Su -> subtraction operation enable bit, high to convert
// B Register output to 2's complement form

// Eu -> high to put arithmetic operation result on WBus
module adder_subtractor(
input wire				su,
input wire				eu,
input wire	[7:0]		accumlator_out,
input wire	[7:0]		register_b_out,

output wire	[7:0]		w_bus

    );
    
 reg			[7:0]		out;
 reg						carry;
 
 
 always @(*)
 begin
	if(su==1'b0)
		begin
				{carry,out}={1'b1,accumlator_out}+{1'b1,register_b_out};
		end
	else	
		begin
				
				{carry,out}={1'b1,accumlator_out}-{1'b1,register_b_out};
		end
end

assign w_bus = (eu==1'b1)? out:8'bzzzz_zzzz;
endmodule
