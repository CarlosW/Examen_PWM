module ShiftRight
#(
	parameter WORD_LENGTH = 8,
	parameter OUT_LENGTH = 32,
	parameter FREQ_LENGTH = 2
)
(
	input [WORD_LENGTH-1:0] Data_In,
	input [FREQ_LENGTH-1:0] shift,
	output [OUT_LENGTH-1:0] Data_Out
);

assign Data_Out = Data_In >> shift;

endmodule
