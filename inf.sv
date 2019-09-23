// Content          : Parameters for configuration
// Author           : Isuru Rathnayaka
// Last Modified    : 2019.09.13

package memory_sub_system_inf;
    interface cpu_ctrl();
    parameter ADDR_LENGTH   = 16;
        wire [ADDR_LENGTH-1:0]  addr;

        modport cpu();
        modport ctrl();
    endinterface

    interface cpu_cache();
    parameter ADDR_LENGTH   = 16;
        wire [ADDR_LENGTH-1:0]  addr;

        modport cpu();
        modport cache();
    endinterface
endpackage

