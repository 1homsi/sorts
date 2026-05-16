#include "share/atspre_staload.hats"

fun merge {m,n:nat} (
    left: list(int, m), right: list(int, n)
): list0(int) =
    case+ (left, right) of
    | (list_nil(), _) => list2list0(right)
    | (_, list_nil()) => list2list0(left)
    | (list_cons(lh, lt), list_cons(rh, rt)) =>
        if lh <= rh then list_cons0(lh, merge(lt, right))
        else list_cons0(rh, merge(left, rt))

fun mergeSort {n:nat} (lst: list(int, n)): list0(int) =
    let val n = list_length(lst) in
    if n <= 1 then list2list0(lst)
    else let
        val mid = n / 2
        val left = list_take_exn(lst, mid)
        val right = list_drop_exn(lst, mid)
    in merge(mergeSort(left), mergeSort(right)) end
    end

implement main0() = {
    val lst = list_cons(38, list_cons(27, list_cons(43, list_cons(3,
              list_cons(9, list_cons(82, list_cons(10, list_nil())))))))
    val sorted = mergeSort(lst)
    val () = list0_foreach(sorted, lam(x) => print_int(x))
    val () = print_newline()
}
