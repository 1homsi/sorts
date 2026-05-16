#include <core.p4>
#include <v1model.p4>

header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> ether_type;
}

struct metadata_t {
    bit<32> arr_0;
    bit<32> arr_1;
    bit<32> arr_2;
    bit<32> arr_3;
    bit<32> arr_4;
    bit<32> arr_5;
    bit<32> arr_6;
}

control sort_control(inout metadata_t meta) {
    action swap_0_1() {
        bit<32> tmp = meta.arr_0;
        meta.arr_0 = meta.arr_1;
        meta.arr_1 = tmp;
    }
    action sort_network() {
        if (meta.arr_0 > meta.arr_1) swap_0_1();
    }
    apply {
        sort_network();
    }
}
