
module Timer1ms(enable, clear_time, rst, clk, pulse);
input enable, clear_time, clk, rst;
output pulse;
reg [15:0] count;
reg pulse;


always@ (posedge clk)
	if(rst == 0) begin
	  count <= 0;
	  pulse <= 0;
	end
	else if(clear_time == 1) begin
	  count <= 0;
	  pulse <= 0;	  
	end
        else begin
	  if (enable == 1) begin
	    if(count == 50000) begin
	      count <= 0;
		   pulse <= 1;
	    end
	    else begin
	      count <= count + 1;
		   pulse <= 0;
	    end
	  end
	  else begin
	    count <= 0;
	    pulse <= 0;
	  end
   end
endmodule
		