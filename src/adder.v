
//ECE6370
//LAB 1
//Author: Yuan Tian (1675170)
//4 bit adder
//This module is design for performing the
//addition operation of two 4-bit binary number

module adder (in1, in2, sum1);
	input [3:0] in1,in2;
	output [3:0] sum1;
	reg [3:0] sum1;

	always @(in1, in2)
		begin
			sum1= in1 + in2;
		end
endmodule	