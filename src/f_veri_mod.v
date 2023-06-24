//ECE6370
//LAB 1
//Author: Yuan Tian (1675170)
//Hexdecimal_F_Verify
//This module is design for verify if the sum of two numbers input by
//two players add up to 15(hex f). If sum is 15, the green lED will
//light up, whose signal will be '1', otherwise the red LED light up



module f_veri_mod (
	//input
	sum_f,
	clk,
	clear,
	rst,
	//output
	light_r,
	light_g,
	score);
	
	input [3:0] sum_f;
	input clk, clear, rst;
	output light_r, light_g;
	output reg [3:0] score;
	reg light_r, light_g;
	reg already_count;
	always @(posedge clk) begin
	  if(rst == 0)
            begin
              light_r <= 1;
	      light_g <= 0;
	      score <= 0;
	      already_count <= 0;
	    end
	    
	  else 
	    begin
	      if(clear == 1)
	        begin
		  score <= 0;
		  already_count <= 0;
	        end
	      else
	        begin
		  if(sum_f == 4'b1111)
		    begin
			light_r <= 0;
			light_g <= 1;
			if(already_count == 0)
			  begin
			    score <= score + 1;
		    	    already_count <= 1;
			  end
		    end
		  else
		    begin
			light_r <= 1;
			light_g <= 0;
		        already_count <= 0;
		    end
	         end       
	    end
	end
endmodule
