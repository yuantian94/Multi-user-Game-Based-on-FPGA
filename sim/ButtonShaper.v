//ECE 6370
//Homework 5
//Author: YUAN TIAN(5170)
//This module is designed to be a button
//shaper for the physical button existing on
//the FPGA Board. This module helps to generate
//single pulse when physical button is pushed

module ButtonShaper (b_in, clk, rst, b_out);

	input b_in, clk, rst;
	output b_out;
	reg b_out;

	parameter INIT=0, PULSE = 1, WAIT = 2;
	reg [1:0] state, nextstate;

	always @(state, b_in)
	     begin
		case(state)  
			  INIT:
			    begin
			      b_out <= 1'b0;
			      if(b_in == 1'b1)
			        begin
				  nextstate <= INIT;
				end
			      else
			        begin
                                  nextstate <= PULSE;
				end
			    end
			  
			  PULSE:
			    begin
			      b_out <= 1'b1;
			      nextstate <= WAIT;
			    end
			  
			  WAIT:
			    begin
			      b_out <= 1'b0;
			      if(b_in == 1'b1)
			        begin
				  nextstate <= INIT;
				end
			      else
			        begin
                                  nextstate <= WAIT;
				end
			    end
			  default:
			    begin
			      	  b_out <= 1'b0;
				  nextstate <= INIT;
			    end
		  endcase
              end
	always @(posedge clk)
		begin
			if(rst == 0)
			  begin
			    state <= INIT;
			  end
			else
			  begin
			    state <= nextstate;
			  end
		end
endmodule
