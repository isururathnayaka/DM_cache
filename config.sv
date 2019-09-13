// Content          : Parameters for configuration
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.13

package memory_sub_system_config;
    localparam WORD_SIZE        = 32;       // 32bits

    localparam CACHE_SIZE       = 1024;     // 1kB
    localparam CACHE_LINE_SIZE  = 128;      // 128bits
    localparam NUM_CACHE_LINES  = CACHE_SIZE / CACHE_LINE_SIZE;

    localparam MEMORY_SIZE      = 64 * 1024;    // 64kB

    localparam ADDR_LENGTH      = $clog2(MEMORY_SIZE);      // Width of address bus
    localparam INDEX_LENGTH     = NUM_CACHE_LINES;
endpackage

