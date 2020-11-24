module sobel_tb;

   integer fd_in, fd_out;
   integer rc;
   integer ii, jj;

   reg [7:0] data[0:99][0:99];
   integer   result[0:99][0:99];

   reg [23:0] row1;
   reg [23:0] row2;
   reg [23:0] row3;
   wire signed [31:0] pixel_result;

   reg 		      clk;

   sobel s(clk, row1, row2, row3, pixel_result);

   initial begin

      clk = 0;

      fd_in = $fopen("bicho.bin", "rb");
      rc = $fread(data, fd_in);
      $fclose(fd_in);

      for (ii = 0; ii < 100; ii = ii + 1)
	for (jj = 0; jj < 100; jj = jj + 1) 
	  begin
	     if (ii != 0 && ii != 99 &&
		 jj != 0 && jj != 99)
	       begin
		  
		  row1[23:16] = data[ii-1][jj-1];
		  row1[15:8] = data[ii-1][jj];
		  row1[7:0] = data[ii-1][jj+1];

		  row2[23:16] = data[ii][jj-1];
		  row2[15:8] = data[ii][jj];
		  row2[7:0] = data[ii][jj+1];

		  row3[23:16] = data[ii+1][jj-1];
		  row3[15:8] = data[ii+1][jj];
		  row3[7:0] = data[ii+1][jj+1];

		  #20 result[ii][jj] = pixel_result;
		  
	       end
	  end

      fd_out = $fopen("sobel.bin", "wb");

      for (ii = 0; ii < 100; ii = ii + 1)
	for (jj = 0; jj < 100; jj = jj + 1)
	  begin
	     if (ii != 0 && ii != 99 &&
		 jj != 0 && jj != 99)
	       $fwrite(fd_out, "%u", result[ii][jj]);
	     else
	       $fwrite(fd_out, "%u", 0);
	  end

      $fclose(fd_out);

      $finish;

   end // initial begin

   always
     #1 clk = ~clk;
   
endmodule
