module Generador_PWM
#(
	parameter FREQ_LENGTH =32,
	parameter WORD_LENGTH = 8
)
(
	input clk,
	input reset,
	input enable,
	input [FREQ_LENGTH-1:0] freq,
	input [WORD_LENGTH-1:0]dutyCycle,
	
	output PWM_Gen
);

logic [FREQ_LENGTH:0] counter;
logic duty_log;
logic freq_log;
logic PWM_log;
logic counter_value;

assign duty_log = 255/dutyCycle;
assign freq_log = (50000000*2)/freq;

assign counter_value = freq_log/duty_log;

always_ff@(posedge clk or negedge reset) begin: ThisIsARegister
	if(reset == 1'b0) begin
		PWM_log = 1'b0;
	end
	else
		if (enable) begin
		if (counter == counter_value) begin 
			PWM_log <= ~PWM_log;
			counter <= 0;
		end
		else
			counter <= counter + 1;
	end
		

end: ThisIsARegister

assign PWM_Gen = PWM_log;

endmodule 