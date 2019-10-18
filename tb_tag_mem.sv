// Content          : Tag memory testbench
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.22

`timescale 1ns/100ps

import memory_sub_system_param::*;

module tb_tag_mem();
    logic                       clk;
    logic                       resetn;
    logic                       write;
    logic   [INDEX_LENGTH-1:0]  index;
    logic   [TAG_LENGTH-1:0]    tag_in;
    wire    [TAG_LENGTH-1:0]    tag_out;


    tag_mem tm0(
        .clk(clk),
        .resetn(resetn),
        .write(write),
        .index(index),
        .tag_in(tag_in),
        .tag_out(tag_out)
    );

    initial begin
        resetn  = 0;
        clk     = 0;

        #20

        resetn  = 1;
        write   = 1;

        for (int i=0; i<NUM_CACHE_LINES; i++) begin
            #20
            index   = i;
            tag_in  = $urandom_range(1, TAG_LENGTH ** 2);
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

