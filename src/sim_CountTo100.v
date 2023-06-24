
module CountTo100( rst, clear_time, clk, pulse_in, pulse_out);
input pulse_in, clear_time, rst, clk;
output pulse_out;
reg [6:0] count;
reg pulse_out;

always@ (posedge clk)
	if(rst == 0) begin
	  count <= 0;
	  pulse_out <= 0;
	end
	else if(clear_time == 1) begin
	  count <= 0;
	  pulse_out <= 0;	  
	end
	else begin
	  if(pulse_in == 1)begin
	    if(count == 100)begin
	      count <= 0;
			pulse_out <= 1;
	    end
	    else begin
	    count <= count + 1;
		 pulse_out <= 0;
	    end
	  end
	  else begin
	    pulse_out <= 0;
	  end
	end
endmodule