module Enc16_4 (input [15:0] KEY,
                output reg [3:0] CODE)
;

integer i;

initial begin

i = KEY [15:0];
CODE <= 4'b0000; 

while (i != 0) begin
    
    i <= (i >> 1);
    CODE <= CODE + 1;
end

end

endmodule