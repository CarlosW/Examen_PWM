module PWM_TB;

parameter FREQ_LENGTH = 2;
parameter WORD_LENGTH = 8;

	reg clk=0;
	reg reset;
	reg start;
	reg [WORD_LENGTH-1:0] dutyCycle;
	reg [FREQ_LENGTH-1:0] frequency;
	

	wire pwm_output;



PWM

DUT
(
	.clk(clk),
	.reset(reset),
	.start(start),
	.dutyCycle(dutyCycle),
	.frequency(frequency),
	
	.pwm_output(pwm_output)
);

/*********************************************************/
initial // Clock generator
  begin
    forever #10 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	#50 reset = 1;
end

/*********************************************************/
initial begin // enable
	#0 start = 0;
	#100 start = 1;
	 dutyCycle = 8'b00001111;
	 frequency = 2'b01;

end



/*********************************************************/


endmodule 