`timescale 1ns / 1ps

module register_b(
input	wire				clk,
input	wire				lb_n,


input	wire	[7:0]		w_bus,

output wire	[7:0]		alu
    );

reg		[7:0]		register_reg=8'b0000_0000;
always @(posedge clk)
begin
	if(lb_n==1'b0)
		begin
			register_reg<=w_bus;
		end
	else
		begin
			//register_reg<=8'b0000_0000;
			register_reg<=register_reg;
		end
		
		
end


assign   alu     = register_reg;
endmodule
