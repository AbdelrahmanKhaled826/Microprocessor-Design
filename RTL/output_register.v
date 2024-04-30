`timescale 1ns / 1ps

module output_register(
input	wire				clk,
input	wire				lo_n,


input	wire	[7:0]		w_bus,

output wire	[7:0]		binary_display
    );

reg		[7:0]		output_reg=8'b0000_0000;
always @(posedge clk)
begin
	if(lo_n==1'b0)
		begin
			output_reg<=w_bus;
		end
	else
		begin
			output_reg<=8'b0000_0000;
		end
		
		
end


assign   binary_display     = output_reg;


endmodule
