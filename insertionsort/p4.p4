header_type metadata_t {
    fields {
        val0 : 32;
        val1 : 32;
        val2 : 32;
        val3 : 32;
        val4 : 32;
        tmp  : 32;
    }
}

metadata metadata_t meta;

action sort_step() {
    if (meta.val0 > meta.val1) {
        meta.tmp   = meta.val0;
        meta.val0  = meta.val1;
        meta.val1  = meta.tmp;
    }
    if (meta.val1 > meta.val2) {
        meta.tmp   = meta.val1;
        meta.val1  = meta.val2;
        meta.val2  = meta.tmp;
    }
    if (meta.val2 > meta.val3) {
        meta.tmp   = meta.val2;
        meta.val2  = meta.val3;
        meta.val3  = meta.tmp;
    }
    if (meta.val3 > meta.val4) {
        meta.tmp   = meta.val3;
        meta.val3  = meta.val4;
        meta.val4  = meta.tmp;
    }
}

table insertion_sort {
    actions { sort_step; }
    default_action: sort_step;
}

control ingress {
    apply(insertion_sort);
}
