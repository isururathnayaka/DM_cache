// Content          : Vaild memory
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.28

import memory_sub_system_param::*;

module valid_mem #(
    parameter byte INDEX_LEN        = INDEX_LENGTH,
    parameter byte TAG_LEN          = TAG_LENGTH,
    parameter integer NUM_CACHE_L   = NUM_CACHE_LINES
    )(
    input                       clk,  // TODO
    input                       resetn, //TODO
    input                       write,
    input [INDEX_LEN-1:0]    index,
    output                      valid_out
    );

    logic [NUM_CACHE_L-1:0]     valid_memory;

    logic valid_out;

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

