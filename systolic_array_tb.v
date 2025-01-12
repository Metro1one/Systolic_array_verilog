module systolic_array_tb;

  reg rst, clk;
 
  // Input registers for matrix values
  reg [15:0] inp_west0, inp_west4, inp_west8, inp_west12, inp_north0, inp_north1, inp_north2, inp_north3;
 
  // Output wires from the systolic array
  wire [31:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
  wire [7:0] count;
  // Instantiate the systolic array module
  systolic_array uut (
      .inp_west0(inp_west0),
      .inp_west4(inp_west4),
      .inp_west8(inp_west8),
      .inp_west12(inp_west12),
      .inp_north0(inp_north0),
      .inp_north1(inp_north1),
      .inp_north2(inp_north2),
      .inp_north3(inp_north3),
      .result0(result0),
      .result1(result1),
      .result2(result2),
      .result3(result3),
      .result4(result4),
      .result5(result5),
      .result6(result6),
      .result7(result7),
      .result8(result8),
      .result9(result9),
      .result10(result10),
      .result11(result11),
      .result12(result12),
      .result13(result13),
      .result14(result14),
      .result15(result15),
      .clk(clk),
      .rst(rst),
      .count(count)
  );
 
  initial begin
    // Initialize clock and reset
    clk = 0;
    rst = 0;
   
    // Initialize input matrices to non-zero values
    inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;
    inp_north0 = 0; inp_north1 = 0; inp_north2 = 0; inp_north3 = 0;
   
    #15 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
   
    // Test Case 1: Matrix multiplication of 4x4 matrix with values 1, 2, 3, etc.
    #5;  inp_west0 = 1; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 2; inp_west4 = 5; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 3; inp_west4 = 6; inp_west8 = 9; inp_west12 = 0;   inp_north0 = 6; inp_north1 = 5; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 4; inp_west4 = 7; inp_west8 = 10; inp_west12 = 13; inp_north0 = 8; inp_north1 = 9; inp_north2 = 7;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 8; inp_west8 = 11; inp_west12 = 14; inp_north0 = 0; inp_north1 = 13; inp_north2 = 8;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 15; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 7;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
   
#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20

    // Test Case 2: Another set of values for a different matrix multiplication
    #5;  inp_west0 = 4; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 34; inp_west4 = 9; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 26; inp_west4 = 11; inp_west8 = 5; inp_west12 = 0;   inp_north0 = 55; inp_north1 = 87; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 78; inp_west4 = 7; inp_west8 = 10; inp_west12 = 22; inp_north0 = 69; inp_north1 = 45; inp_north2 = 7;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 76; inp_west8 = 66; inp_west12 = 14; inp_north0 = 0; inp_north1 = 12; inp_north2 = 8;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 18; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 7;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20


    // Test Case 3: Random non-zero values
    #5;  inp_west0 = 34; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 19; inp_west4 = 5; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 12; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 3; inp_west4 = 6; inp_west8 = 9; inp_west12 = 0;   inp_north0 = 78; inp_north1 = 98; inp_north2 = 10;inp_north3 = 0;
#10; inp_west0 = 32; inp_west4 = 7; inp_west8 = 26; inp_west12 = 78; inp_north0 = 38; inp_north1 = 9; inp_north2 = 10;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 8; inp_west8 = 65; inp_west12 = 98; inp_north0 = 0; inp_north1 = 13; inp_north2 = 10;inp_north3 = 6;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 12; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 7;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 90;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20

    // Test Case 4: Larger values for matrix multiplication
    #5;  inp_west0 = 11; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 22; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 21; inp_west4 = 54; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 42; inp_north1 = 13; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 31; inp_west4 = 64; inp_west8 = 93; inp_west12 = 0;   inp_north0 = 62; inp_north1 = 53; inp_north2 = 33;inp_north3 = 0;
#10; inp_west0 = 41; inp_west4 = 73; inp_west8 = 10; inp_west12 = 132; inp_north0 = 82; inp_north1 = 93; inp_north2 = 73;inp_north3 = 52;
#10; inp_west0 = 0; inp_west4 = 84; inp_west8 = 11; inp_west12 = 17; inp_north0 = 0; inp_north1 = 132; inp_north2 = 83;inp_north3 = 52;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 134; inp_west12 = 151; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 7;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20


    // Test Case 5: One input matrix with all 1's and the other with all 0's
    #5;  inp_west0 = 10; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 26; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 20; inp_west4 = 98; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 443; inp_north1 = 12; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 30; inp_west4 = 63; inp_west8 = 12; inp_west12 = 0;   inp_north0 = 63; inp_north1 = 52; inp_north2 = 31;inp_north3 = 0;
#10; inp_west0 = 40; inp_west4 = 789; inp_west8 = 101; inp_west12 = 131; inp_north0 = 82; inp_north1 = 92; inp_north2 = 73;inp_north3 = 51;
#10; inp_west0 = 0; inp_west4 = 90; inp_west8 = 112; inp_west12 = 14; inp_north0 = 0; inp_north1 = 132; inp_north2 = 81;inp_north3 = 53;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 123; inp_west12 = 15; inp_north0 = 0; inp_north1 = 0; inp_north2 = 101;inp_north3 = 73;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 163;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 878;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20


    // Test Case 6: Both input matrices with all values set to 10
    #5;  inp_west0 = 10; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 98; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 10; inp_west4 = 53; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 23; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 98; inp_west4 = 625; inp_west8 = 921; inp_west12 = 0;   inp_north0 = 6; inp_north1 = 54; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 32; inp_west4 = 73; inp_west8 = 1045; inp_west12 = 13; inp_north0 = 76; inp_north1 = 91; inp_north2 = 7;inp_north3 = 4;
#10; inp_west0 = 0; inp_west4 = 82; inp_west8 = 114; inp_west12 = 14; inp_north0 = 0; inp_north1 = 133; inp_north2 = 8;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 15; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20


    // Test Case 7: Random negative values in one input matrix
    #5;  inp_west0 = 1; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 223; inp_west4 = 5; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 3; inp_west4 = 676; inp_west8 = 9; inp_west12 = 0;   inp_north0 = 612; inp_north1 = 5; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 412; inp_west4 = 73; inp_west8 = 101; inp_west12 = 13; inp_north0 = 83; inp_north1 = 97; inp_north2 = 7;inp_north3 = 98;
#10; inp_west0 = 0; inp_west4 = 8; inp_west8 = 1; inp_west12 = 143; inp_north0 = 0; inp_north1 = 13; inp_north2 = 65;inp_north3 = 76;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 156; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 65;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20



      // Test Case 8: Random values for both matrices
    #5;  inp_west0 = 1; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 2; inp_west4 = 43; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 43; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 98; inp_west4 = 76; inp_west8 = 65; inp_west12 = 0;   inp_north0 = 643; inp_north1 = 5; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 65; inp_west4 = 76; inp_west8 = 10; inp_west12 = 131; inp_north0 = 8; inp_north1 = 9; inp_north2 = 7;inp_north3 = 76;
#10; inp_west0 = 0; inp_west4 = 86; inp_west8 = 11; inp_west12 = 14; inp_north0 = 0; inp_north1 = 13; inp_north2 = 8;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 123; inp_west12 = 155; inp_north0 = 0; inp_north1 = 0; inp_north2 = 1;inp_north3 = 98;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20



    // Test Case 9: Random values for both matrices (different range)
    #5;  inp_west0 = 6; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 98; inp_west4 = 52; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 312; inp_west4 = 62; inp_west8 = 91; inp_west12 = 0;   inp_north0 = 6; inp_north1 = 5; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 42; inp_west4 = 7; inp_west8 = 10; inp_west12 = 13; inp_north0 = 8; inp_north1 = 9; inp_north2 = 7;inp_north3 = 87;
#10; inp_west0 = 0; inp_west4 = 83; inp_west8 = 114; inp_west12 = 14; inp_north0 = 0; inp_north1 = 1342; inp_north2 = 8;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 123; inp_west12 = 15; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 765;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20



    // Test Case 10: Random values for both matrices
    #5;  inp_west0 = 76; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 22; inp_west4 = 54; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 11; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 34; inp_west4 = 632; inp_west8 = 9; inp_west12 = 0;   inp_north0 = 6; inp_north1 = 4; inp_north2 = 34;inp_north3 = 0;
#10; inp_west0 = 43; inp_west4 = 72; inp_west8 = 10; inp_west12 = 18; inp_north0 = 8; inp_north1 = 9; inp_north2 = 87;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 8; inp_west8 = 11; inp_west12 = 148; inp_north0 = 0; inp_north1 = 8; inp_north2 = 87;inp_north3 = 532;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 152; inp_north0 = 0; inp_north1 = 0; inp_north2 = 76;inp_north3 = 72;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 169;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 856;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20


    // Test Case 11: Random values for both matrices
    #5;  inp_west0 = 255; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 257; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 1; inp_west4 = 1; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 1; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 1; inp_west4 = 257; inp_west8 = 1; inp_west12 = 0;   inp_north0 = 1; inp_north1 = 255; inp_north2 = 1;inp_north3 = 0;
#10; inp_west0 = 1; inp_west4 = 1; inp_west8 = 1; inp_west12 = 1; inp_north0 = 1; inp_north1 = 1; inp_north2 = 1;inp_north3 = 1;
#10; inp_west0 = 0; inp_west4 = 1; inp_west8 = 85; inp_west12 = 1; inp_north0 = 0; inp_north1 = 1; inp_north2 = 771;inp_north3 = 1;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 1; inp_west12 = 1; inp_north0 = 0; inp_north1 = 0; inp_north2 = 1;inp_north3 = 1;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 771;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 85;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20

    // Test Case 12: Random values for both matrices
    #5;  inp_west0 = 1; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 2; inp_west4 = 5; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 4; inp_north1 = 1; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 3; inp_west4 = 6; inp_west8 = 9; inp_west12 = 0;   inp_north0 = 6; inp_north1 = 5; inp_north2 = 3;inp_north3 = 0;
#10; inp_west0 = 4; inp_west4 = 7; inp_west8 = 10; inp_west12 = 13; inp_north0 = 8; inp_north1 = 9; inp_north2 = 7;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 8; inp_west8 = 11; inp_west12 = 14; inp_north0 = 0; inp_north1 = 13; inp_north2 = 8;inp_north3 = 5;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 12; inp_west12 = 15; inp_north0 = 0; inp_north1 = 0; inp_north2 = 10;inp_north3 = 7;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 16;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 8;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;

#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20


    // Test Case 13: Random values for both matrices
    #5;  inp_west0 = 1; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 1; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 0; inp_west4 = 65535; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 65535; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0; inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 1; inp_west12 = 0; inp_north0 = 0; inp_north1 = 0; inp_north2 = 1;inp_north3 = 0;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0; inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 1;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 1;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20
// Test Case 14: Random values for both matrices
    #5;  inp_west0 = 56; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 23; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 43; inp_west4 = 73; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 53; inp_north1 = 34; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 872; inp_west4 = 1; inp_west8 = 13; inp_west12 = 0;   inp_north0 = 54; inp_north1 = 24; inp_north2 = 45;inp_north3 = 0;
#10; inp_west0 = 987; inp_west4 = 34; inp_west8 = 76; inp_west12 = 43; inp_north0 = 66; inp_north1 = 24; inp_north2 = 35;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 962; inp_west8 = 34; inp_west12 = 54; inp_north0 = 0; inp_north1 = 457; inp_north2 = 34;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 234; inp_west12 = 34; inp_north0 = 0; inp_north1 = 0; inp_north2 = 94;inp_north3 = 104;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 34;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 4;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20

   // Test Case 15: Random values for both matrices
#5;  inp_west0 = 10000; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 20000; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 10000; inp_west4 = 10000; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 20000; inp_north1 = 20000; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 10000; inp_west4 = 10000; inp_west8 = 10000; inp_west12 = 0;   inp_north0 = 20000; inp_north1 = 20000; inp_north2 = 20000;inp_north3 = 0;
#10; inp_west0 = 10000; inp_west4 = 10000; inp_west8 = 10000; inp_west12 = 10000; inp_north0 = 20000; inp_north1 = 20000; inp_north2 = 20000;inp_north3 = 20000;
#10; inp_west0 = 0; inp_west4 = 10000; inp_west8 = 10000; inp_west12 = 10000; inp_north0 = 0; inp_north1 = 20000; inp_north2 = 20000;inp_north3 = 20000;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 10000; inp_west12 = 10000; inp_north0 = 0; inp_north1 = 0; inp_north2 = 20000;inp_north3 = 20000;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 10000;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 20000;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20

// Test Case 16: Random values for both matrices
    #5;  inp_west0 = 967; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 239; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 435; inp_west4 = 734; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 1053; inp_north1 = 234; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 872; inp_west4 = 1; inp_west8 = 1003; inp_west12 = 0;   inp_north0 = 954; inp_north1 = 734; inp_north2 = 445;inp_north3 = 0;
#10; inp_west0 = 987; inp_west4 = 345; inp_west8 = 676; inp_west12 = 243; inp_north0 = 456; inp_north1 = 234; inp_north2 = 1235;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 962; inp_west8 = 1134; inp_west12 = 554; inp_north0 = 0; inp_north1 = 1457; inp_north2 = 734;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 1234; inp_west12 = 34; inp_north0 = 0; inp_north1 = 0; inp_north2 = 234;inp_north3 = 234;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 34;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 4;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#30 rst = 1; // Assert reset
    #15 rst = 0; // Deassert reset
	#20

// Test Case 17: Random values for both matrices
#5;  inp_west0 = 1; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 1; inp_west4 = 1; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 2; inp_north2 = 0;inp_north3 = 0;
#10; inp_west0 = 1; inp_west4 = 1; inp_west8 = 1; inp_west12 = 0;   inp_north0 = 2; inp_north1 = 2; inp_north2 = 2;inp_north3 = 0;
#10; inp_west0 = 1; inp_west4 = 1; inp_west8 = 1; inp_west12 = 1; inp_north0 = 2; inp_north1 = 2; inp_north2 = 2;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 1; inp_west8 = 1; inp_west12 = 1; inp_north0 = 0; inp_north1 = 2; inp_north2 = 2;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 1; inp_west12 = 1; inp_north0 = 0; inp_north1 = 0; inp_north2 = 2;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 1;  inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 2;
#10; inp_west0 = 0; inp_west4 = 0; inp_west8 = 0; inp_west12 = 0;   inp_north0 = 0; inp_north1 = 0; inp_north2 = 0;inp_north3 = 0;
    // Final time to end the simulation
    #50;
    $finish;
  end
 
    // Clock generation for the testbench
  initial begin
    forever #5 clk = ~clk; // Toggle clock every 5 time units
  end
 
  // Dump waveform data for simulation visualization
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, systolic_array_tb);
  end

endmodule

