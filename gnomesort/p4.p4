header gnome_hdr_t {
    bit<32> value;
}

struct metadata_t {
    bit<32> i;
    bit<32> n;
}

control GnomeSort(inout gnome_hdr_t[10] arr, inout metadata_t meta) {
    action do_swap(in bit<32> idx) {
        bit<32> tmp = arr[idx].value;
        arr[idx].value = arr[idx-1].value;
        arr[idx-1].value = tmp;
    }

    apply {
        meta.i = 0;
        meta.n = 10;
        while (meta.i < meta.n) {
            if (meta.i == 0 || arr[meta.i].value >= arr[meta.i-1].value) {
                meta.i = meta.i + 1;
            } else {
                do_swap(meta.i);
                meta.i = meta.i - 1;
            }
        }
    }
}
