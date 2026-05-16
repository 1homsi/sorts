module GnomeSort

open FStar.Array
open FStar.Seq

val gnome_sort: arr:array int -> ST unit
    (requires fun h -> Array.live h arr)
    (ensures fun h0 _ h1 ->
        Array.live h1 arr /\
        Array.length h1 arr = Array.length h0 arr)
let gnome_sort arr =
    let n = Array.length arr in
    let i = ST.alloc 0 in
    while !i < n do
        if !i = 0 || index arr !i >= index arr (!i - 1) then
            i := !i + 1
        else begin
            let tmp = index arr !i in
            upd arr !i (index arr (!i - 1));
            upd arr (!i - 1) tmp;
            i := !i - 1
        end
    done
