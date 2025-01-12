module block(inp_north, inp_west, clk, rst, outp_south, outp_east, result);
input [15:0] inp_north, inp_west;  // 32-bit input width
output reg [31:0] outp_south, outp_east;  // 32-bit output width for south and east
input clk, rst;
output reg [31:0] result;  // 64-bit result for the accumulation

always @(posedge clk) begin

    if (rst) begin
        result <= 0;
        outp_east <= 0;
        outp_south <= 0;
    end else begin
        result <= result + (inp_west * inp_north);  // Perform multiplication and add
        outp_east <= inp_west;  // Set output to the current input for east
        outp_south <= inp_north;  // Set output to the current input for south
    end
end

endmodule


module systolic_array(
    inp_west0, inp_west4, inp_west8, inp_west12,
    inp_north0, inp_north1, inp_north2, inp_north3,
    result0, result1, result2, result3, result4, result5, result6, result7,
    result8, result9, result10, result11, result12, result13, result14, result15,
    clk, rst,count
);

input wire [31:0] inp_west0, inp_west4, inp_west8, inp_west12,
                  inp_north0, inp_north1, inp_north2, inp_north3;
output wire [63:0] result0, result1, result2, result3, result4, result5, result6, result7,
                   result8, result9, result10, result11, result12, result13, result14, result15;
output reg [7:0] count;
input clk, rst;

// Declare wire outputs for each block's results
wire [31:0] outp_south0, outp_south1, outp_south2, outp_south3, outp_south4, outp_south5, outp_south6, outp_south7,
            outp_south8, outp_south9, outp_south10, outp_south11, outp_south12, outp_south13, outp_south14, outp_south15;
wire [31:0] outp_east0, outp_east1, outp_east2, outp_east3, outp_east4, outp_east5, outp_east6, outp_east7,
            outp_east8, outp_east9, outp_east10, outp_east11, outp_east12, outp_east13, outp_east14, outp_east15;
always @(posedge clk) begin

    if (rst) begin
	count<=0;
    end else begin
	count<=count+1;
    end
end
// Instantiate 16 blocks (processing elements) in systolic array
block P0 (inp_north0, inp_west0, clk, rst, outp_south0, outp_east0, result0);
block P1 (inp_north1, outp_east0, clk, rst, outp_south1, outp_east1, result1);
block P2 (inp_north2, outp_east1, clk, rst, outp_south2, outp_east2, result2);
block P3 (inp_north3, outp_east2, clk, rst, outp_south3, outp_east3, result3);
block P4 (outp_south0, inp_west4, clk, rst, outp_south4, outp_east4, result4);
block P5 (outp_south1, outp_east4, clk, rst, outp_south5, outp_east5, result5);
block P6 (outp_south2, outp_east5, clk, rst, outp_south6, outp_east6, result6);
block P7 (outp_south3, outp_east6, clk, rst, outp_south7, outp_east7, result7);
block P8 (outp_south4, inp_west8, clk, rst, outp_south8, outp_east8, result8);
block P9 (outp_south5, outp_east8, clk, rst, outp_south9, outp_east9, result9);
block P10 (outp_south6, outp_east9, clk, rst, outp_south10, outp_east10, result10);
block P11 (outp_south7, outp_east10, clk, rst, outp_south11, outp_east11, result11);
block P12 (outp_south8, inp_west12, clk, rst, outp_south12, outp_east12, result12);
block P13 (outp_south9, outp_east12, clk, rst, outp_south13, outp_east13, result13);
block P14 (outp_south10, outp_east13, clk, rst, outp_south14, outp_east14, result14);
block P15 (outp_south11, outp_east14, clk, rst, outp_south15, outp_east15, result15);

endmodule
