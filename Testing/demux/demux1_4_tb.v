`timescale 1 ns / 1 ps
module demux1_4_tb ();

reg [7:0] data;
reg [1:0] S;
wire [7:0] Ch0, Ch1, Ch2, Ch3;
integer i;

demux1_4 u0 (.data(data), .S(S), .Ch0(Ch0), .Ch1(Ch1), .Ch2(Ch2), .Ch3(Ch3));

initial begin

    {data, S} <= 10'b0;
    $monitor("data=%b S=%b Ch0=%b Ch1=%b Ch2=%b Ch3=%b", data, S, Ch0, Ch1, Ch2, Ch3);

    for (i = 0; i < 8; i = i + 1) begin
        #10; data = $random;
             S = $random;
    end
    #10;
end

initial begin
    $dumpfile ("demux1_4.vcd");
    $dumpvars (0,demux1_4_tb);
end

endmodule