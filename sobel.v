module sobel(
   input	     clk,
   input wire [23:0] row1,
   input wire [23:0] row2,
   input wire [23:0] row3,
   output integer    result
);

   integer	     r1c1;
   integer	     r1c2;
   integer	     r1c3;

   integer	     r2c1;
   //integer	     r2c2;
   integer	     r2c3;

   integer	     r3c1;
   integer	     r3c2;
   integer	     r3c3;

   integer	     Gx;
   integer	     Gy;

   always @ (posedge clk)
     begin
	r1c1 <= row1[23:16];
	r1c2 <= row1[15:8];
	r1c3 <= row1[7:0];

	r2c1 <= row2[23:16];
	//r2c2 <= row2[15:8];
	r2c3 <= row2[7:0];

	r3c1 <= row3[23:16];
	r3c2 <= row3[15:8];
	r3c3 <= row3[7:0];

	// Calculate Gx

	Gx <= r1c1 * -1 + r1c3 * 1 +
		r2c1 * -2 + r2c3 * 2 +
		r3c1 * -1 + r3c3 * 1;

	// Calculate Gy

	Gy <= r1c1 * -1 + r1c2 * -2 + r1c3 * -1 +
		r3c1 * 1 + r3c2 * 2 + r3c3 * 1;

	// Take absolute value of Gx and Gy

	if (Gx < 0)
	  Gx <= Gx * -1;

	if (Gy < 0)
	  Gy <= Gy * -1;

	// G = |Gx| + |Gy|

	if (Gx > 0 && Gy > 0)
	  result <= Gx + Gy;

     end // always @ (posedge clk)

endmodule
