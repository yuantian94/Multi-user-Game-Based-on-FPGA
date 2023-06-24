//Homework 6
//Author: YUAN TIAN (5170)
//This module is designed to authorize game play
//This module verify the passward input by user
//and grant the access if the passward is correct

module AccessCtrl(Pass, B_bp, Bp_2, clk, rst, timeout, OneSec2, BO_2, reconfig, enable, enable2, win_rst, clear_load, clear_digit, clear_time, red_light, green_light, LED_1, LED_2, LED_3);
	input B_bp, Bp_2, clk, rst, timeout, OneSec2;
	input [3:0] Pass;
	output red_light, green_light, BO_2, enable, enable2, reconfig, win_rst, clear_load, clear_digit, clear_time, LED_1, LED_2, LED_3;
	reg red_light, green_light, BO_2, enable, enable2, reconfig, win_rst,clear_load, clear_digit, clear_time, LED_1, LED_2, LED_3;
	reg sfsg;
	reg [3:0] state;
	parameter First = 4'b0000, Second = 4'b0001;
	parameter Third = 4'b0010, Fourth = 4'b0011;
	parameter Check = 4'b0100, Approve = 4'b0101;
	parameter Deny = 4'b0110, LoadTimer = 4'b0111;
	parameter GameStart = 4'b1000, GameOver = 4'b1001;
	parameter GameStatus = 4'b1010, CheckStatus_1 = 4'b1011; 
	parameter Pause = 4'b1100, CheckStatus_2 = 4'b1101;


	always @(posedge clk)
		begin
		  if(rst == 0)
		    begin
		      state <=First;
		    end
		  
		  else
		    begin
		      case(state)

			First:
			  begin
			    sfsg <= 1;
			    clear_digit <= 1;
			    clear_load <= 1;
			    clear_time <= 1;
			    BO_2 <= 0;
			    reconfig <= 0;
			    enable <= 0;
			    enable2 <= 0;
			    win_rst <= 1;
			    red_light <= 1;
		            green_light <= 0;
			    if (B_bp == 0)
			      begin
				state <= First;
			      end
			    else
			      begin
				if(Pass == 1)
				  begin
				    //doing nothing
				  end
				else
				  begin
				    sfsg <= 0;
				  end
				state <= Second;
			      end
			  end

			Second:
			  begin
				 if (B_bp == 0)
			      begin
				state <= Second;
			      end
			    else
			      begin
				if(Pass == 2)
				  begin
				    //doing nothing
				  end
				else
				  begin
				    sfsg <= 0;
				  end
				state <= Third;
			      end
			  end

			Third:
			  begin
            clear_digit <= 0;
				clear_load <= 0;
				clear_time <= 0;
			    if (B_bp == 0)
			      begin
				state <= Third;
			      end
			    else
			      begin
				if(Pass == 3)
				  begin
				    //doing nothing
				  end
				else
				  begin
				    sfsg <= 0;
				  end
				state <= Fourth;
			      end
			  end

			Fourth:
			  begin
			    if (B_bp == 0)
			      begin
				state <= Fourth;
			      end
			    else
			      begin
				if(Pass == 4)
				  begin
				    //doing nothing
				  end
				else
				  begin
				    sfsg <= 0;
				  end
				state <= Check;
			      end
			  end

			Check:
			  begin
			    if (sfsg == 1)
			      begin
				state <= Approve;
			      end
			    else
			      begin
			        state <= Deny;
			      end
			  end

			Deny:
			  begin
			    if (B_bp == 0)
			      begin
				state <= Deny;
			      end
			    else
			      begin
				state <= First;
			      end
			  end

			Approve:
			  begin
			    red_light <= 1'b0;
			    green_light <= 1'b1;
			    state <= LoadTimer;
				 clear_time <= 0;
			  end

			

			LoadTimer:
			  begin
			    clear_load <= 0;
			    reconfig <= 1;
			    win_rst <= 1;
			    LED_1<= 1;
			    if (B_bp == 1)
			      begin
				state <= GameStart;
			      end
			    else
			      begin
				state <= LoadTimer;
			      end			    
			  end

			GameStart:
			  begin
			    reconfig <= 0;
			    LED_2 <= 1;
			    LED_1 <= 0;
			    BO_2 <= Bp_2;
			    enable <= 1;
			    win_rst <= 0;
			    if(B_bp == 1)
			      begin			
				BO_2 <= 0;
			        enable <= 0;
				state <= GameStatus;
						enable2 <= 1; 
			      end
							    
			    else if(timeout == 1)
			      begin
				state <= GameOver;
			      end
			    else
			      begin
				state <= GameStart;
			      end
			  end
			
			GameStatus:
			  begin
			    reconfig <= 0;
			    BO_2 <= 0;
			    if(OneSec2 == 1)
			      begin
			        enable2 <= 0;
			        clear_time <= 1;
					  state <= Pause;
			      end
			    else if(B_bp == 1)
			      begin
				state <= CheckStatus_1;
				clear_time <= 1;				
			      end
			    else
			      begin
				state <= GameStatus;
			      end
			   end			

			CheckStatus_1:
			  begin
			    /*enable2 <= 0;
			    if(PushCount == 3)
			      begin
				state <= First;
				PushCount <= 0;
			      end
			    else if(PushCount == 2)
			      begin
				state <= Approve;
				clear_load <= 1;
				PushCount <= 0;
			      end
	                    else 
			      begin
				state <= Pause;
				PushCount <= 0;
			      end*/
			    
			    state <= CheckStatus_2;
			  end
			CheckStatus_2:
			  begin
			    clear_time <= 0;
				 if(OneSec2 == 1)
			      begin
			        state <= Approve;
				clear_load <= 1;
			      end
			    else if(B_bp == 1)
			      begin
				state <= First;
			      end
			    else
			      begin
				state <= CheckStatus_2;
			      end			    
			  end
			Pause:
			  begin
			    if(B_bp == 1)
			      begin
				state <= GameStart;
				clear_load <=0;
				clear_time <= 0;
			      end
			    else
			      begin
				state <= Pause;
				clear_time <= 0;
			      end
			  end
			GameOver:
			  begin
			    reconfig <= 0;
			    LED_3 <= 1;
			    LED_2 <= 0;
			    BO_2 <= 0;
			    enable <= 0;
			    if(B_bp == 1)
			      begin
				state <= Approve;
				clear_load <= 1;
			      end
			    else
			      begin
				state <= GameOver;
			      end
			  end

			default:
			  begin
			    red_light <= 1'b1;
			    green_light <= 1'b0;
			    state <= First;
			  end

		      endcase
		    end
		end
endmodule

