`timescale 1ns / 1ps

/*
The program counter, which is part of the control unit, counts from 0000 to 1111
 
 Cp   = high to Increment Count
 Ep   = high to put output to bus

*/
module program_counter(
input					clk_n,
						cp,
						ep,
						clr_n,
			
output 	[3:0]		w_bus
    );

reg		[3:0]		count;

initial
begin
	count<=4'b0000;
end

always @(negedge clk_n or negedge clr_n )
begin
	if(clr_n==1'b0)
		begin
			count<=4'b0;
		end
	else if(cp==1'b1)	
		begin
			count	<=	(count==4'b1111)?   4'b0000 : (count+1'b1);
		end
	else
		begin
		count<=count;
		end

end

assign w_bus=(ep==1'b1)?  count : 4'bzzzz;

endmodule
