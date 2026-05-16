#include <core.p4>
#include <v1model.p4>

header sort_t {
    bit<32> val0;
    bit<32> val1;
    bit<32> val2;
    bit<32> val3;
    bit<32> val4;
}

control SelectionSort(inout sort_t hdr) {
    action swap(inout bit<32> a, inout bit<32> b) {
        bit<32> tmp = a;
        a = b;
        b = tmp;
    }
    
    apply {
        if (hdr.val1 < hdr.val0) swap(hdr.val0, hdr.val1);
        if (hdr.val2 < hdr.val0) swap(hdr.val0, hdr.val2);
        if (hdr.val3 < hdr.val0) swap(hdr.val0, hdr.val3);
        if (hdr.val4 < hdr.val0) swap(hdr.val0, hdr.val4);
        if (hdr.val2 < hdr.val1) swap(hdr.val1, hdr.val2);
        if (hdr.val3 < hdr.val1) swap(hdr.val1, hdr.val3);
        if (hdr.val4 < hdr.val1) swap(hdr.val1, hdr.val4);
        if (hdr.val3 < hdr.val2) swap(hdr.val2, hdr.val3);
        if (hdr.val4 < hdr.val2) swap(hdr.val2, hdr.val4);
        if (hdr.val4 < hdr.val3) swap(hdr.val3, hdr.val4);
    }
}
