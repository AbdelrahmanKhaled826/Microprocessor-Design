`timescale 1ns / 1ps


module ring_counter(
input 	wire			clk,
input 	wire			clr_n,

output reg		[5:0]	state
    );

  
    initial
    begin
      state <= 6'b00001;
    end
    
    always @(negedge clk or negedge clr_n)
    begin
	if(clr_n==1'b0)
		begin
			state<=6'b000001;
		end
	else
		begin
			case(state)
			6'b000001:	begin	
					state<=6'b000010;	
					end
						
			6'b000010:	begin	
					state<=6'b000100;	
					end
			
			6'b000100:	begin	
					state<=6'b001000;	
					end
			
			6'b001000:	begin	
					state<=6'b010000;	
					end
			
			6'b010000:	begin	
					state<=6'b100000;	
					end
			default      :	begin	
					state<=6'b000001;	
					end		
			endcase		
		end
    end

endmodule


/*
//=================================work at 5 cycle ========================

module ring_counter(
input 	wire			clk,
input 	wire			clr_n,

output reg		[4:0]	state
    );

  
    initial
    begin
      state <= 5'b00001;
    end
    
    always @(negedge clk or negedge clr_n)
    begin
	if(clr_n==1'b0)
		begin
			state<=5'b00001;
		end
	else
		begin
			case(state)
			5'b00001:	begin	
					state<=5'b00010;	
					end
						
			5'b00010:	begin	
					state<=5'b00100;	
					end
			
			5'b000100:	begin	
					state<=5'b01000;	
					end
			
			5'b01000:	begin	
					state<=5'b10000;	
					end
			5'b10000:	begin	
					state<=5'b00001;	
					end		
			
			default      :	begin	
					state<=5'b000001;	
					end		
			endcase		
		end
    end

endmodule

*/