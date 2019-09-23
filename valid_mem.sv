// Content          : Vaild memory
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.23

import memory_sub_system_param::*;

module valid_mem(
    input                       clk,  // TODO
    input                       resetn, //TODO
    input                       write,
    input [INDEX_LENGTH-1:0]    index,
    output                      valid_out
    );

    reg [NUM_CACHE_LINES-1:0]   valid_memory;

    reg valid_out;

    always_ff @(posedge clk)
    begin
        if (!resetn) begin      // synchronous reset
            valid_memory = 0;
        end
        else begin
            if (write) begin
                valid_memory[index] = 1'b1;
            end
            else begin
                valid_out = valid_memory[index];
            end
        end
    end
endmodule

