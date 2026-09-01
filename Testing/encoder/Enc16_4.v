module Enc16_4 (input [15:0] KEY,
                output [3:0] CODE)
;

integer i, count;

always @ (*) begin

i = KEY;
count = -1; 

while (i != 0) begin
        i = (i >> 1);
        count = count + 1;
    end
end

assign CODE = KEY ? count : 4'bzzzz;

endmodule