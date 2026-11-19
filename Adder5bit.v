// The circuit of adder that takes two 5-bit numbers and output 

module Adder5bit(
    input Num1AdderInBit0, Num1AdderInBit1, Num1AdderInBit2, Num1AdderInBit3, Num1AdderInBit4,
    input Num2AdderInBit0, Num2AdderInBit1, Num2AdderInBit2, Num2AdderInBit3, Num2AdderInBit4,
    output Num1andNum2AdderOutBit0, Num1andNum2AdderOutBit1, Num1andNum2AdderOutBit2, Num1andNum2AdderOutBit3, Num1andNum2AdderOutBit4, Num1andNum2AdderOutBit5
);

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