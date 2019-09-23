// Content          : Valid memory testbench
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.23

`timescale 1ns/100ps

import memory_sub_system_param::*;

module tb_valid_mem();
    reg                         clk;
    reg                         resetn;
    reg                         write;
    reg     [INDEX_LENGTH-1:0]  index;
    wire                        valid_out;


    valid_mem vm0(
        .clk(clk),
        .resetn(resetn),
        .write(write),
        .index(index),
        .valid_out(valid_out)
    );

    initial begin
        resetn  = 0;
        clk     = 0;

        #20

        resetn  = 1;
        write   = 1;

        for (int i=0; i<NUM_CACHE_LINES; i = i+2) begin
            #20
            //index   = $urandom_range(0, INDEX_LENGTH ** 2);
            index   = i;
        end

        #20

        write   = 0;
        for (int i=0; i<NUM_CACHE_LINES; i++) begin
            #20
            index   = i;
        end

        $finish;
    end

    always
        #5 clk  = !clk;
endmodule

