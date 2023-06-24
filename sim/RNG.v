//ECE6370
//HW8
//Author: Yuan Tian (1675170)
//random number generator
//this module uses button and counter to generate a random 4-bit number 
module rng (Button, rst, clk, num_out);

	input Button, rst, clk;
	output[3:0] num_out;
	
	assign B_inverted = ~ Button;

	counter counter_1(B_inverted, rst, clk, num_out);
endmodule
