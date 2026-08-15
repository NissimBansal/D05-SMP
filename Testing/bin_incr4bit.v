module inc (input [3:0] A,
            output [3:0] Y)
;

wire [3:0] An;
wire w1, w2, w3, w4, w5, w6;

not(An[0], A[0]);
not(An[1], A[1]);
not(An[2], A[2]);
not(An[3], A[3]);

not(Y[0], A[0]);
xor(Y[1], A[0], A[1]);
and(w1, An[2], A[1], A[0]);
or(w2, An[0], An[1]);
and(w3, w2, A[2]);
or(Y[2], w1, w3);
and(w4, An[3], A[2], A[1], A[0]);
or(w5, An[2], An[1], An[0]);
and(w6, w5, A[3]);
or(Y[3], w4, w6);

endmodule