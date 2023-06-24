module cdmod(rst, clear_digit, clk, switch_num3, switch_num4, reconfig, OneSec, timeout, num_out_1st, num_out_2nd);
input rst, clk, reconfig, OneSec, clear_digit;
input [3:0]switch_num3;
input [3:0]switch_num4;
output [3:0]num_out_1st;
output [3:0]num_out_2nd;
output timeout;
wire decrement, No_borrow;
wire port1, port2;
assign port1 = 1;

cdtimer FirstDigit(rst, clear_digit, clk, OneSec, No_borrow, reconfig, switch_num3, decrement, num_out_1st, timeout);
cdtimer SecondDigit(rst, clear_digit, clk, decrement, port1, reconfig, switch_num4, port2, num_out_2nd, No_borrow);

endmodule
