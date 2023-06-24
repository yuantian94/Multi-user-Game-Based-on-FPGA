//ECE6370
//HW8
//Author: Yuan Tian (1675170)
//Button Counter
//After the user presses the button, the counter will increment by 1 for each posedge

module counter(B, rst, clk, count);
	input B, rst, clk;
	output[3:0] count;
	reg[3:0] count;
	
	always @(posedge clk)
	  begin
	    if (rst == 0)
	      begin
	        count <= 0;
	      end
	    else
	      begin
	        if (B == 1)
		  begin
	            if ((count == 16) | (count > 16))
	              begin
		        count <= 0;
		      end
	            else
		      begin
		        count <= count + 1;
		      end
		  end
	        else
		   begin
		  //doing nothing
		   end 
	      end
	   end
endmodule
