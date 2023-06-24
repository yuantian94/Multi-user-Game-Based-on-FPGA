// ECE6370
// Homework 4
// Author: Yuan Tian
// load register HW4
module LoadReg ( clk, rst, load, clear, in4bit, out4bit );

input clk, rst, load;
input [3:0] in4bit; 
output [3:0] out4bit;
input clear;
reg [3:0] out4bit;


always @ (posedge clk)

begin 
	if ( rst == 1)begin
	  if ( load == 1)
	    begin
	     out4bit <= in4bit;
	    end
	 
	  else begin 
	  
	    if(clear == 1) begin
	      out4bit <= 4'b0000;
	    end
	  end
	end
	else if (rst == 0)
	 begin
	   out4bit <= 4'b0000;
		
	 end
end
endmodule


