module dec_if2_4(input [1:0] in,
                 input en,
                 output reg [3:0] out)
;

always @ (*) begin
if (!en) begin

out = 4'b0000;

end else begin

if ( in == 2'b00 ) out = 4'b0001;
else if ( in == 2'b01 ) out = 4'b0010;
else if ( in == 2'b10 ) out = 4'b0100;
else if ( in == 2'b11 ) out = 4'b1000;

end
end
endmodule

module dec3_8 ( input [2:0] in,
                output [7:0] out)
;

wire enn;

assign enn = ~in[2];

dec_if2_4 u0 (.in(in[1:0]), .en(enn), .out(out[3:0]));
dec_if2_4 u1 (.in(in[1:0]), .en(in[2]), .out(out[7:4]));

endmodule