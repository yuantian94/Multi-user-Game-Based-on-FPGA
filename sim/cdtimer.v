module cdtimer(rst, clear_digit, clk, decrement_in, No_borrow_in, reconfig, num_in, decrement_out, num_out, No_borrow_out);
input rst, clk, decrement_in, reconfig, No_borrow_in, clear_digit;
input [3:0]num_in;
output decrement_out, No_borrow_out;
output [3:0]num_out;
reg decrement_out, No_borrow_out;
reg [3:0]num_out;

	always@(posedge clk) begin
	  if (rst == 0) begin
	    num_out <= 0;
	    decrement_out <= 0;
	    No_borrow_out <= 0;
	  end
	  
	  else if (clear_digit == 1) begin
	    num_out <= 0;
	    decrement_out <= 0;
	    No_borrow_out <= 0;
	  end
	  else begin    
	    No_borrow_out <= 0;
	    if(reconfig == 1) begin

	      if(num_in > 9)begin
	      num_out <= 9;
	      end
	      else if(num_in == 0)begin
		    num_out <= num_in;
	      end
	      else begin
		    num_out <= num_in;
	      end
	    end
	    else begin
	     if(decrement_in == 1) begin
	       if(num_out != 0) begin
		 num_out <= num_out - 1;
	       end
	       else begin
		 if(No_borrow_in == 0) begin
		   num_out <= 9;
		   decrement_out <= 1;
		 end
		 else begin
		   decrement_out <= 0;
		   No_borrow_out <= 1;
		 end
	       end		  
	      end	  
	     else begin
	       if(num_out == 0 && No_borrow_in == 1)begin

	       No_borrow_out <= 1;
	       end
	       num_out <= num_out;
	       decrement_out <= 0;
	     end
           end
	  end
	end
endmodule  
