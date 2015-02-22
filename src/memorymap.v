module main;

`include "parameter.v"
`include "file.v"

reg [MEM_WIDTH-1:0] memory[MEM_SIZE-1:0];
initial
begin
initmem;
loadfile;
end


endmodule

