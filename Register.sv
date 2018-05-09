module Register
#(
	parameter WORD_LENGTH = 8
)
(
	input reset,
	input clk,
	input enable, 
	input [WORD_LENGTH - 1:0] Data_In,
	output [WORD_LENGTH - 1:0] Data_Out
);

logic [WORD_LENGTH - 1:0] register;
 
always_ff @(posedge clk, negedge reset) begin: ThisIsARegister
	
	if (reset == 1'b0)
		register <= 0;
	else if(enable) 
		register <= Data_In;
end: ThisIsARegister

assign Data_Out = register;

endmodule
