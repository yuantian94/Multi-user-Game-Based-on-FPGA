module OneSecTimer(rst, clear_time, clk, enable, OneSec);
input enable, rst, clk, clear_time;
output OneSec;


wire msTimer_out, CountTo100_out;

Timer1ms timer1(enable, clear_time, rst, clk, msTimer_out);
CountTo100 timer2(rst, clear_time, clk, msTimer_out, CountTo100_out);
CountTo10 timer3(rst, clear_time, clk, CountTo100_out, OneSec);

endmodule
