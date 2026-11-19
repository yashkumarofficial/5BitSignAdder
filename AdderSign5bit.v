// A 5-bit adder that can take sign value from -16 to +15. 
module SignAdder5bit(
    input Num1InBit0, Num1InBit1, Num1InBit2, Num1InBit3, Num1InBit4, Num1Sign,
    input Num2InBit0, Num2InBit1, Num2InBit2, Num2InBit3, Num2InBit4, Num2Sign,
    output Num1andNum2AdderOutBit0, Num1andNum2AdderOutBit1, Num1andNum2AdderOutBit2, Num1andNum2AdderOutBit3, Num1andNum2AdderOutBit4, Num1andNum2AdderOutBit5
);

// 2's complement input part for 1st number.

wire Num1OutBit0 = Num1Sign ^ (Num1InBit0 ^ Num1Sign);
wire Num1AcBit0 = (Num1Sign & (Num1InBit0 ^ Num1Sign));
wire Num1OutBit1 = Num1AcBit0 ^ (Num1InBit1 ^ Num1Sign);
wire Num1AcBit1 = (Num1AcBit0 & (Num1InBit1 ^ Num1Sign));
wire Num1OutBit2 = Num1AcBit1 ^ (Num1InBit2 ^ Num1Sign);
wire Num1AcBit2 = (Num1AcBit1 & (Num1InBit2 ^ Num1Sign));
wire Num1OutBit3 = Num1AcBit2 ^ (Num1InBit3 ^ Num1Sign);
wire Num1AcBit3 = (Num1AcBit2 & (Num1InBit3 ^ Num1Sign));
wire Num1OutBit4 = Num1AcBit3 ^ (Num1InBit4 ^ Num1Sign);

// 2's complement input part for 2nd number.

wire Num2OutBit0 = Num2Sign ^ (Num2InBit0 ^ Num2Sign);
wire Num2AcBit0 = (Num2Sign & (Num2InBit0 ^ Num2Sign));
wire Num2OutBit1 = Num2AcBit0 ^ (Num2InBit1 ^ Num2Sign);
wire Num2AcBit1 = (Num2AcBit0 & (Num2InBit1 ^ Num2Sign));
wire Num2OutBit2 = Num2AcBit1 ^ (Num2InBit2 ^ Num2Sign);
wire Num2AcBit2 = (Num2AcBit1 & (Num2InBit2 ^ Num2Sign));
wire Num2OutBit3 = Num2AcBit2 ^ (Num2InBit3 ^ Num2Sign);
wire Num2AcBit3 = (Num2AcBit2 & (Num2InBit3 ^ Num2Sign));
wire Num2OutBit4 = Num2AcBit3 ^ (Num2InBit4 ^ Num2Sign);

// 1st 2's complement number input for first Adder Cluster Circuit.

wire Num1AdderInBit0 = Num1OutBit0;
wire Num1AdderInBit1 = Num1OutBit1;
wire Num1AdderInBit2 = Num1OutBit2;
wire Num1AdderInBit3 = Num1OutBit3;
wire Num1AdderInBit4 = Num1OutBit4;

// 2nd 2's complement number input for first Adder Cluster Circuit.

wire Num2AdderInBit0 = Num2OutBit0;
wire Num2AdderInBit1 = Num2OutBit1;
wire Num2AdderInBit2 = Num2OutBit2;
wire Num2AdderInBit3 = Num2OutBit3;
wire Num2AdderInBit4 = Num2OutBit4;

// first adder 

assign Num1andNum2AdderOutBit0 = Num1AdderInBit0 ^ Num2AdderInBit0;
wire Num1andNum2AdderCarryOutBit0 = Num1AdderInBit0 & Num2AdderInBit0;

// Second Adder 

assign Num1andNum2AdderOutBit1 = Num1AdderInBit1 ^ Num2AdderInBit1 ^ Num1andNum2AdderCarryOutBit0;
wire Num1andNum2AdderCarryOutBit1 = (Num1AdderInBit1 & Num2AdderInBit1) | Num1andNum2AdderCarryOutBit0 & (Num1AdderInBit1 ^ Num2AdderInBit1);

// Third Adder 

assign Num1andNum2AdderOutBit2 = Num1AdderInBit2 ^ Num2AdderInBit2 ^ Num1andNum2AdderCarryOutBit1;
wire Num1andNum2AdderCarryOutBit2 = (Num1AdderInBit2 & Num2AdderInBit2) | Num1andNum2AdderCarryOutBit1 & (Num1AdderInBit2 ^ Num2AdderInBit2);

// Fourth Adder 

assign Num1andNum2AdderOutBit3 = Num1AdderInBit3 ^ Num2AdderInBit3 ^ Num1andNum2AdderCarryOutBit2;
wire Num1andNum2AdderCarryOutBit3 = (Num1AdderInBit3 & Num2AdderInBit3) | Num1andNum2AdderCarryOutBit2 & (Num1AdderInBit3 ^ Num2AdderInBit3);

// Fifth Adder 

assign Num1andNum2AdderOutBit4 = Num1AdderInBit4 ^ Num2AdderInBit4 ^ Num1andNum2AdderCarryOutBit3;
wire Num1andNum2AdderCarryOutBit4 = (Num1AdderInBit4 & Num2AdderInBit4) | Num1andNum2AdderCarryOutBit3 & (Num1AdderInBit4 ^ Num2AdderInBit4);
assign Num1andNum2AdderOutBit5 = Num1andNum2AdderCarryOutBit4;

endmodule