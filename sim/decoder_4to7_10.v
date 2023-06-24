//ECE6370
//LAB 1
//Author: Yuan Tian (1675170)
//4 bit to 7 bit decoder
//This module is design for the 7-segment display module on 
//FPGA DE2-115 Board. This decoder module can convert a 
//4-bit number into a 7-bit number that can be used to
//drive the 7-segment display module, where a "0" indicates
//lightening up the specific bar and "1" indicates turning
//off the bar.

module decoder_4to7_10 (decoder_in, decoder_out);
	input [3:0] decoder_in;
	output[6:0] decoder_out;
	reg [6:0] decoder_out;

	always @ (decoder_in)
	  begin
	    case (decoder_in)
	      4'b0000:
	        begin
	          decoder_out = 7'b1000000;	//0
	        end
	      4'b0001:
	        begin
	          decoder_out = 7'b1111001;	//1
	        end
	      4'b0010:
	        begin
	          decoder_out = 7'b0100100;	//2
	        end
	      4'b0011:
	        begin
	          decoder_out = 7'b0110000;	//3
	        end
	      4'b0100:
	        begin
	          decoder_out = 7'b0011001;	//4
	        end
	      4'b0101:
	        begin
	          decoder_out = 7'b0010010;	//5
	        end
	      4'b0110:
	        begin
	          decoder_out = 7'b0000010;	//6
	        end
	      4'b0111:
	        begin
	          decoder_out = 7'b1111000;	//7
	        end
	      4'b1000:
	        begin
	          decoder_out = 7'b0000000;	//8
	        end
	      4'b1001:
	        begin
	          decoder_out = 7'b0010000;	//9
	        end

	      default:
	        begin
	          decoder_out = 7'b0111111;	//default(-)
	        end
	     endcase
	   end
endmodule
