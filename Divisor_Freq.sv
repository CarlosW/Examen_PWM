module Divisor_Freq
#(
	parameter COUNTER_BITS = 32
)
(
input clk,
input reset,
input enable,
input [COUNTER_BITS-1:0] internalClock,
input [COUNTER_BITS-1:0] freq,
output logic counting
);

logic [COUNTER_BITS-1:0] Max_Count;
//Reloj 50 Mhz

logic [COUNTER_BITS-1 : 0] Counting_reg = 0;
logic flag = 0;

assign Max_Count = internalClock/freq;

always_ff@(posedge clk or negedge reset) begin: ThisIsACounter
	if (reset == 1'b0)
		Counting_reg <= {COUNTER_BITS{1'b0}};
	else 
	begin	
		if(enable == 1'b1)
		begin
			if(Counting_reg == Max_Count)
			begin
				flag <= ~flag;
				Counting_reg <= {COUNTER_BITS{1'b0}};
			end
			else
				Counting_reg <= Counting_reg + 1'b1;
		end
		else
		Counting_reg <= Counting_reg;
	end	
end: ThisIsACounter

assign counting = flag;

endmodule
