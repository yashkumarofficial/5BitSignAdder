// Circuit for sending 2's complement into the ALU
// It is a 5-bit circuit and it send value from -16 to +15

module twocomplement5bit(
    input Num1InBit0, Num1InBit1, Num1InBit2, Num1InBit3, Num1InBit4, Num1Sign,
    output Num1OutBit0, Num1OutBit1, Num1OutBit2, Num1OutBit3, Num1OutBit4
);

assign Num1OutBit0 = Num1Sign ^ (Num1InBit0 ^ Num1Sign);
wire Num1AcBit0 = (Num1Sign & (Num1InBit0 ^ Num1Sign));
assign Num1OutBit1 = Num1AcBit0 ^ (Num1InBit1 ^ Num1Sign);
wire Num1AcBit1 = (Num1AcBit0 & (Num1InBit1 ^ Num1Sign));
assign Num1OutBit2 = Num1AcBit1 ^ (Num1InBit2 ^ Num1Sign);
wire Num1AcBit2 = (Num1AcBit1 & (Num1InBit2 ^ Num1Sign));
assign Num1OutBit3 = Num1AcBit2 ^ (Num1InBit3 ^ Num1Sign);
wire Num1AcBit3 = (Num1AcBit2 & (Num1InBit3 ^ Num1Sign));
assign Num1OutBit4 = Num1AcBit3 ^ (Num1InBit4 ^ Num1Sign);

endmodule