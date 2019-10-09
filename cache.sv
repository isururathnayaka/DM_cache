// Content          : Cache memory
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.28

import memory_sub_system_param::*;

module cache #(
    parameter byte INDEX_LEN        = INDEX_LENGTH,
    parameter byte OFFSET_LEN       = OFFSET_LENGTH,
    parameter integer NUM_CACHE_L   = NUM_CACHE_LINES,
    parameter integer CACHE_L_SIZE  = CACHE_LINE_SIZE
    )(
    input                       clk,  // TODO
    input                       resetn, //TODO
    input                       write,
    input [INDEX_LEN-1:0]       index,
    input [OFFSET_LEN-1:0]      offset,
    input [CACHE_L_SIZE-1:0]    din,
    output [CACHE_L_SIZE-1:0]   dout
    );

    reg [NUM_CACHE_L-1:0][CACHE_L_SIZE-1:0] cache_memory;

    reg [CACHE_L_SIZE-1:0] dout;

    always_ff @(posedge clk)
    begin
        if (!resetn) begin      // synchronous reset
            cache_memory = 0;
        end
        else begin
            if (write) begin
                cache_memory[index] = din;
            end
            else begin
                dout = tag_memory[index];
            end
        end
    end
endmodule

