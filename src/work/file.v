//initialize memory
task initmem;
integer i;
begin
for(i = 0; i < MEM_SIZE; i = i+1)
$display("memory[%0d] = %h", i, main.memory[i]);
end
endtask

//load din file
task loadfile;
integer file;
reg [31:0] address;
integer label;

begin
file = $fopen(FILENAME, "r");
$display("filename =%s\n", FILENAME);

while(!$feof(file))
begin
$fscanf(file, "%d,%h\n", label, address);
case(label)
0:
//read the data from the given address
$display("label=%d", label);
1:
//write the data from the given address
$display("label=%d", label);
2:
//fetch an instruction
$display("label=%d", label);
3:
//invalidate the address line in the cache if it is present in L1 cache only
$display("label=%d", label);
4:
$display("label=%d", label);
// flush (invalidate the entire L 1 cache
8:
$display("label=%d", label);
//flush (invalidate) the entire TLB
9:
$display("label=%d", label);
//print the contents and state of the L1 cache and TLB 
default:
//throw an error ..invalid label
$display("label=%d", label);
endcase
end
end

endtask

task readmem;
input [31:0] address;
output [7:0] data;
begin
data = main.memory[address];
$display("*************ReadMemory*******************\n");
$display("memory[%h]= %h\n", address, data);
end
endtask


task writemem;
input [31:0] address;
input [7:0] data;

begin
main.memory[address] = data;
$display("******************WriteMemory******************\n");
$display("memory[address]=%h\n", address, data);
end

endtask


task displaymem;
integer i;
begin
for(i=0; i < MEM_SIZE; i++)
$display("memory[%h] = %h\n" i, main.memory[i]);
end
endtask
