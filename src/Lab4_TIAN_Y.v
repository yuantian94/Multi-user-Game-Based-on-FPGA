module Lab4_TIAN_Y (
	//inputs
	switch_num2, switch_num3, switch_num4, switch_num5, button_num1, button_num2, button_load, button_rst, clk,
	//outputs
	seg7_num1, seg7_num2, seg7_num3, seg7_num4, seg7_num5, seg7_num6, light_r_gp, light_g_gp, r_pv, g_pv, LED_1, LED_2, LED_3, enable);
	
	input [3:0] switch_num2, switch_num3, switch_num4, switch_num5;
	input button_num1, button_num2, button_load, button_rst, clk;
	output [6:0] seg7_num1, seg7_num2, seg7_num3, seg7_num4, seg7_num5, seg7_num6;
	output light_r_gp, light_g_gp, r_pv, g_pv, LED_1, LED_2, LED_3, enable;

	wire [3:0] wire_ld1, wire_ld2, sum, win_num, digit_1, digit_2, rng_out;
	wire win_rst, BO_2, B_bp, Bp_2, enable, OneSec, timeout, enable2, OneSec2, reconfig, clear_load, clear_digit, clear_time;
	wire port_OneSec;	
	assign port_OneSec = 0;

	f_veri_mod f_veri_mod_1(sum, clk, win_rst, button_rst, light_r_gp, light_g_gp, win_num);
	adder adder_1(wire_ld1, wire_ld2, sum);
	LoadReg lr_1(clk, button_rst, BO_2, clear_load,rng_out, wire_ld1);  
	LoadReg lr_2(clk, button_rst, BO_2, clear_load,switch_num2, wire_ld2);
	rng rng_1(button_num1, button_rst, clk, rng_out);
	AccessCtrl AC1(switch_num5, B_bp, Bp_2, clk, button_rst, timeout, OneSec2, BO_2, reconfig, enable, enable2, win_rst, clear_load, clear_digit, clear_time, r_pv, g_pv, LED_1, LED_2, LED_3);
	OneSecTimer OST_1(button_rst, port_OneSec, clk, enable, OneSec);
	OneSecTimer OST_2(button_rst, clear_time, clk, enable2, OneSec2);
	cdmod cdmod_1(button_rst, clear_digit, clk, switch_num3, switch_num4, reconfig, OneSec, timeout, digit_1, digit_2);
	ButtonShaper B1(button_load, clk, button_rst, B_bp);
	ButtonShaper B2(button_num2, clk, button_rst, Bp_2);
	decoder_4to7 dcoder_1(wire_ld1, seg7_num1);
	decoder_4to7 dcoder_2(wire_ld2, seg7_num2);
	decoder_4to7 dcoder_3(sum, seg7_num3);
	decoder_4to7_10 dcoder_4(digit_1, seg7_num4);
	decoder_4to7_10 dcoder_5(digit_2, seg7_num5);
	decoder_4to7 dcoder_6(win_num, seg7_num6);	

endmodule
