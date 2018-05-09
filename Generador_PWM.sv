module Generador_PWM
#(
	parameter FREQ_LENGTH =32,
	parameter WORD_LENGTH = 8
)
(
	input clk,
	input reset,
	input [FREQ_LENGTH-1:0] freq,
	input [WORD_LENGTH-1:0]dutyCycle,
	
	output PWM_Gen
);

logic duty_log;
logic freq_log;
logic PWM_log;

assign duty_log = 255/dutyCycle;
assign freq_log = 50000000/freq;

always_ff@(posedge clk or negedge reset) begin: ThisIsARegister
	if(reset == 1'b0) begin
		PWM_log = 1'b0;
	end
	else
		PWM_log = freq_log/duty_log;
		

end: ThisIsARegister

assign PWM_Gen = PWM_log;

endmodule 