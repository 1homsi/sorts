#include "share/atspre_staload.hats"

fun get_digit(x: int, exp: int): int = (x / exp) mod 10

fun counting_sort(arr: list0(int), exp: int): list0(int) =
    let
        fun bucket(d: int): list0(int) =
            list0_filter_cloref(arr, lam x => get_digit(x, exp) = d)
        fun loop(d: int, acc: list0(int)): list0(int) =
            if d > 9 then acc
            else loop(d + 1, list0_append(acc, bucket(d)))
    in
        loop(0, list0_nil())
    end

fun radix_sort(arr: list0(int)): list0(int) =
    case arr of
    | list0_nil() => list0_nil()
    | _ =>
        let
            val max_val = list0_foldleft_cloref(arr, 0, lam (acc, x) => max(acc, x))
            fun loop(xs: list0(int), exp: int): list0(int) =
                if max_val / exp = 0 then xs
                else loop(counting_sort(xs, exp), exp * 10)
        in
            loop(arr, 1)
        end

implement main0() =
    let
        val arr = list0_of_list1($list{int}(170, 45, 75, 90, 802, 24, 2, 66))
        val sorted = radix_sort(arr)
    in
        list0_foreach_cloref(sorted, lam x => (print x; print " "));
        print_newline()
    end
