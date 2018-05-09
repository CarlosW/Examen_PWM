module PWM
#(
	parameter WORD_LENGTH = 8,
	parameter FREQ_LENGTH = 2,
	parameter DATA_LENGTH = 32
)

(
	// Input Ports
	input clk,
	input reset,
	input start,
	input [WORD_LENGTH-1:0] dutyCycle,
	input [FREQ_LENGTH-1:0] frequency,
	

	output pwm_output



);

wire [WORD_LENGTH-1:0] dutyCycle_wire;
wire [FREQ_LENGTH-1:0] frequency_wire;
wire [DATA_LENGTH-1:0] frequency_shifted;

wire freq_to_PWM;
wire PWM_to_Gen;

Register
#(
	WORD_LENGTH
)
RegistroDuty
(
	.reset(reset),
	.clk(clk),
	.enable(start),
	.Data_In(dutyCycle),
	
	.Data_Out(dutyCycle_wire)
);

Register
#(
	FREQ_LENGTH
)
Registrofreq
(
	.reset(reset),
	.clk(clk),
	.enable(start),
	.Data_In(frequency),
	
	.Data_Out(frequency_wire)
);

ShiftRight
Shifter
(
	.Data_In(10000000), //frecuencia de 10MHz
	.shift(frequency_wire),
	
	.Data_Out(frequency_shifted)
	
);

//Divisor_Freq
//Divisor_Frecuencia
//(
//	.clk(clk),
//	.reset(reset),
//	.enable(start),
//	.internalClock(25000000),
//	.freq(10000),
//	
//	.counting(freq_to_PWM)
//	
//);
//
//Divisor_Freq
//Frecuencia_PWM
//(
//	.clk(clk),
//	.reset(reset),
//	.enable(freq_to_PWM),
//	.internalClock(10000),
//	.freq(frequency_shifted),
//	
//	.counting(PWM_to_Gen)
//	
//);

Generador_PWM
Generador_PWM
(
	.clk(clk),
	.reset(reset),
	.freq(frequency_shifted),
	.dutyCycle(dutyCycle_wire),
	
	.PWM_Gen(pwm_output)
);

endmodule 