// 5 bit by 5 bit multipler 

module multiplier5x5(
    input Num1InBit0, Num1InBit1, Num1InBit2, Num1InBit3, Num1InBit4,
    input Num2InBit0, Num2InBit1, Num2InBit2, Num2InBit3, Num2InBit4,
    output Num1andNum2MultiplerOutBit0, Num1andNum2MultiplerOutBit1, Num1andNum2MultiplerOutBit2, Num1andNum2MultiplerOutBit3, Num1andNum2MultiplerOutBit4, Num1andNum2MultiplerOutBit5, Num1andNum2MultiplerOutBit6, Num1andNum2MultiplerOutBit7
);

// first bit of multipler result

assign Num1andNum2MultiplerOutBit0 = Num1InBit0 & Num2InBit0;

// second bit of multipler result

assign Num1andNum2MultiplerOutBit1 = (Num1InBit1 & Num2InBit0) ^ (Num1InBit0 & Num2InBit1);
wire Num1andNum2MultiplerCarryOutBit0 = (Num1InBit1 & Num2InBit0) & (Num1InBit0 & Num2InBit1);

// third bit of multipler result 

assign Num1andNum2MultiplerOutBit2 = Num1andNum2MultiplerCarryOutBit0 ^ (Num1InBit2 & Num2InBit0) ^ (Num1InBit1 & Num2InBit1) ^ (Num1InBit0 & Num2InBit2);
wire Num1andNum2MultiplerCarryOutBit1part0 = Num1andNum2MultiplerCarryOutBit0 & (Num1InBit2 & Num2InBit0);
wire Num1andNum2MultiplerCarryOutBit1part1 = (Num1InBit1 & Num2InBit1) & (Num1InBit0 & Num2InBit2);

// fourth bit of multipler result

assign Num1andNum2MultiplerOutBit3 = Num1andNum2MultiplerCarryOutBit1part0 ^ Num1andNum2MultiplerCarryOutBit1part1 ^ (Num1InBit3 & Num2InBit0) ^ (Num1InBit2 & Num2InBit1) ^ (Num1InBit1 & Num2InBit2) ^ (Num1InBit0 & Num2InBit3);
wire Num1andNum2MultiplerCarryOutBit2part0 = Num1andNum2MultiplerCarryOutBit1part0 & Num1andNum2MultiplerCarryOutBit1part1;
wire Num1andNum2MultiplerCarryOutBit2part1 = (Num1InBit3 & Num2InBit0) & (Num1InBit2 & Num2InBit1);
wire Num1andNum2MultiplerCarryOutBit2part2 = (Num1InBit1 & Num2InBit2) & (Num1InBit0 & Num2InBit3);

// fifth bit of multipler result 

assign Num1andNum2MultiplerOutBit4 = Num1andNum2MultiplerCarryOutBit2part0 ^ Num1andNum2MultiplerCarryOutBit2part1 ^ Num1andNum2MultiplerCarryOutBit2part2 ^ (Num1InBit3 & Num2InBit1) ^ (Num1InBit2 & Num2InBit2) ^ (Num1InBit1 & Num2InBit3);
wire Num1andNum2MultiplerCarryOutBit3part0 = Num1andNum2MultiplerCarryOutBit2part0 & Num1andNum2MultiplerCarryOutBit2part1;
wire Num1andNum2MultiplerCarryOutBit3part1 = Num1andNum2MultiplerCarryOutBit2part2 & (Num1InBit3 & Num2InBit1);
wire Num1andNum2MultiplerCarryOutBit3part2 = (Num1InBit2 & Num2InBit2) & (Num1InBit1 & Num2InBit3);

// sixth bit of multipler result 

assign Num1andNum2MultiplerOutBit5 = Num1andNum2MultiplerCarryOutBit3part0 ^ Num1andNum2MultiplerCarryOutBit3part1 ^ Num1andNum2MultiplerCarryOutBit3part2 ^ (Num1InBit3 & Num2InBit2) ^ (Num1InBit2 & Num2InBit3);
wire Num1andNum2MultiplerCarryOutBit4part0 = (Num1andNum2MultiplerCarryOutBit3part0 & Num1andNum2MultiplerCarryOutBit3part1) | (Num1andNum2MultiplerCarryOutBit3part2 & (Num1andNum2MultiplerCarryOutBit3part0 ^ Num1andNum2MultiplerCarryOutBit3part1));
wire Num1andNum2MultiplerCarryOutBit4part1 = Num1andNum2MultiplerCarryOutBit2part2 & (Num1InBit3 & Num2InBit1);

// seventh bit of multipler result 

assign Num1andNum2MultiplerOutBit6 = Num1andNum2MultiplerCarryOutBit4part0 ^ Num1andNum2MultiplerCarryOutBit4part1 ^ (Num1InBit3 & Num2InBit3);
wire Num1andNum2MultiplerCarryOutBit5 = (Num1andNum2MultiplerCarryOutBit4part0 & Num1andNum2MultiplerCarryOutBit4part1) | ((Num1InBit3 & Num2InBit3) & (Num1andNum2MultiplerCarryOutBit4part0 ^ Num1andNum2MultiplerCarryOutBit4part1));

// seventh bit of multipler result 

assign Num1andNum2MultiplerOutBit7 = Num1andNum2MultiplerCarryOutBit5;

endmodule
