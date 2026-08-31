`timescale 1 ns / 1 ps
module dec_sprinkler_tb ();

reg S, M, T, H;
wire S1, S2;
integer i;

dec_sprinkler d1 (.S(S), .M(M), .T(T), .H(H), .S1(S1), .S2(S2));

initial begin 
    {S, M, T, H} <= 4'b0110;
    
    $monitor("S=%b M=%b T=%b H=%b S1=%b S2=%b", S, M, T, H, S1, S2);

    for (i = 0; i < 16; i = i + 1) begin
       #10 {S, M, T, H} <= i;
    end
end

initial begin
    $dumpfile ("dec_sprinkler.vcd");
    $dumpvars (0,dec_sprinkler_tb);
end

endmodule