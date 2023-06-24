# Multi-user-Game-Based-on-FPGA
This is individual course project for ECE 6370 - Advance Digital Design

The binary math game is developed based on the DE2-115 FPGA board. The game is designed for one player to play against the computer on board. To enter the game, the player must input a 4-bit password through a set of switches and if the password is correct, the player can gain the access to play the game. After successfully logging in the game module, the player needs to set up the count down timer using two sets of switches (0-99 seconds). Afterwards, the player is supposed to press a button to generate a random 4-bit number by the random number generator. And the player input a 4-bit number by using another set of switches. If the sum of two 4-bit numbers equals to ‘1111’ in binary (‘15’ in decimal), the player will get 1 point. The game will stop when the count down timer counts to ‘0’.
![image](https://github.com/yuantian94/Multi-user-Game-Based-on-FPGA/assets/13746207/b224bd5f-7e38-466f-b586-1205fe468255)

a.	Game Set Up
1.	Connect 12V power supply
2.	Make sure Programming Mode Switch is on “RUN”
3.	Press the power switch if the system is off
4.	Use the switches to input the password for the game module
5.	Press load button for password. If previous password is wrong, pressing load button will restart the authentication process. 
6.	Check the LED lights for access status (Red: Deny, Green: Approve). Password correct: go to 7. Password wrong: go to 5 or 20.
7.	Player use a set of switches to set up first digit of the countdown timer.
8.	Player use a set of switches to set up second digit of the countdown timer. 
9.	Player can observe the game time on the display.
10.	Player presses a button to start the game.

b.	Game Play


11.	Player presses the button to use the Random Number Generator to generate a 4-bit number.
12.	Player load up the random 4-bit number to the system.
13.	Player can observe the random 4-bit number in the display.
14.	Player can use the set of switches to input another 4-bit number to the system.
15.	Player presses the button to load up the number.
16.	Player can observe the number inputted in the display.
17.	The sum of the two 4-bit number will be displayed.
18.	Players can check if the numbers sum up to 15 (‘1111’ in binary) by checking the LED lights. Green means “YES” and Red means “No”.
19.	If the green light is turned on, the player will score 1 points and the score will be display on the display. 
20.	Player can press the button to pause the game.
21.	Player can press the button again to resume to the game.
22.	Player can press the button twice within one second to restart the game.
23.	Player can press the button three times within two second to log out the game.
24.	Player can press the button to reset the entire system.
