#!/bin/bash
declare -A left right val
node_count=0

insert() {
    local cur=$1 v=$2
    if [ -z "${val[$cur]}" ]; then
        val[$cur]=$v
        left[$cur]=""
        right[$cur]=""
        return
    fi
    if [ "$v" -lt "${val[$cur]}" ]; then
        if [ -z "${left[$cur]}" ]; then
            left[$cur]=$node_count
            ((node_count++))
        fi
        insert "${left[$cur]}" "$v"
    else
        if [ -z "${right[$cur]}" ]; then
            right[$cur]=$node_count
            ((node_count++))
        fi
        insert "${right[$cur]}" "$v"
    fi
}

inorder() {
    local cur=$1
    [ -z "${val[$cur]}" ] && return
    [ -n "${left[$cur]}" ] && inorder "${left[$cur]}"
    echo -n "${val[$cur]} "
    [ -n "${right[$cur]}" ] && inorder "${right[$cur]}"
}

treesort() {
    node_count=1
    val[0]=""
    for v in "$@"; do
        if [ -z "${val[0]}" ]; then
            val[0]=$v; left[0]=""; right[0]=""
        else
            insert 0 "$v"
        fi
    done
    inorder 0
    echo
}

treesort 5 3 7 1 4 6 8
