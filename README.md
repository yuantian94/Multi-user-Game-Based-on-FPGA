# Multi-user-Game-Based-on-FPGA
This is individual course project for ECE 6370 - Advance Digital Design

The binary math game is developed based on the DE2-115 FPGA board. The game is designed for one player to play against the computer on board. To enter the game, the player must input a 4-bit password through a set of switches and if the password is correct, the player can gain the access to play the game. After successfully logging in the game module, the player needs to set up the count down timer using two sets of switches (0-99 seconds). Afterwards, the player is supposed to press a button to generate a random 4-bit number by the random number generator. And the player input a 4-bit number by using another set of switches. If the sum of two 4-bit numbers equals to ‘1111’ in binary (‘15’ in decimal), the player will get 1 point. The game will stop when the count down timer counts to ‘0’.
