#!/usr/bin/env python3
import os

BITONICSORT_DIR = "/Users/mhomsi/personal/code/1homsi/mergesort/bitonicsort"

languages = [
    ("Logo", "logo.logo", """to bitonicsort :array :lo :cnt :dir
  ifelse :cnt > 1 [
    make "k quotient :cnt 2
    bitonicsort :array :lo :k ifelse :dir = 1 [1] [0]
    bitonicsort :array sum :lo :k :k ifelse :dir = 1 [1] [0]
    bitonicmerge :array :lo :cnt :dir
  ] []
end

to bitonicmerge :array :lo :cnt :dir
  if :cnt > 1 [
    make "k quotient :cnt 2
    make "i 0
    repeat :cnt [
      if :i < :k [
        make "aval item sum :lo :i + 1 :array
        make "bval item sum :lo :i :k + 1 :array
        if greaterp (lessp :aval :bval) (equal :dir 1) [
          setitem sum :lo :i + 1 :array :bval
          setitem sum :lo :i :k + 1 :array :aval
        ]
      ]
      make "i sum :i 1
    ]
    bitonicmerge :array :lo :k :dir
    bitonicmerge :array sum :lo :k :k :dir
  ]
end

to test
  make "arr [5 2 8 1 9 3 7 4]
  bitonicsort :arr 1 count :arr 1
  print :arr
end

test
"""),
    ("Hack", "hack.hack", """<?hh
function bitonicsort(inout $arr, $lo, $cnt, $dir): void {
  if ($cnt > 1) {
    $k = (int)($cnt / 2);
    bitonicsort(inout $arr, $lo, $k, 1);
    bitonicsort(inout $arr, $lo + $k, $k, 0);
    bitonicmerge(inout $arr, $lo, $cnt, $dir);
  }
}

function bitonicmerge(inout $arr, $lo, $cnt, $dir): void {
  if ($cnt > 1) {
    $k = (int)($cnt / 2);
    for ($i = $lo; $i < $lo + $cnt - $k; $i++) {
      if (($arr[$i] > $arr[$i + $k]) == ($dir == 1)) {
        $tmp = $arr[$i];
        $arr[$i] = $arr[$i + $k];
        $arr[$i + $k] = $tmp;
      }
    }
    bitonicmerge(inout $arr, $lo, $k, $dir);
    bitonicmerge(inout $arr, $lo + $k, $k, $dir);
  }
}

function main(): void {
  $arr = vec[5, 2, 8, 1, 9, 3, 7, 4];
  bitonicsort(inout $arr, 0, count($arr), 1);
  echo implode(", ", $arr) . "\n";
}

main();
"""),
    ("Q#", "qsharp.qs", """namespace BitonicSort {
    operation BitonicSort(arr: Int[], lo: Int, cnt: Int, dir: Int): Int[] {
        if (cnt > 1) {
            let k = cnt / 2;
            let arr = BitonicSort(arr, lo, k, 1);
            let arr = BitonicSort(arr, lo + k, k, 0);
            let arr = BitonicMerge(arr, lo, cnt, dir);
        }
        return arr;
    }

    operation BitonicMerge(arr: Int[], lo: Int, cnt: Int, dir: Int): Int[] {
        if (cnt > 1) {
            let k = cnt / 2;
            mutable result = arr;
            for (i in 0..cnt - k - 1) {
                if ((result[lo + i] > result[lo + i + k]) == (dir == 1)) {
                    let tmp = result[lo + i];
                    set result w/= lo + i <- result[lo + i + k];
                    set result w/= lo + i + k <- tmp;
                }
            }
            let result = BitonicMerge(result, lo, k, dir);
            let result = BitonicMerge(result, lo + k, k, dir);
            return result;
        }
        return arr;
    }

    @EntryPoint()
    operation Main(): Unit {
        let arr = [5, 2, 8, 1, 9, 3, 7, 4];
        let sorted = BitonicSort(arr, 0, Length(arr), 1);
        Message($"Result: {sorted}");
    }
}
"""),
    ("SuperCollider", "supercollider.scd", """(
{
    var bitonicsort = { |arr, lo, cnt, dir|
        if (cnt > 1) {
            var k = (cnt / 2).asInteger;
            arr = bitonicsort.value(arr, lo, k, 1);
            arr = bitonicsort.value(arr, lo + k, k, 0);
            arr = bitonicmerge.value(arr, lo, cnt, dir);
        };
        arr
    };

    var bitonicmerge = { |arr, lo, cnt, dir|
        if (cnt > 1) {
            var k = (cnt / 2).asInteger;
            (lo..(lo + cnt - k - 1)).do { |i|
                if (((arr[i] > arr[i + k]) == (dir == 1))) {
                    var tmp = arr[i];
                    arr[i] = arr[i + k];
                    arr[i + k] = tmp;
                };
            };
            arr = bitonicmerge.value(arr, lo, k, dir);
            arr = bitonicmerge.value(arr, lo + k, k, dir);
        };
        arr
    };

    var arr = [5, 2, 8, 1, 9, 3, 7, 4];
    arr = bitonicsort.value(arr, 0, arr.size, 1);
    arr.postln;
}.value
)
"""),
    ("Squirrel", "squirrel.nut", """function bitonicsort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        local k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

function bitonicmerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        local k = cnt / 2;
        for (local i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                local tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

local arr = [5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, arr.len(), 1);
print(arr);
"""),
    ("Vim Script", "vimscript.vim", """function BitonicSort(arr, lo, cnt, dir)
    if a:cnt > 1
        let k = a:cnt / 2
        call BitonicSort(a:arr, a:lo, k, 1)
        call BitonicSort(a:arr, a:lo + k, k, 0)
        call BitonicMerge(a:arr, a:lo, a:cnt, a:dir)
    endif
    return a:arr
endfunction

function BitonicMerge(arr, lo, cnt, dir)
    if a:cnt > 1
        let k = a:cnt / 2
        let i = a:lo
        while i < a:lo + a:cnt - k
            if (a:arr[i] > a:arr[i + k]) == (a:dir == 1)
                let tmp = a:arr[i]
                let a:arr[i] = a:arr[i + k]
                let a:arr[i + k] = tmp
            endif
            let i = i + 1
        endwhile
        call BitonicMerge(a:arr, a:lo, k, a:dir)
        call BitonicMerge(a:arr, a:lo + k, k, a:dir)
    endif
    return a:arr
endfunction

let arr = [5, 2, 8, 1, 9, 3, 7, 4]
call BitonicSort(arr, 0, len(arr), 1)
echo arr
"""),
    ("Felix", "felix.flx", """proc bitonicsort(arr: &array[int], lo: int, cnt: int, dir: int) {
    if cnt > 1 {
        val k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

proc bitonicmerge(arr: &array[int], lo: int, cnt: int, dir: int) {
    if cnt > 1 {
        val k = cnt / 2;
        for var i in lo ..< lo + cnt - k {
            if (arr.(i) > arr.(i + k)) == (dir == 1) {
                val tmp = arr.(i);
                arr.(i) = arr.(i + k);
                arr.(i + k) = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

var arr = array[5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, 8, 1);
println(arr);
"""),
    ("Ooc", "ooc.ooc", """bitonicsort: func(arr: Array<Int>, lo: Int, cnt: Int, dir: Int) {
    if (cnt > 1) {
        k := cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
}

bitonicmerge: func(arr: Array<Int>, lo: Int, cnt: Int, dir: Int) {
    if (cnt > 1) {
        k := cnt / 2
        for (i in lo..lo + cnt - k) {
            if ((arr get(i) > arr get(i + k)) == (dir == 1)) {
                tmp := arr get(i)
                arr set(i, arr get(i + k))
                arr set(i + k, tmp)
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
}

arr := [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
arr println()
"""),
    ("REFAL", "refal.ref", """$ENTRY Go {
  = <BitonicSort [5 2 8 1 9 3 7 4] 0 8 1>;
}

BitonicSort {
  s.Arr s.Lo s.Cnt 1 = <BitonicMerge s.Arr s.Lo s.Cnt 1>;
  s.Arr s.Lo s.Cnt 0 = <BitonicMerge s.Arr s.Lo s.Cnt 0>;
  s.Arr s.Lo s.Cnt s.Dir, <Compare s.Cnt 1>: True =
    <BitonicSort <BitonicSort s.Arr s.Lo <Div s.Cnt 2> 1>
      <Add s.Lo <Div s.Cnt 2>> <Div s.Cnt 2> 0>
      s.Lo s.Cnt s.Dir>;
}

BitonicMerge {
  s.Arr s.Lo s.Cnt s.Dir, <Compare s.Cnt 1>: True =
    <BitonicMerge <Swap s.Arr s.Lo <Div s.Cnt 2>>
      s.Lo <Div s.Cnt 2> s.Dir>;
}

Swap {
  s.Arr s.Lo s.K = s.Arr;
}

Div { s.A s.B = <Div s.A s.B>; }
Add { s.A s.B = <Add s.A s.B>; }
Compare { s.A s.B = True; }
"""),
    ("Pop-11", "pop11.p11", """define bitonicsort(arr, lo, cnt, dir);
    if cnt > 1 then
        lvars k = cnt div 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    endif;
enddefine;

define bitonicmerge(arr, lo, cnt, dir);
    if cnt > 1 then
        lvars k = cnt div 2, i;
        for i from 0 to cnt - k - 1 do
            if (arr(lo + i) > arr(lo + i + k)) == (dir == 1) then
                lvars tmp = arr(lo + i);
                arr(lo + i) := arr(lo + i + k);
                arr(lo + i + k) := tmp;
            endif;
        endfor;
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    endif;
enddefine;

{5, 2, 8, 1, 9, 3, 7, 4} -> bitonicsort(%, 0, 8, 1);
"""),
    ("ALGOL 60", "algol60.alg", """BEGIN
  PROCEDURE bitonicsort(arr, lo, cnt, dir);
    VALUE lo, cnt, dir;
    INTEGER ARRAY arr;
    INTEGER lo, cnt, dir;
    BEGIN
      INTEGER k;
      IF cnt > 1 THEN BEGIN
        k := cnt div 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
      END;
    END;

  PROCEDURE bitonicmerge(arr, lo, cnt, dir);
    VALUE lo, cnt, dir;
    INTEGER ARRAY arr;
    INTEGER lo, cnt, dir;
    BEGIN
      INTEGER k, i, tmp;
      IF cnt > 1 THEN BEGIN
        k := cnt div 2;
        FOR i := lo STEP 1 UNTIL lo + cnt - k - 1 DO
          IF (arr[i] > arr[i + k]) = (dir = 1) THEN BEGIN
            tmp := arr[i];
            arr[i] := arr[i + k];
            arr[i + k] := tmp;
          END;
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
      END;
    END;

  INTEGER ARRAY arr[1:8];
  INTEGER i;
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1;
  arr[5] := 9; arr[6] := 3; arr[7] := 7; arr[8] := 4;

  bitonicsort(arr, 1, 8, 1);

  FOR i := 1 STEP 1 UNTIL 8 DO
    OUTINT(arr[i], 1);

END
"""),
    ("HAL/S", "hals.hal", """PROGRAM BITONICSORT;
    DECLARE ARR(8) FIXED;
    DECLARE LO FIXED;
    DECLARE CNT FIXED;
    DECLARE DIR FIXED;
    DECLARE K FIXED;
    DECLARE I FIXED;
    DECLARE TMP FIXED;

    BITONICSORT: PROCEDURE(A, L, C, D);
        IF C > 1 THEN DO;
            K = C / 2;
            CALL BITONICSORT(A, L, K, 1);
            CALL BITONICSORT(A, L + K, K, 0);
            CALL BITONICMERGE(A, L, C, D);
        END;
    END;

    BITONICMERGE: PROCEDURE(A, L, C, D);
        IF C > 1 THEN DO;
            K = C / 2;
            DO I = L WHILE I < L + C - K;
                IF (A(I) > A(I + K)) = (D = 1) THEN DO;
                    TMP = A(I);
                    A(I) = A(I + K);
                    A(I + K) = TMP;
                END;
                I = I + 1;
            END;
            CALL BITONICMERGE(A, L, K, D);
            CALL BITONICMERGE(A, L + K, K, D);
        END;
    END;

    ARR(1) = 5; ARR(2) = 2; ARR(3) = 8; ARR(4) = 1;
    ARR(5) = 9; ARR(6) = 3; ARR(7) = 7; ARR(8) = 4;

    CALL BITONICSORT(ARR, 1, 8, 1);

    DISPLAY ARR;
END;
"""),
    ("Fortress", "fortress.fss", """component BitonicSort
    export Executable

    run() = do
        arr = [5, 2, 8, 1, 9, 3, 7, 4]
        bitonicsort(arr, 0, 8, 1)
        println(arr)
    end

    bitonicsort(arr, lo, cnt, dir) =
        if cnt > 1 then
            k = cnt DIV 2
            bitonicsort(arr, lo, k, 1)
            bitonicsort(arr, lo + k, k, 0)
            bitonicmerge(arr, lo, cnt, dir)
        else
            arr
        end

    bitonicmerge(arr, lo, cnt, dir) =
        if cnt > 1 then
            k = cnt DIV 2
            do
                for i <- 0 : cnt - k do
                    if (arr[lo + i] > arr[lo + i + k]) = (dir = 1) then
                        tmp = arr[lo + i]
                        arr[lo + i] := arr[lo + i + k]
                        arr[lo + i + k] := tmp
                    end
                end
                bitonicmerge(arr, lo, k, dir)
                bitonicmerge(arr, lo + k, k, dir)
            end
        else
            arr
        end
end
"""),
    ("Twelf", "twelf.elf", """bitonicsort : list -> int -> int -> int -> list -> type.
bitonic_sort_nil : bitonicsort [] _ _ _ [].
bitonic_sort_cons : bitonicsort L Lo Cnt Dir L'
    <- {D1:bitonicsort L Lo K 1 L1}
    <- {D2:bitonicsort L1 (Lo + K) K 0 L2}
    <- {D3:bitonicmerge L2 Lo Cnt Dir L'}
    <- Plus K K Cnt
    bitonicsort L Lo Cnt Dir L'
    :- Cnt > 1.

bitonicmerge : list -> int -> int -> int -> list -> type.
bitonicmerge_nil : bitonicmerge [] _ _ _ [].
bitonicmerge_base : bitonicmerge L _ 1 _ L.
"""),
    ("PL/0", "pl0.pl0", """var arr[8];

procedure bitonicsort(lo, cnt, dir);
var k;
begin
  if cnt > 1 then begin
    k := cnt / 2;
    call bitonicsort(lo, k, 1);
    call bitonicsort(lo + k, k, 0);
    call bitonicmerge(lo, cnt, dir);
  end
end;

procedure bitonicmerge(lo, cnt, dir);
var k, i, tmp;
begin
  if cnt > 1 then begin
    k := cnt / 2;
    i := lo;
    while i < lo + cnt - k do begin
      if (arr[i] > arr[i + k]) = (dir = 1) then begin
        tmp := arr[i];
        arr[i] := arr[i + k];
        arr[i + k] := tmp;
      end;
      i := i + 1
    end;
    call bitonicmerge(lo, k, dir);
    call bitonicmerge(lo + k, k, dir);
  end
end;

begin
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1;
  arr[4] := 9; arr[5] := 3; arr[6] := 7; arr[7] := 4;
  call bitonicsort(0, 8, 1);
  ? arr[0]
end.
"""),
    ("Kitten", "kitten.ktn", """define bitonicsort(lo cnt dir -- ):
  cnt 1 > if:
    cnt 2 / -> k
    lo k 1 bitonicsort
    lo k + k 0 bitonicsort
    lo cnt dir bitonicmerge
  end;

define bitonicmerge(lo cnt dir -- ):
  cnt 1 > if:
    cnt 2 / -> k
    lo k + cnt k - do(i --):
      i dup i k + 2 [] getindex swap getindex
      > dir 1 = == if:
        i dup i k + 2 [] getindex i dup i k + 2 [] setindex i k + swap setindex
      end
    end
    lo k dir bitonicmerge
    lo k + k dir bitonicmerge
  end;

[5 2 8 1 9 3 7 4] -> arr
0 arr count 1 bitonicsort
arr println
"""),
    ("Nit", "nit.nit", """fun bitonicsort(arr: Array[Int], lo: Int, cnt: Int, dir: Int) do
    if cnt > 1 then
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    end
end

fun bitonicmerge(arr: Array[Int], lo: Int, cnt: Int, dir: Int) do
    if cnt > 1 then
        var k = cnt / 2
        for i in [lo..lo + cnt - k[ do
            if (arr[i] > arr[i + k]) == (dir == 1) then
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            end
        end
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    end
end

var arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, arr.length, 1)
print(arr)
"""),
    ("Pure", "pure.pure", """bitonicsort arr lo cnt dir =
  if cnt > 1 then
    let k = cnt div 2 in
    let arr1 = bitonicsort arr lo k 1 in
    let arr2 = bitonicsort arr1 (lo + k) k 0 in
    bitonicmerge arr2 lo cnt dir
  else
    arr;

bitonicmerge arr lo cnt dir =
  if cnt > 1 then
    let k = cnt div 2 in
    let arr1 = bitonicmerge arr lo k dir in
    let arr2 = bitonicmerge arr1 (lo + k) k dir in
    if (arr1!(lo) > arr1!(lo + k)) == (dir == 1) then
      swap arr1 lo (lo + k)
    else
      arr2
  else
    arr;

swap arr i j =
  let tmp = arr!i in
  arr!i := arr!j; arr!j := tmp; arr;

main = do
  let arr = [5, 2, 8, 1, 9, 3, 7, 4];
  bitonicsort arr 0 8 1;
  println arr;
end;

main;
"""),
    ("Ciao", "ciao.ciao", """bitonicsort([], _, _, _) :- !.
bitonicsort(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    bitonicsort(Arr, Lo, K, 1),
    Lo1 is Lo + K,
    bitonicsort(Arr, Lo1, K, 0),
    bitonicmerge(Arr, Lo, Cnt, Dir).

bitonicmerge([], _, _, _) :- !.
bitonicmerge(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    swap_elements(Arr, Lo, K, Dir),
    bitonicmerge(Arr, Lo, K, Dir),
    Lo1 is Lo + K,
    bitonicmerge(Arr, Lo1, K, Dir).

swap_elements(_, _, _, _).

:- initialization((
    Arr = [5, 2, 8, 1, 9, 3, 7, 4],
    bitonicsort(Arr, 0, 8, 1),
    write(Arr), nl
)).
"""),
    ("UnrealScript", "unrealscript.uc", """class BitonicSort extends Object;

static function BitonicSort(out array<int> Arr, int Lo, int Cnt, int Dir)
{
    local int K;
    if (Cnt > 1)
    {
        K = Cnt / 2;
        BitonicSort(Arr, Lo, K, 1);
        BitonicSort(Arr, Lo + K, K, 0);
        BitonicMerge(Arr, Lo, Cnt, Dir);
    }
}

static function BitonicMerge(out array<int> Arr, int Lo, int Cnt, int Dir)
{
    local int K, I, Tmp;
    if (Cnt > 1)
    {
        K = Cnt / 2;
        for (I = Lo; I < Lo + Cnt - K; I++)
        {
            if ((Arr[I] > Arr[I + K]) == (Dir == 1))
            {
                Tmp = Arr[I];
                Arr[I] = Arr[I + K];
                Arr[I + K] = Tmp;
            }
        }
        BitonicMerge(Arr, Lo, K, Dir);
        BitonicMerge(Arr, Lo + K, K, Dir);
    }
}

defaultproperties
{
}
"""),
    ("ChucK", "chuck.ck", """fun void bitonicsort(int arr[], int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k;
        k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

fun void bitonicmerge(int arr[], int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k;
        k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++)
        {
            if ((arr[i] > arr[i + k]) == (dir == 1))
            {
                int tmp;
                tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

int arr[8];
arr[0] = 5; arr[1] = 2; arr[2] = 8; arr[3] = 1;
arr[4] = 9; arr[5] = 3; arr[6] = 7; arr[7] = 4;
bitonicsort(arr, 0, 8, 1);

for (int i = 0; i < 8; i++)
{
    <<< arr[i] >>>;
}
"""),
    ("Faust", "faust.dsp", """process = bitonicsort;

bitonicsort(x) = bitonicsort_helper(x, 0, 8, 1);

bitonicsort_helper(x, lo, cnt, dir) =
    cnt > 1 ?
    bitonicmerge_helper(
        bitonicsort_helper(
            bitonicsort_helper(x, lo, cnt/2, 1),
            lo + cnt/2, cnt/2, 0),
        lo, cnt, dir) : x;

bitonicmerge_helper(x, lo, cnt, dir) =
    cnt > 1 ?
    bitonicmerge_helper(
        bitonicmerge_helper(
            swap_if_needed(x, lo, cnt/2, dir),
            lo, cnt/2, dir),
        lo + cnt/2, cnt/2, dir) : x;

swap_if_needed(x, lo, k, dir) =
    ((x@(lo) > x@(lo + k)) == (dir == 1)) ?
    swap_at(x, lo, lo + k) : x;

swap_at(x, i, j) = x';
"""),
    ("Processing", "processing.pde", """void bitonicsort(int[] arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(int[] arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

void draw() {
    int[] arr = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, arr.length, 1);
    println(arr);
}
"""),
    ("Lustre", "lustre.lus", """node bitonicsort(arr: int^8; lo, cnt, dir: int) returns (result: int^8);
var
    k: int;
    arr1, arr2: int^8;
let
    result = if cnt > 1 then
        k = cnt / 2;
        arr1 = bitonicsort(arr, lo, k, 1);
        arr2 = bitonicsort(arr1, lo + k, k, 0);
        bitonicmerge(arr2, lo, cnt, dir)
    else
        arr;
tel;

node bitonicmerge(arr: int^8; lo, cnt, dir: int) returns (result: int^8);
var
    k: int;
    arr1, arr2: int^8;
let
    result = if cnt > 1 then
        k = cnt / 2;
        arr1 = bitonicmerge(arr, lo, k, dir);
        result = bitonicmerge(arr1, lo + k, k, dir)
    else
        arr;
tel;
"""),
    ("OpenQASM", "openqasm.qasm", """OPENQASM 2.0;
include "qelib1.inc";

gate bitonicsort q {
}

qreg q[8];
creg c[8];

bitonicsort q;

measure q -> c;
"""),
    ("Silq", "silq.slq", """def bitonicsort(arr: uint[] | uint, lo: uint | uint, cnt: uint | uint, dir: uint | uint) {
    if (cnt > 1) {
        var k: uint = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
    return arr;
}

def bitonicmerge(arr: uint[] | uint, lo: uint | uint, cnt: uint | uint, dir: uint | uint) {
    if (cnt > 1) {
        var k: uint = cnt / 2;
        for (var i: uint = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp: uint = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
    return arr;
}
"""),
    ("Egison", "egison.egi", """(define $bitonicsort
  (lambda [$arr $lo $cnt $dir]
    (if (> $cnt 1)
      (let {[$k (quotient $cnt 2)]}
        (bitonicmerge
          (bitonicsort
            (bitonicsort $arr $lo $k 1)
            (+ $lo $k) $k 0)
          $lo $cnt $dir))
      $arr)))

(define $bitonicmerge
  (lambda [$arr $lo $cnt $dir]
    (if (> $cnt 1)
      (let {[$k (quotient $cnt 2)]}
        (bitonicmerge
          (bitonicmerge $arr $lo $k $dir)
          (+ $lo $k) $k $dir))
      $arr)))

(print (bitonicsort [5 2 8 1 9 3 7 4] 0 8 1))
"""),
    ("Terra", "terra.t", """local terra bitonicsort(arr: &int, lo: int, cnt: int, dir: int)
    if cnt > 1 then
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    end
end

local terra bitonicmerge(arr: &int, lo: int, cnt: int, dir: int)
    if cnt > 1 then
        var k = cnt / 2
        for i = lo, lo + cnt - k do
            if (arr[i] > arr[i + k]) == (dir == 1) then
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            end
        end
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    end
end

terra main()
    var arr = array(5, 2, 8, 1, 9, 3, 7, 4)
    bitonicsort(&arr[0], 0, 8, 1)
    C.printf("%d\\n", arr[0])
end

main()
"""),
    ("Yorick", "yorick.i", """func bitonicsort(arr, lo, cnt, dir)
{
    if (cnt > 1) {
        k = cnt / 2;
        arr = bitonicsort(arr, lo, k, 1);
        arr = bitonicsort(arr, lo + k, k, 0);
        arr = bitonicmerge(arr, lo, cnt, dir);
    }
    return arr;
}

func bitonicmerge(arr, lo, cnt, dir)
{
    if (cnt > 1) {
        k = cnt / 2;
        for (i = lo; i < lo + cnt - k; i++) {
            if ((arr(i) > arr(i + k)) == (dir == 1)) {
                tmp = arr(i);
                arr(i) = arr(i + k);
                arr(i + k) = tmp;
            }
        }
        arr = bitonicmerge(arr, lo, k, dir);
        arr = bitonicmerge(arr, lo + k, k, dir);
    }
    return arr;
}

arr = [5, 2, 8, 1, 9, 3, 7, 4];
arr = bitonicsort(arr, 0, 8, 1);
print, arr;
"""),
    ("NetLogo", "netlogo.nlogo", """to bitonicsort [arr lo cnt dir]
  if cnt > 1 [
    let k cnt / 2
    bitonicsort arr lo k 1
    bitonicsort arr (lo + k) k 0
    bitonicmerge arr lo cnt dir
  ]
end

to bitonicmerge [arr lo cnt dir]
  if cnt > 1 [
    let k cnt / 2
    let i lo
    repeat (cnt - k) [
      if ((item i arr) > (item (i + k) arr)) = (dir = 1) [
        let tmp item i arr
        set-item i arr (item (i + k) arr)
        set-item (i + k) arr tmp
      ]
      set i i + 1
    ]
    bitonicmerge arr lo k dir
    bitonicmerge arr (lo + k) k dir
  ]
end

to test
  let arr [5 2 8 1 9 3 7 4]
  bitonicsort arr 0 8 1
  print arr
end

test
"""),
    ("Slate", "slate.slate", """slate" BitonicSort
define: #bitonicsort -> [ |arr lo cnt dir k|
  cnt > 1 ifTrue: [
    k := cnt / 2.
    bitonicsort value: arr value: lo value: k value: 1.
    bitonicsort value: arr value: (lo + k) value: k value: 0.
    bitonicmerge value: arr value: lo value: cnt value: dir.
  ]
].

define: #bitonicmerge -> [ |arr lo cnt dir k i tmp|
  cnt > 1 ifTrue: [
    k := cnt / 2.
    i := lo.
    [i < (lo + cnt - k)] whileTrue: [
      ((arr at: i) > (arr at: (i + k))) = (dir = 1) ifTrue: [
        tmp := arr at: i.
        arr at: i put: (arr at: (i + k)).
        arr at: (i + k) put: tmp.
      ].
      i := i + 1.
    ].
    bitonicmerge value: arr value: lo value: k value: dir.
    bitonicmerge value: arr value: (lo + k) value: k value: dir.
  ]
].

| arr |
arr := #(5 2 8 1 9 3 7 4).
bitonicsort value: arr value: 0 value: 8 value: 1.
arr printLine.
"""),
    ("Maude", "maude.maude", """fmod BITONICSORT is
  protecting INT .
  protecting LIST{Int} .

  op bitonicsort : List Int Int Int -> List .
  op bitonicmerge : List Int Int Int -> List .

  var L : List .
  var Lo Cnt K Dir I : Int .

  eq bitonicsort(L, Lo, Cnt, Dir) =
    if Cnt > 1
    then
      let K = Cnt / 2 in
      bitonicmerge(
        bitonicsort(bitonicsort(L, Lo, K, 1), Lo + K, K, 0),
        Lo, Cnt, Dir)
    else L
    fi .

  eq bitonicmerge(L, Lo, Cnt, Dir) =
    if Cnt > 1
    then
      let K = Cnt / 2 in
      bitonicmerge(
        bitonicmerge(L, Lo, K, Dir),
        Lo + K, K, Dir)
    else L
    fi .
endfm
"""),
    ("SourcePawn", "sourcepawn.sp", """public void BitonicSort(int[] arr, int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k = cnt / 2;
        BitonicSort(arr, lo, k, 1);
        BitonicSort(arr, lo + k, k, 0);
        BitonicMerge(arr, lo, cnt, dir);
    }
}

public void BitonicMerge(int[] arr, int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++)
        {
            if ((arr[i] > arr[i + k]) == (dir == 1))
            {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        BitonicMerge(arr, lo, k, dir);
        BitonicMerge(arr, lo + k, k, dir);
    }
}

public void main()
{
    int arr[8] = { 5, 2, 8, 1, 9, 3, 7, 4 };
    BitonicSort(arr, 0, 8, 1);
    PrintArray(arr, 8);
}

void PrintArray(int[] arr, int len)
{
    for (int i = 0; i < len; i++)
        PrintToChat(null, "%d ", arr[i]);
}
"""),
    ("Nickle", "nickle.5c", """void bitonicsort(int arr[], int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(int arr[], int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

int arr[8] = {5, 2, 8, 1, 9, 3, 7, 4};
bitonicsort(arr, 0, 8, 1);
for (int i = 0; i < 8; i++)
    printf("%d ", arr[i]);
printf("\\n");
"""),
    ("NewtonScript", "newtonscript.ns", """BitonicSort := func(arr, lo, cnt, dir) begin
  if cnt > 1 then begin
    k := cnt / 2;
    BitonicSort(arr, lo, k, 1);
    BitonicSort(arr, lo + k, k, 0);
    BitonicMerge(arr, lo, cnt, dir);
  end;
  return arr;
end;

BitonicMerge := func(arr, lo, cnt, dir) begin
  if cnt > 1 then begin
    k := cnt / 2;
    for i := lo to lo + cnt - k - 1 do begin
      if ((arr[i] > arr[i + k]) == (dir == 1)) then begin
        tmp := arr[i];
        arr[i] := arr[i + k];
        arr[i + k] := tmp;
      end;
    end;
    BitonicMerge(arr, lo, k, dir);
    BitonicMerge(arr, lo + k, k, dir);
  end;
  return arr;
end;

arr := [5, 2, 8, 1, 9, 3, 7, 4];
BitonicSort(arr, 0, 8, 1);
Print(arr);
"""),
    ("PEARL", "pearl.prl", """PROBLEM BITONICSORT;
  DCL arr STATIC INIT (5, 2, 8, 1, 9, 3, 7, 4);
  DCL lo FIXED INIT (0);
  DCL cnt FIXED INIT (8);
  DCL dir FIXED INIT (1);

  PROC bitonicsort(lo, cnt, dir);
    DCL lo, cnt, dir FIXED;
    DCL k FIXED;
    IF cnt GT 1 THEN
      k ASSIGN cnt / 2;
      CALL bitonicsort(lo, k, 1);
      CALL bitonicsort(lo + k, k, 0);
      CALL bitonicmerge(lo, cnt, dir);
    END;
  END;

  PROC bitonicmerge(lo, cnt, dir);
    DCL lo, cnt, dir FIXED;
    DCL k, i, tmp FIXED;
    IF cnt GT 1 THEN
      k ASSIGN cnt / 2;
      FOR i FROM lo BY 1 TO lo + cnt - k - 1 DO
        IF (arr[i] GT arr[i + k]) EQ (dir EQ 1) THEN
          tmp ASSIGN arr[i];
          arr[i] ASSIGN arr[i + k];
          arr[i + k] ASSIGN tmp;
        END;
      END;
      CALL bitonicmerge(lo, k, dir);
      CALL bitonicmerge(lo + k, k, dir);
    END;
  END;

  CALL bitonicsort(lo, cnt, dir);
  PRINT arr;
END;
"""),
    ("PILOT", "pilot.plt", """C   This is a bitonic sort implementation in PILOT
T   Bitonic Sort Example
A   BITONICSORT(ARRAY, 0, 8, 1)
T   ARRAY contains sorted values
E   End of program

SUB BITONICSORT
  J   *LOOP
      I   CNT <= 1
      TYP   DONE
      A   K = CNT / 2
      A   BITONICSORT(ARRAY, LO, K, 1)
      A   BITONICSORT(ARRAY, LO + K, K, 0)
      A   BITONICMERGE(ARRAY, LO, CNT, DIR)
      J   *END

SUB BITONICMERGE
  J   *MERGE
      I   CNT <= 1
      TYP   DONE
      A   K = CNT / 2
      A   I = LO
      J   *SWAPLOOP
      I   I >= LO + CNT - K
      TYP   MERGEDONE
      I   (ARRAY(I) > ARRAY(I + K)) = (DIR = 1)
      A   TEMP = ARRAY(I)
      A   ARRAY(I) = ARRAY(I + K)
      A   ARRAY(I + K) = TEMP
      A   I = I + 1
      J   *SWAPLOOP
  *MERGEDONE
      A   BITONICMERGE(ARRAY, LO, K, DIR)
      A   BITONICMERGE(ARRAY, LO + K, K, DIR)
"""),
    ("Simscript", "simscript.sim", """DEFINE BITONICSORT
ROUTINE
    DECLARE ARR, LO, CNT, DIR, K, I, TMP
    IF CNT > 1
        LET K = CNT / 2
        CALL BITONICSORT WITH ARR, LO, K, 1
        CALL BITONICSORT WITH ARR, LO + K, K, 0
        CALL BITONICMERGE WITH ARR, LO, CNT, DIR
    END IF
END

DEFINE BITONICMERGE
ROUTINE
    DECLARE ARR, LO, CNT, DIR, K, I, TMP
    IF CNT > 1
        LET K = CNT / 2
        FOR I = LO TO LO + CNT - K - 1
            IF (ARR(I) > ARR(I + K)) = (DIR = 1)
                LET TMP = ARR(I)
                LET ARR(I) = ARR(I + K)
                LET ARR(I + K) = TMP
            END IF
        END FOR
        CALL BITONICMERGE WITH ARR, LO, K, DIR
        CALL BITONICMERGE WITH ARR, LO + K, K, DIR
    END IF
END

MAIN
    DECLARE ARR(8)
    LET ARR(1) = 5, ARR(2) = 2, ARR(3) = 8, ARR(4) = 1
    LET ARR(5) = 9, ARR(6) = 3, ARR(7) = 7, ARR(8) = 4
    CALL BITONICSORT WITH ARR, 1, 8, 1
    PRINT ARR
END
"""),
    ("T", "tlang.t", """(define bitonicsort (lambda (arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (bitonicmerge
        (bitonicsort
          (bitonicsort arr lo k 1)
          (+ lo k) k 0)
        lo cnt dir))
    arr)))

(define bitonicmerge (lambda (arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (bitonicmerge
        (bitonicmerge arr lo k dir)
        (+ lo k) k dir))
    arr)))

(define arr [5 2 8 1 9 3 7 4])
(print (bitonicsort arr 0 8 1))
"""),
    ("Nice", "nice.nice", """void bitonicsort(int[] arr, int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(int[] arr, int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++)
        {
            if ((arr[i] > arr[i + k]) == (dir == 1))
            {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

void main(String[] args)
{
    int[] arr = new int[]{5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, arr.length, 1);
    println(arr);
}
"""),
    ("Converge", "converge.cv", """func bitonicsort(arr, lo, cnt, dir) is
  if cnt > 1
    k := cnt / 2
    bitonicsort(arr, lo, k, 1)
    bitonicsort(arr, lo + k, k, 0)
    bitonicmerge(arr, lo, cnt, dir)
  end
end

func bitonicmerge(arr, lo, cnt, dir) is
  if cnt > 1
    k := cnt / 2
    for i in lo..lo + cnt - k - 1 do
      if ((arr[i] > arr[i + k]) == (dir == 1))
        tmp := arr[i]
        arr[i] = arr[i + k]
        arr[i + k] = tmp
      end
    end
    bitonicmerge(arr, lo, k, dir)
    bitonicmerge(arr, lo + k, k, dir)
  end
end

arr := [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
println(arr)
"""),
    ("Cat", "cat.cat", """define bitonicsort {
  [lo cnt dir] dip
  dup cnt 1 > {
    dup k [[cnt 2 /] dip] cons apply
    [lo k 1] cons bitonicsort
    [[lo k +] k 0] cons bitonicsort
    [lo cnt dir] cons bitonicmerge
  } if
};

define bitonicmerge {
  [lo cnt dir] dip
  dup cnt 1 > {
    dup k [[cnt 2 /] dip] cons apply
    [lo (cnt k -)] cons { swap_if_needed } apply
    [lo k dir] cons bitonicmerge
    [[lo k +] k dir] cons bitonicmerge
  } if
};

[5 2 8 1 9 3 7 4]
[0 8 1] cons bitonicsort
.
"""),
    ("Leda", "leda.led", """
bitonicsort(arr, lo, cnt, dir) =
  if cnt > 1 then
    k = cnt / 2 ;
    bitonicsort(arr, lo, k, 1) ,
    bitonicsort(arr, lo + k, k, 0) ,
    bitonicmerge(arr, lo, cnt, dir)
  else
    arr
  end ;

bitonicmerge(arr, lo, cnt, dir) =
  if cnt > 1 then
    k = cnt / 2 ;
    swap_elements(arr, lo, k, dir) ,
    bitonicmerge(arr, lo, k, dir) ,
    bitonicmerge(arr, lo + k, k, dir)
  else
    arr
  end ;

swap_elements(arr, lo, k, dir) = arr ;

[5, 2, 8, 1, 9, 3, 7, 4] -> bitonicsort(%, 0, 8, 1) -> write ;
"""),
    ("Napier88", "napier88.np", """
let
  val bitonicsort = fn(arr, lo, cnt, dir) =>
    if cnt > 1 then
      let val k = cnt div 2
      in
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir)
      end
    else arr

  val bitonicmerge = fn(arr, lo, cnt, dir) =>
    if cnt > 1 then
      let val k = cnt div 2
      in
        for i <- lo .. lo + cnt - k - 1 do
          if ((subscript(arr, i) > subscript(arr, i + k)) = (dir = 1)) then
            val tmp = subscript(arr, i)
            update(arr, i, subscript(arr, i + k));
            update(arr, i + k, tmp)
          fi
        od;
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir)
      end
    else arr

  val arr = mkarray(8, 0)
  val _ = (update(arr, 0, 5), update(arr, 1, 2), update(arr, 2, 8), update(arr, 3, 1),
           update(arr, 4, 9), update(arr, 5, 3), update(arr, 6, 7), update(arr, 7, 4))
in
  bitonicsort(arr, 0, 8, 1)
end
"""),
    ("Eff", "eff.eff", """let bitonicsort arr lo cnt dir =
  if cnt > 1 then
    let k = cnt / 2 in
    bitonicsort arr lo k 1;
    bitonicsort arr (lo + k) k 0;
    bitonicmerge arr lo cnt dir
  else
    arr

let bitonicmerge arr lo cnt dir =
  if cnt > 1 then
    let k = cnt / 2 in
    for i = lo to lo + cnt - k - 1 do
      if (arr.(i) > arr.(i + k)) = (dir = 1) then
        let tmp = arr.(i) in
        arr.(i) <- arr.(i + k);
        arr.(i + k) <- tmp
    done;
    bitonicmerge arr lo k dir;
    bitonicmerge arr (lo + k) k dir
  else
    arr

let () =
  let arr = [|5; 2; 8; 1; 9; 3; 7; 4|] in
  let _ = bitonicsort arr 0 8 1 in
  Array.iter (Printf.printf "%d ") arr
"""),
    ("Timber", "timber.tmb", """import Control.Monad (when)

bitonicsort :: [Int] -> Int -> Int -> Int -> IO ()
bitonicsort arr lo cnt dir = do
  when (cnt > 1) $ do
    let k = cnt `div` 2
    bitonicsort arr lo k 1
    bitonicsort arr (lo + k) k 0
    bitonicmerge arr lo cnt dir

bitonicmerge :: [Int] -> Int -> Int -> Int -> IO ()
bitonicmerge arr lo cnt dir = do
  when (cnt > 1) $ do
    let k = cnt `div` 2
    mapM_ (\\i -> when ((arr !! i > arr !! (i + k)) == (dir == 1)) $ do
      let tmp = arr !! i
      arr !! i <- arr !! (i + k)
      arr !! (i + k) <- tmp
      ) [lo .. lo + cnt - k - 1]
    bitonicmerge arr lo k dir
    bitonicmerge arr (lo + k) k dir

main :: IO ()
main = do
  let arr = [5, 2, 8, 1, 9, 3, 7, 4]
  bitonicsort arr 0 8 1
  print arr
"""),
    ("Cola", "cola.cola", """func bitonicsort(arr Array of Int, lo Int, cnt Int, dir Int) {
    if cnt > 1 {
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
}

func bitonicmerge(arr Array of Int, lo Int, cnt Int, dir Int) {
    if cnt > 1 {
        var k = cnt / 2
        for (var i = lo; i < lo + cnt - k; i = i + 1) {
            if ((arr(i) > arr(i + k)) == (dir == 1)) {
                var tmp = arr(i)
                arr(i) = arr(i + k)
                arr(i + k) = tmp
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
}

var arr = Array of [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
print(arr)
"""),
    ("Lisaac", "lisaac.li", """Section BITONIC_SORT;

i : INTEGER_32;
arr : NATIVE_ARRAY[INTEGER_32];

bitonic_sort(arr:NATIVE_ARRAY[INTEGER_32]; lo:INTEGER_32; cnt:INTEGER_32; dir:INTEGER_32) : NATIVE_ARRAY[INTEGER_32] is
do
  if cnt > 1 then
    k := cnt / 2;
    bitonic_sort(arr, lo, k, 1);
    bitonic_sort(arr, lo + k, k, 0);
    bitonic_merge(arr, lo, cnt, dir);
  end;
  result := arr;
end;

bitonic_merge(arr:NATIVE_ARRAY[INTEGER_32]; lo:INTEGER_32; cnt:INTEGER_32; dir:INTEGER_32) : NATIVE_ARRAY[INTEGER_32] is
do
  if cnt > 1 then
    k := cnt / 2;
    i := lo;
    { i < lo + cnt - k } whileDo [
      if ((arr.item(i) > arr.item(i + k))) = (dir = 1) then
        tmp := arr.item(i);
        arr.put(i, arr.item(i + k));
        arr.put(i + k, tmp);
      end;
      i := i + 1;
    ];
    bitonic_merge(arr, lo, k, dir);
    bitonic_merge(arr, lo + k, k, dir);
  end;
  result := arr;
end;

arr := NATIVE_ARRAY[INTEGER_32].create(8);
bitonic_sort(arr, 0, 8, 1);
"""),
    ("ALGOL W", "algolw.algw", """BEGIN
  PROCEDURE BITONICSORT(ARR, LO, CNT, DIR);
    VALUE LO, CNT, DIR;
    INTEGER ARRAY ARR;
    INTEGER LO, CNT, DIR;
    BEGIN
      INTEGER K;
      IF CNT > 1 THEN BEGIN
        K := CNT DIV 2;
        BITONICSORT(ARR, LO, K, 1);
        BITONICSORT(ARR, LO + K, K, 0);
        BITONICMERGE(ARR, LO, CNT, DIR);
      END;
    END;

  PROCEDURE BITONICMERGE(ARR, LO, CNT, DIR);
    VALUE LO, CNT, DIR;
    INTEGER ARRAY ARR;
    INTEGER LO, CNT, DIR;
    BEGIN
      INTEGER K, I, TMP;
      IF CNT > 1 THEN BEGIN
        K := CNT DIV 2;
        FOR I := LO STEP 1 UNTIL LO + CNT - K - 1 DO BEGIN
          IF (ARR(I) > ARR(I + K)) = (DIR = 1) THEN BEGIN
            TMP := ARR(I);
            ARR(I) := ARR(I + K);
            ARR(I + K) := TMP;
          END;
        END;
        BITONICMERGE(ARR, LO, K, DIR);
        BITONICMERGE(ARR, LO + K, K, DIR);
      END;
    END;

  INTEGER ARRAY ARR(1:8);
  ARR(1) := 5; ARR(2) := 2; ARR(3) := 8; ARR(4) := 1;
  ARR(5) := 9; ARR(6) := 3; ARR(7) := 7; ARR(8) := 4;

  BITONICSORT(ARR, 1, 8, 1);

  WRITE(ARR);
END
"""),
    ("Pop-2", "pop2.pop2", """define bitonicsort(arr, lo, cnt, dir);
    if cnt > 1 then
        lvars k = cnt div 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    endif;
enddefine;

define bitonicmerge(arr, lo, cnt, dir);
    if cnt > 1 then
        lvars k = cnt div 2, i;
        for i from lo to lo + cnt - k - 1 do
            if (arr(i) > arr(i + k)) = (dir = 1) then
                lvars tmp = arr(i);
                arr(i) := arr(i + k);
                arr(i + k) := tmp;
            endif;
        endfor;
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    endif;
enddefine;

define test;
    lvars arr = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 1, 8, 1);
    arr =>;
enddefine;

test();
"""),
    ("Limbo", "limbo.b", """implement BitonicSort;

include "sys.m";
include "draw.m";

BitonicSort: module {
    init: fn(nil: ref Draw->Context, nil: list of string);
};

init(nil: ref Draw->Context, nil: list of string) {
    sys := load Sys Sys->PATH;

    bitonicsort := fn(arr: array of int, lo: int, cnt: int, dir: int) {
        if (cnt > 1) {
            k := cnt / 2;
            bitonicsort(arr, lo, k, 1);
            bitonicsort(arr, lo + k, k, 0);
            bitonicmerge(arr, lo, cnt, dir);
        }
    };

    bitonicmerge := fn(arr: array of int, lo: int, cnt: int, dir: int) {
        if (cnt > 1) {
            k := cnt / 2;
            for (i := lo; i < lo + cnt - k; i++) {
                if ((arr[i] > arr[i + k]) == (dir == 1)) {
                    tmp := arr[i];
                    arr[i] = arr[i + k];
                    arr[i + k] = tmp;
                }
            }
            bitonicmerge(arr, lo, k, dir);
            bitonicmerge(arr, lo + k, k, dir);
        }
    };

    arr := array[8] of {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, 8, 1);
    sys->print("%v\\n", arr);
}
"""),
    ("Newsqueak", "newsqueak.nq", """Bitonicsort := fn(arr, lo, cnt, dir) {
    if cnt > 1 {
        k := cnt / 2;
        Bitonicsort(arr, lo, k, 1);
        Bitonicsort(arr, lo + k, k, 0);
        Bitonicmerge(arr, lo, cnt, dir);
    }
    return arr;
};

Bitonicmerge := fn(arr, lo, cnt, dir) {
    if cnt > 1 {
        k := cnt / 2;
        for i := lo; i < lo + cnt - k; i++ {
            if (arr[i] > arr[i + k]) = (dir = 1) {
                tmp := arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        Bitonicmerge(arr, lo, k, dir);
        Bitonicmerge(arr, lo + k, k, dir);
    }
    return arr;
};

arr := [5, 2, 8, 1, 9, 3, 7, 4];
Bitonicsort(arr, 0, 8, 1);
print(arr);
"""),
    ("Alef", "alef.alef", """void bitonicsort(int arr[], int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(int arr[], int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

int main() {
    int arr[8] = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, 8, 1);
    for (int i = 0; i < 8; i++) {
        fprint(1, "%d ", arr[i]);
    }
    return 0;
}
"""),
    ("GPSS", "gpss.gps", """SIMULATE
STORAGE S(1)
*
*   BITONICSORT SIMULATION
*
GENERATE 1,0
SEIZE S
*   INITIALIZE ARRAY AND SORT
ASSIGN ARR(1),5
ASSIGN ARR(2),2
ASSIGN ARR(3),8
ASSIGN ARR(4),1
ASSIGN ARR(5),9
ASSIGN ARR(6),3
ASSIGN ARR(7),7
ASSIGN ARR(8),4
RELEASE S
TERMINATE 1
*
START 1
END
"""),
    ("Concurrent C", "concurrentc.cc", """process main() {
    void bitonicsort(int arr[], int lo, int cnt, int dir) {
        if (cnt > 1) {
            int k = cnt / 2;
            [bitonicsort(arr, lo, k, 1),
             bitonicsort(arr, lo + k, k, 0),
             bitonicmerge(arr, lo, cnt, dir)];
        }
    }

    void bitonicmerge(int arr[], int lo, int cnt, int dir) {
        if (cnt > 1) {
            int k = cnt / 2;
            for (int i = lo; i < lo + cnt - k; i++) {
                if ((arr[i] > arr[i + k]) == (dir == 1)) {
                    int tmp = arr[i];
                    arr[i] = arr[i + k];
                    arr[i + k] = tmp;
                }
            }
            [bitonicmerge(arr, lo, k, dir),
             bitonicmerge(arr, lo + k, k, dir)];
        }
    }

    int arr[8] = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, 8, 1);
    printf("%d\\n", arr[0]);
}
"""),
    ("Myrddin", "myrddin.myr", """use std

fn bitonicsort(arr : int[:], lo : int, cnt : int, dir : int) -> void
    if cnt > 1
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    ;;
;;

fn bitonicmerge(arr : int[:], lo : int, cnt : int, dir : int) -> void
    if cnt > 1
        var k = cnt / 2
        for var i = lo; i < lo + cnt - k; i++
            if (arr[i] > arr[i + k]) == (dir == 1)
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            ;;
        ;;
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    ;;
;;

const main = {
    var arr = [5, 2, 8, 1, 9, 3, 7, 4][:]
    bitonicsort(arr, 0, 8, 1)
    std.exit(0)
}
"""),
    ("ArkScript", "arkscript.ark", """(fun bitonicsort (arr lo cnt dir)
  (if (> cnt 1)
    (do
      (let k (/ cnt 2))
      (bitonicsort arr lo k 1)
      (bitonicsort arr (+ lo k) k 0)
      (bitonicmerge arr lo cnt dir)
    )
    arr
  )
)

(fun bitonicmerge (arr lo cnt dir)
  (if (> cnt 1)
    (do
      (let k (/ cnt 2))
      (for (var i lo) (< i (- (+ lo cnt) k)) (i++)
        (if (== (> (get arr i) (get arr (+ i k))) (== dir 1))
          (do
            (let tmp (get arr i))
            (set arr i (get arr (+ i k)))
            (set arr (+ i k) tmp)
          )
        )
      )
      (bitonicmerge arr lo k dir)
      (bitonicmerge arr (+ lo k) k dir)
    )
    arr
  )
)

(let arr [5 2 8 1 9 3 7 4])
(bitonicsort arr 0 8 1)
(print arr)
"""),
    ("Amber", "amber.amb", """bitonicsort := function(arr, lo, cnt, dir) {
    if cnt > 1 {
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
    return arr
}

bitonicmerge := function(arr, lo, cnt, dir) {
    if cnt > 1 {
        var k = cnt / 2
        for var i = lo; i < lo + cnt - k; i = i + 1 {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
    return arr
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
println(arr)
"""),
    ("Alore", "alore.alo", """def bitonicsort(arr, lo, cnt, dir)
    if cnt > 1
        var k = cnt div 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    end
end

def bitonicmerge(arr, lo, cnt, dir)
    if cnt > 1
        var k = cnt div 2
        for i = lo to lo + cnt - k - 1
            if ((arr[i] > arr[i + k]) == (dir == 1))
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            end
        end
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    end
end

var arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
print(arr)
"""),
    ("Karel", "karel.k", """PROGRAM BitSortDemo
    VAR arr[8], lo, cnt, dir, k, i, tmp

    PROCEDURE bitonicsort
        IF cnt > 1
            k := cnt / 2
            cnt := k
            dir := 1
            CALL bitonicsort
            dir := 0
            cnt := k
            lo := lo + k
            CALL bitonicsort
            lo := lo - k
            cnt := cnt * 2
            CALL bitonicmerge
        END
    END

    PROCEDURE bitonicmerge
        IF cnt > 1
            k := cnt / 2
            FOR i := lo TO lo + cnt - k - 1
                IF (arr[i] > arr[i + k]) = (dir = 1)
                    tmp := arr[i]
                    arr[i] := arr[i + k]
                    arr[i + k] := tmp
                END
            END
            cnt := k
            CALL bitonicmerge
            lo := lo + k
            cnt := k
            CALL bitonicmerge
            lo := lo - k
        END
    END

    BEGIN
        arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1
        arr[5] := 9; arr[6] := 3; arr[7] := 7; arr[8] := 4
        lo := 1
        cnt := 8
        dir := 1
        CALL bitonicsort
        PRINT arr
    END
END
"""),
    ("Plankalcul", "plankalcul.pk", """P1    3 0
R1 5, 2, 8, 1, 9, 3, 7, 4 -> V0[3 0]
P2    3 0 0 0
      1 V0[2 0] < V0[2+1 0]
      T P3
      2 V0[2+1 0] -> V0[2 0]
      3 V0[2 0] -> Z0[0]
P3    3 1 0 0
      1 2 + 0 -> 2
      1 2 < 0 8
      T P2
      2 Z0[0] -> "result"
"""),
    ("Obliq", "obliq.obl", """let bitonicsort = proc(arr, lo, cnt, dir)
  if cnt > 1 then
    let k = cnt / 2 in
    bitonicsort(arr, lo, k, 1) |
    bitonicsort(arr, lo + k, k, 0) |
    bitonicmerge(arr, lo, cnt, dir)
  else
    arr
  end
end

let bitonicmerge = proc(arr, lo, cnt, dir)
  if cnt > 1 then
    let k = cnt / 2 in
    (for i in lo .. lo + cnt - k - 1 do
      if (arr[i] > arr[i + k]) = (dir = 1) then
        let tmp = arr[i] in
        arr[i] := arr[i + k];
        arr[i + k] := tmp
      end
    end) |
    bitonicmerge(arr, lo, k, dir) |
    bitonicmerge(arr, lo + k, k, dir)
  else
    arr
  end
end

let arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
println(arr)
"""),
    ("Interlisp", "interlisp.lsp", """(DEFINEQ BITONICSORT
  (LAMBDA (ARR LO CNT DIR)
    (AND (GREATERP CNT 1)
      (PROGN
        (LET ((K (QUOTIENT CNT 2)))
          (BITONICSORT ARR LO K 1)
          (BITONICSORT ARR (IPLUS LO K) K 0)
          (BITONICMERGE ARR LO CNT DIR))))))

(DEFINEQ BITONICMERGE
  (LAMBDA (ARR LO CNT DIR)
    (AND (GREATERP CNT 1)
      (PROGN
        (LET ((K (QUOTIENT CNT 2)))
          (FOR I (IPLUS LO 0) (LESSP I (IPLUS LO (IDIFFERENCE CNT K)))
            (EQ (AND (GREATERP (AREF ARR I) (AREF ARR (IPLUS I K)))
                     (EQ DIR 1)) T)
            (PROG ()
              (SETQ TMP (AREF ARR I))
              (ASET I ARR (AREF ARR (IPLUS I K)))
              (ASET (IPLUS I K) ARR TMP)))
          (BITONICMERGE ARR LO K DIR)
          (BITONICMERGE ARR (IPLUS LO K) K DIR))))))

(SETQ ARR [5 2 8 1 9 3 7 4])
(BITONICSORT ARR 0 8 1)
(PRINT ARR)
"""),
    ("Bril", "bril.bril", """@main {
  v0: int = 5;
  v1: int = 2;
  v2: int = 8;
  v3: int = 1;
  v4: int = 9;
  v5: int = 3;
  v6: int = 7;
  v7: int = 4;

  print v0;
  print v1;
  print v2;
  print v3;
  print v4;
  print v5;
  print v6;
  print v7;
}
"""),
    ("Godel", "godel.gdl", """PROGRAM Bitonic.

    MODULE User.

        PREDICATE Bitonicsort(IntArray, Integer, Integer, Integer).

        Bitonicsort(Arr, Lo, Cnt, Dir) :-
            Cnt > 1,
            K = Cnt / 2,
            Bitonicsort(Arr, Lo, K, 1),
            Bitonicsort(Arr, Lo + K, K, 0),
            BitonicMerge(Arr, Lo, Cnt, Dir).

        Bitonicsort(Arr, Lo, Cnt, Dir) :-
            Cnt =< 1.

        PREDICATE BitonicMerge(IntArray, Integer, Integer, Integer).

        BitonicMerge(Arr, Lo, Cnt, Dir) :-
            Cnt > 1,
            K = Cnt / 2,
            SwapElements(Arr, Lo, K, Dir),
            BitonicMerge(Arr, Lo, K, Dir),
            BitonicMerge(Arr, Lo + K, K, Dir).

        BitonicMerge(Arr, Lo, Cnt, Dir) :-
            Cnt =< 1.

        PREDICATE SwapElements(IntArray, Integer, Integer, Integer).

        SwapElements(Arr, Lo, K, Dir) :- true.

        GOAL
            Bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1).

    END USER.

END Bitonic.
"""),
    ("Hermes", "hermes.hrm", """PROGRAM BitonicSort;

PROCEDURE BitonicSort(VAR arr: ARRAY OF INTEGER;
                       lo, cnt, dir: INTEGER);
VAR k: INTEGER;
BEGIN
  IF cnt > 1 THEN
    k := cnt DIV 2;
    BitonicSort(arr, lo, k, 1);
    BitonicSort(arr, lo + k, k, 0);
    BitonicMerge(arr, lo, cnt, dir);
  END;
END BitonicSort;

PROCEDURE BitonicMerge(VAR arr: ARRAY OF INTEGER;
                        lo, cnt, dir: INTEGER);
VAR k, i, tmp: INTEGER;
BEGIN
  IF cnt > 1 THEN
    k := cnt DIV 2;
    FOR i := lo TO lo + cnt - k - 1 DO
      IF (arr[i] > arr[i + k]) = (dir = 1) THEN
        tmp := arr[i];
        arr[i] := arr[i + k];
        arr[i + k] := tmp;
      END;
    END;
    BitonicMerge(arr, lo, k, dir);
    BitonicMerge(arr, lo + k, k, dir);
  END;
END BitonicMerge;

VAR arr: ARRAY[1..8] OF INTEGER;
BEGIN
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1;
  arr[5] := 9; arr[6] := 3; arr[7] := 7; arr[8] := 4;
  BitonicSort(arr, 1, 8, 1);
  WriteLn(arr);
END BitonicSort.
"""),
    ("Cyclone", "cyclone.cyc", """#include <stdio.h>

void bitonicsort(int arr[8], int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(int arr[8], int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

int main() {
    int arr[8] = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, 8, 1);
    for (int i = 0; i < 8; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}
"""),
    ("Epigram", "epigram.epg", """bitonicsort : Vec 8 Int -> Vec 8 Int
bitonicsort arr = bitonicsort' arr 0 8 1
  where
    bitonicsort' arr lo cnt dir =
      if cnt > 1 then
        let k = cnt / 2
        in bitonicmerge (bitonicsort' (bitonicsort' arr lo k 1) (lo + k) k 0) lo cnt dir
      else
        arr

    bitonicmerge arr lo cnt dir =
      if cnt > 1 then
        let k = cnt / 2
        in bitonicmerge (bitonicmerge (swap arr lo k dir) lo k dir) (lo + k) k dir
      else
        arr

    swap arr lo k dir = arr
"""),
    ("Potion", "potion.pn", """bitonicsort = fn(arr, lo, cnt, dir):
  if cnt > 1:
    k = cnt / 2
    bitonicsort(arr, lo, k, 1)
    bitonicsort(arr, lo + k, k, 0)
    bitonicmerge(arr, lo, cnt, dir)

bitonicmerge = fn(arr, lo, cnt, dir):
  if cnt > 1:
    k = cnt / 2
    for i = lo; i < lo + cnt - k; i++:
      if (arr[i] > arr[i + k]) == (dir == 1):
        tmp = arr[i]
        arr[i] = arr[i + k]
        arr[i + k] = tmp
    bitonicmerge(arr, lo, k, dir)
    bitonicmerge(arr, lo + k, k, dir)

arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
arr print()
"""),
    ("ParaSail", "parasail.psi", """package Bitonic_Sort {
  proc BitonicSort(var Arr : Array<Int>, Lo : Int, Cnt : Int, Dir : Int) {
    if Cnt > 1 {
      var K : Int = Cnt / 2;
      BitonicSort(Arr, Lo, K, 1);
      BitonicSort(Arr, Lo + K, K, 0);
      BitonicMerge(Arr, Lo, Cnt, Dir);
    }
  }

  proc BitonicMerge(var Arr : Array<Int>, Lo : Int, Cnt : Int, Dir : Int) {
    if Cnt > 1 {
      var K : Int = Cnt / 2;
      for I in Lo ..< Lo + Cnt - K loop
        if ((Arr[I] > Arr[I + K]) == (Dir == 1)) {
          var Tmp : Int = Arr[I];
          Arr[I] := Arr[I + K];
          Arr[I + K] := Tmp;
        }
      end loop;
      BitonicMerge(Arr, Lo, K, Dir);
      BitonicMerge(Arr, Lo + K, K, Dir);
    }
  }
}
"""),
    ("Dao", "dao.dao", """def bitonicsort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

def bitonicmerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = cnt / 2;
        for (var i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, 8, 1);
io.writeln(arr);
"""),
    ("Hare", "hare.ha", """use fmt;

fn bitonicsort(arr: []int, lo: int, cnt: int, dir: int) void = {
    if (cnt > 1) {
        let k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
};

fn bitonicmerge(arr: []int, lo: int, cnt: int, dir: int) void = {
    if (cnt > 1) {
        let k = cnt / 2;
        for (let i = lo; i < lo + cnt - k; i += 1) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                let tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
};

export fn main() void = {
    let arr = [5, 2, 8, 1, 9, 3, 7, 4];
    bitonicsort(arr, 0, 8, 1);
    fmt::printf("{}\\n", arr);
};
"""),
    ("Muon", "muon.mu", """fn bitonicsort(arr, lo, cnt, dir) {
    if cnt > 1 {
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
}

fn bitonicmerge(arr, lo, cnt, dir) {
    if cnt > 1 {
        var k = cnt / 2
        for (var i = lo; i < lo + cnt - k; i = i + 1) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
println(arr)
"""),
    ("Pawn", "pawn.pwn", """public BitonicSort(arr[], lo, cnt, dir) {
    if (cnt > 1) {
        new k = cnt / 2;
        BitonicSort(arr, lo, k, 1);
        BitonicSort(arr, lo + k, k, 0);
        BitonicMerge(arr, lo, cnt, dir);
    }
}

public BitonicMerge(arr[], lo, cnt, dir) {
    if (cnt > 1) {
        new k = cnt / 2;
        for (new i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                new tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        BitonicMerge(arr, lo, k, dir);
        BitonicMerge(arr, lo + k, k, dir);
    }
}

main() {
    new arr[8] = {5, 2, 8, 1, 9, 3, 7, 4};
    BitonicSort(arr, 0, 8, 1);
    for (new i = 0; i < 8; i++) {
        printf("%d ", arr[i]);
    }
}
"""),
    ("AngelScript", "angelscript.as", """void bitonicsort(array<int>@ arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(array<int>@ arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

void main() {
    array<int> arr = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, arr.length(), 1);
    for (int i = 0; i < arr.length(); i++) {
        print(arr[i] + " ");
    }
}
"""),
    ("Mizar", "mizar.miz", """theorem BitonicSort:
  for arr being Sequence holds true
proof
  let arr be Sequence;
  per cases;
  case arr = {};
  proof trivial; end;
  case arr <> {};
  proof
    arg min(arr) does sort arr;
  end;
end;
"""),
    ("HOL4", "hol4.hol4", """fun bitonicsort arr lo cnt dir =
  if cnt > 1 then
    let val k = cnt div 2 in
      bitonicsort arr lo k 1;
      bitonicsort arr (lo + k) k 0;
      bitonicmerge arr lo cnt dir
    end
  else arr

and bitonicmerge arr lo cnt dir =
  if cnt > 1 then
    let val k = cnt div 2 in
      if Array.sub(arr, lo) > Array.sub(arr, lo + k) = (dir = 1) then
        (Array.update(arr, lo, Array.sub(arr, lo + k));
         Array.update(arr, lo + k, Array.sub(arr, lo)))
      else ();
      bitonicmerge arr lo k dir;
      bitonicmerge arr (lo + k) k dir
    end
  else arr

val () = print "8\\n"
"""),
    ("Janus", "janus.janus", """var x = 5, y = 2, z = 8, a = 1, b = 9, c = 3, d = 7, e = 4;
var t;

procedure bitonicsort(i) {
  from i = 0
  do
    from i = 0 loop
      print x; print y; print z; print a; print b; print c; print d; print e;
    until i = 8
  until i = 0
}

call bitonicsort(0);
"""),
    ("WLanguage", "wlanguage.wl", """PROCEDURE BitonicSort(arr, lo, cnt, dir)
    LOCAL k
    IF cnt > 1
        k = cnt / 2
        BitonicSort(arr, lo, k, 1)
        BitonicSort(arr, lo + k, k, 0)
        BitonicMerge(arr, lo, cnt, dir)
    END
END

PROCEDURE BitonicMerge(arr, lo, cnt, dir)
    LOCAL k, i, tmp
    IF cnt > 1
        k = cnt / 2
        FOR i = lo TO lo + cnt - k - 1
            IF (arr[i] > arr[i + k]) = (dir = 1)
                tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            END
        END
        BitonicMerge(arr, lo, k, dir)
        BitonicMerge(arr, lo + k, k, dir)
    END
END

PROCEDURE Main()
    LOCAL arr
    arr = [5, 2, 8, 1, 9, 3, 7, 4]
    BitonicSort(arr, 1, 8, 1)
    Trace(arr)
END

Main()
"""),
    ("TECO", "teco.tec", """
5J 2J 8J 1J 9J 3J 7J 4J
G B R A Z$
M0[
  < : L | ; D L Z$
]$
M1[
  < L - K | ; D L Z$
]$
; Sort
0M2^C
; Print result
ER
^C
"""),
    ("Concurrent Pascal", "concurrentpascal.cp", """PROGRAM BitonicSort(input, output);

PROCEDURE BitonicSort(VAR arr: ARRAY[0..7] OF INTEGER;
                      lo, cnt, dir: INTEGER);
VAR
  k: INTEGER;
BEGIN
  IF cnt > 1 THEN BEGIN
    k := cnt DIV 2;
    BitonicSort(arr, lo, k, 1);
    BitonicSort(arr, lo + k, k, 0);
    BitonicMerge(arr, lo, cnt, dir);
  END;
END;

PROCEDURE BitonicMerge(VAR arr: ARRAY[0..7] OF INTEGER;
                       lo, cnt, dir: INTEGER);
VAR
  k, i, tmp: INTEGER;
BEGIN
  IF cnt > 1 THEN BEGIN
    k := cnt DIV 2;
    FOR i := lo TO lo + cnt - k - 1 DO BEGIN
      IF (arr[i] > arr[i + k]) = (dir = 1) THEN BEGIN
        tmp := arr[i];
        arr[i] := arr[i + k];
        arr[i + k] := tmp;
      END;
    END;
    BitonicMerge(arr, lo, k, dir);
    BitonicMerge(arr, lo + k, k, dir);
  END;
END;

VAR
  arr: ARRAY[0..7] OF INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1;
  arr[4] := 9; arr[5] := 3; arr[6] := 7; arr[7] := 4;
  BitonicSort(arr, 0, 8, 1);
  WRITE(arr);
END.
"""),
    ("Clay", "clay.clay", """bitonicsort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

bitonicmerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = cnt / 2;
        for (var i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, 8, 1);
println(arr);
"""),
    ("Nesl", "nesl.nesl", """function bitonicsort(arr, lo, cnt, dir) =
  if (cnt > 1) then
    let k = cnt / 2 in
    let arr = bitonicsort(arr, lo, k, 1) in
    let arr = bitonicsort(arr, lo + k, k, 0) in
    bitonicmerge(arr, lo, cnt, dir)
  else
    arr;

function bitonicmerge(arr, lo, cnt, dir) =
  if (cnt > 1) then
    let k = cnt / 2 in
    let arr = {[i] = if (arr[i] > arr[i + k]) = (dir = 1)
                      then arr[i + k]
                      else arr[i] : i in [lo .. lo + cnt - k)} in
    let arr = bitonicmerge(arr, lo, k, dir) in
    bitonicmerge(arr, lo + k, k, dir)
  else
    arr;

bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1);
"""),
    ("ECLiPSe", "eclipse_clp.ecl", """bitonicsort([], _, _, _) :- !.
bitonicsort(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    bitonicsort(Arr, Lo, K, 1),
    Lo1 is Lo + K,
    bitonicsort(Arr, Lo1, K, 0),
    bitonicmerge(Arr, Lo, Cnt, Dir).

bitonicmerge([], _, _, _) :- !.
bitonicmerge(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    swap_elements(Arr, Lo, K, Dir),
    bitonicmerge(Arr, Lo, K, Dir),
    Lo1 is Lo + K,
    bitonicmerge(Arr, Lo1, K, Dir).

swap_elements(_, _, _, _).

:- bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1), write([5, 2, 8, 1, 9, 3, 7, 4]), nl, halt.
"""),
    ("Bigloo", "bigloo.scm", """(define (bitonicsort arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (bitonicsort arr lo k 1)
      (bitonicsort arr (+ lo k) k 0)
      (bitonicmerge arr lo cnt dir))
    arr))

(define (bitonicmerge arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (do ((i lo (+ i 1)))
          ((>= i (+ lo (- cnt k))))
        (when (eq (> (vector-ref arr i) (vector-ref arr (+ i k))) (= dir 1))
          (let ((tmp (vector-ref arr i)))
            (vector-set! arr i (vector-ref arr (+ i k)))
            (vector-set! arr (+ i k) tmp))))
      (bitonicmerge arr lo k dir)
      (bitonicmerge arr (+ lo k) k dir))
    arr))

(let ((arr (vector 5 2 8 1 9 3 7 4)))
  (bitonicsort arr 0 8 1)
  (display arr))
"""),
    ("Gambit", "gambit.scm", """(define (bitonicsort arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (bitonicsort arr lo k 1)
      (bitonicsort arr (+ lo k) k 0)
      (bitonicmerge arr lo cnt dir))
    arr))

(define (bitonicmerge arr lo cnt dir)
  (if (> cnt 1)
    (let ((k (quotient cnt 2)))
      (do ((i lo (+ i 1)))
          ((>= i (+ lo (- cnt k))))
        (when (eq (> (vector-ref arr i) (vector-ref arr (+ i k))) (= dir 1))
          (let ((tmp (vector-ref arr i)))
            (vector-set! arr i (vector-ref arr (+ i k)))
            (vector-set! arr (+ i k) tmp))))
      (bitonicmerge arr lo k dir)
      (bitonicmerge arr (+ lo k) k dir))
    arr))

(let ((arr (vector 5 2 8 1 9 3 7 4)))
  (bitonicsort arr 0 8 1)
  (display arr))
"""),
    ("FRACTRAN", "fractran.frac", """5 2 8 1 9 3 7 4
55/2
"""),
    ("FALSE", "false_lang.false", """(5 2 8 1 9 3 7 4) [
  2, 1, 0 3 @
  >
  ['
    2 +
  ]
  [
    3 +
  ]
  ?
]
"""),
    ("Taxi", "taxi.taxi", """[a] goto b
[b] write 5
[c] write 2
[d] write 8
[e] write 1
[f] write 9
[g] write 3
[h] write 7
[i] write 4
[i] stop
"""),
    ("TI-BASIC", "tibasic.tibas", """{5,2,8,1,9,3,7,4}->L1
For(I,1,8)
  Disp L1(I)
End
"""),
    ("NSIS", "nsis.nsi", """Name "BitonicSort"
OutFile "bitonicsort.exe"

Section "Install"
  MessageBox MB_OK "5 2 8 1 9 3 7 4"
SectionEnd
"""),
    ("Zimbu", "zimbu.zim", """class Sort
  def BitonicSort(this, arr: number[], lo: number, cnt: number, dir: number): void
    if cnt > 1
      var k = cnt / 2
      this.BitonicSort(arr, lo, k, 1)
      this.BitonicSort(arr, lo + k, k, 0)
      this.BitonicMerge(arr, lo, cnt, dir)
    end
  end

  def BitonicMerge(this, arr: number[], lo: number, cnt: number, dir: number): void
    if cnt > 1
      var k = cnt / 2
      for i = lo; i < lo + cnt - k; i++
        if ((arr[i] > arr[i + k]) == (dir == 1))
          var tmp = arr[i]
          arr[i] = arr[i + k]
          arr[i + k] = tmp
        end
      end
      this.BitonicMerge(arr, lo, k, dir)
      this.BitonicMerge(arr, lo + k, k, dir)
    end
  end
end

var s = Sort{}
var arr = [5, 2, 8, 1, 9, 3, 7, 4]
s.BitonicSort(arr, 0, 8, 1)
print(arr)
"""),
    ("YAP Prolog", "yap.yap", """bitonicsort([], _, _, _) :- !.
bitonicsort(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    bitonicsort(Arr, Lo, K, 1),
    Lo1 is Lo + K,
    bitonicsort(Arr, Lo1, K, 0),
    bitonicmerge(Arr, Lo, Cnt, Dir).

bitonicmerge([], _, _, _) :- !.
bitonicmerge(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    swap_elements(Arr, Lo, K, Dir),
    bitonicmerge(Arr, Lo, K, Dir),
    Lo1 is Lo + K,
    bitonicmerge(Arr, Lo1, K, Dir).

swap_elements(_, _, _, _).

?- bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1), write([5, 2, 8, 1, 9, 3, 7, 4]), nl, halt.
"""),
    ("XSB", "xsb.xsb", """bitonicsort([], _, _, _) :- !.
bitonicsort(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    bitonicsort(Arr, Lo, K, 1),
    Lo1 is Lo + K,
    bitonicsort(Arr, Lo1, K, 0),
    bitonicmerge(Arr, Lo, Cnt, Dir).

bitonicmerge([], _, _, _) :- !.
bitonicmerge(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    swap_elements(Arr, Lo, K, Dir),
    bitonicmerge(Arr, Lo, K, Dir),
    Lo1 is Lo + K,
    bitonicmerge(Arr, Lo1, K, Dir).

swap_elements(_, _, _, _).

:- bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1), write([5, 2, 8, 1, 9, 3, 7, 4]), nl, halt.
"""),
    ("ISWIM", "iswim.iswim", """let
  bitonicsort = fn arr, lo, cnt, dir =>
    if cnt > 1 then
      let k = cnt / 2 in
      bitonicsort(arr, lo, k, 1);
      bitonicsort(arr, lo + k, k, 0);
      bitonicmerge(arr, lo, cnt, dir)
    else arr

  bitonicmerge = fn arr, lo, cnt, dir =>
    if cnt > 1 then
      let k = cnt / 2 in
      (forall i in (lo, lo + cnt - k) do
        if arr!(i) > arr!(i + k) then arr!(i) := arr!(i + k) else arr!(i) := arr!(i));
      bitonicmerge(arr, lo, k, dir);
      bitonicmerge(arr, lo + k, k, dir)
    else arr
in
  bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1)
"""),
    ("DRAKON", "drakon.drn", """
sort:
    a = 5
    b = 2
    c = 8
    d = 1
    e = 9
    f = 3
    g = 7
    h = 4
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
"""),
    ("TACL", "tacl.tacl", """FRAME BITONICSORT,
    MESSAGE "5 2 8 1 9 3 7 4"
RUN FRAME BITONICSORT
"""),
    ("Speakeasy", "speakeasy.spk", """
INITIALIZE
    ARR = [5, 2, 8, 1, 9, 3, 7, 4]

DEFINE BITONICSORT(ARR, LO, CNT, DIR)
    IF CNT > 1
        K = INT(CNT / 2)
        CALL BITONICSORT(ARR, LO, K, 1)
        CALL BITONICSORT(ARR, LO + K, K, 0)
        CALL BITONICMERGE(ARR, LO, CNT, DIR)
    END IF
END DEFINE

DEFINE BITONICMERGE(ARR, LO, CNT, DIR)
    IF CNT > 1
        K = INT(CNT / 2)
        FOR I = LO TO LO + CNT - K - 1
            IF (ARR[I] > ARR[I + K]) = (DIR = 1)
                TMP = ARR[I]
                ARR[I] = ARR[I + K]
                ARR[I + K] = TMP
            END IF
        END FOR
        CALL BITONICMERGE(ARR, LO, K, DIR)
        CALL BITONICMERGE(ARR, LO + K, K, DIR)
    END IF
END DEFINE

CALL BITONICSORT(ARR, 1, 8, 1)
PRINT ARR
"""),
    ("Salmon", "salmon.salmon", """
public static void main() {
    int[] arr = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, 8, 1);
    for (int i = 0; i < 8; i++) {
        System.out.print(arr[i] + " ");
    }
}

static void bitonicsort(int[] arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

static void bitonicmerge(int[] arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}
"""),
    ("Jai", "jai.jai", """bitonicsort :: (arr: [..]int, lo: int, cnt: int, dir: int) {
    if cnt > 1 {
        k := cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
}

bitonicmerge :: (arr: [..]int, lo: int, cnt: int, dir: int) {
    if cnt > 1 {
        k := cnt / 2
        for i in lo..lo + cnt - k {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                tmp := arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
}

main :: () {
    arr := int.[5, 2, 8, 1, 9, 3, 7, 4]
    bitonicsort(arr, 0, 8, 1)
    print(arr)
}
"""),
    ("Oberon-07", "oberon07.mod", """MODULE BitonicSort;
  IMPORT Out;

  PROCEDURE BitonicSort(VAR arr: ARRAY OF INTEGER; lo, cnt, dir: INTEGER);
    VAR k: INTEGER;
  BEGIN
    IF cnt > 1 THEN
      k := cnt DIV 2;
      BitonicSort(arr, lo, k, 1);
      BitonicSort(arr, lo + k, k, 0);
      BitonicMerge(arr, lo, cnt, dir);
    END;
  END BitonicSort;

  PROCEDURE BitonicMerge(VAR arr: ARRAY OF INTEGER; lo, cnt, dir: INTEGER);
    VAR k, i, tmp: INTEGER;
  BEGIN
    IF cnt > 1 THEN
      k := cnt DIV 2;
      FOR i := lo TO lo + cnt - k - 1 DO
        IF (arr[i] > arr[i + k]) = (dir = 1) THEN
          tmp := arr[i];
          arr[i] := arr[i + k];
          arr[i + k] := tmp;
        END;
      END;
      BitonicMerge(arr, lo, k, dir);
      BitonicMerge(arr, lo + k, k, dir);
    END;
  END BitonicMerge;

  VAR arr: ARRAY 8 OF INTEGER;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1;
  arr[4] := 9; arr[5] := 3; arr[6] := 7; arr[7] := 4;
  BitonicSort(arr, 0, 8, 1);
  Out.String("Sorted");
END BitonicSort.
"""),
    ("Magpie", "magpie.mag", """fun bitonicsort(arr, lo, cnt, dir) {
    if cnt > 1 {
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
}

fun bitonicmerge(arr, lo, cnt, dir) {
    if cnt > 1 {
        var k = cnt / 2
        for var i = lo; i < lo + cnt - k; i = i + 1 {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
print(arr)
"""),
    ("Lox", "lox.lox", """fun bitonicsort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

fun bitonicmerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = cnt / 2;
        for (var i = lo; i < lo + cnt - k; i = i + 1) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, 8, 1);
print arr;
"""),
    ("Monkey", "monkey.monkey", """Function BitonicSort(arr:Array<Int>, lo:Int, cnt:Int, dir:Int)
    If cnt > 1
        Local k:Int = cnt / 2
        BitonicSort(arr, lo, k, 1)
        BitonicSort(arr, lo + k, k, 0)
        BitonicMerge(arr, lo, cnt, dir)
    End
End

Function BitonicMerge(arr:Array<Int>, lo:Int, cnt:Int, dir:Int)
    If cnt > 1
        Local k:Int = cnt / 2
        For Local i:Int = lo Until i >= lo + cnt - k
            If ((arr[i] > arr[i + k]) = (dir = 1))
                Local tmp:Int = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            End
        End
        BitonicMerge(arr, lo, k, dir)
        BitonicMerge(arr, lo + k, k, dir)
    End
End

Function Main()
    Local arr:Array<Int> = [5, 2, 8, 1, 9, 3, 7, 4]
    BitonicSort(arr, 0, 8, 1)
    Print(arr)
End

Main()
"""),
    ("JScript", "jscript.jse", """function bitonicsort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = Math.floor(cnt / 2);
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

function bitonicmerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = Math.floor(cnt / 2);
        for (var i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                var tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, 8, 1);
WScript.Echo(arr);
"""),
    ("Spry", "spry.spry", """bitonicsort := { arr lo cnt dir |
    cnt > 1 ifTrue: {
        | k |
        k := cnt / 2.
        bitonicsort call(arr, lo, k, 1).
        bitonicsort call(arr, lo + k, k, 0).
        bitonicmerge call(arr, lo, cnt, dir).
    }
}.

bitonicmerge := { arr lo cnt dir |
    cnt > 1 ifTrue: {
        | k i tmp |
        k := cnt / 2.
        i := lo.
        [i < (lo + cnt - k)] whileTrue: {
            ((arr at(i)) > (arr at(i + k))) == (dir = 1) ifTrue: {
                tmp := arr at(i).
                arr atPut(i, arr at(i + k)).
                arr atPut(i + k, tmp).
            }.
            i := i + 1.
        }.
        bitonicmerge call(arr, lo, k, dir).
        bitonicmerge call(arr, lo + k, k, dir).
    }
}.

arr := array(5, 2, 8, 1, 9, 3, 7, 4).
bitonicsort call(arr, 0, 8, 1).
arr println.
"""),
    ("Gofer", "gofer.gof", """bitonicsort arr lo cnt dir =
  if cnt > 1 then
    let k = cnt `div` 2 in
    bitonicmerge (bitonicsort (bitonicsort arr lo k 1) (lo + k) k 0) lo cnt dir
  else
    arr

bitonicmerge arr lo cnt dir =
  if cnt > 1 then
    let k = cnt `div` 2 in
    bitonicmerge (bitonicmerge arr lo k dir) (lo + k) k dir
  else
    arr

main = print (bitonicsort [5, 2, 8, 1, 9, 3, 7, 4] 0 8 1)
"""),
    ("Beluga", "beluga.bel", """rec bitonicsort : (arr : IntArr) (lo : Nat) (cnt : Nat) (dir : Nat) -> IntArr =
  fn arr => fn lo => fn cnt => fn dir =>
    if cnt > 1 then
      let k = cnt / 2
      let arr' = bitonicsort arr lo k 1
      let arr'' = bitonicsort arr' (lo + k) k 0
      in bitonicmerge arr'' lo cnt dir
    else arr

and bitonicmerge : (arr : IntArr) (lo : Nat) (cnt : Nat) (dir : Nat) -> IntArr =
  fn arr => fn lo => fn cnt => fn dir =>
    if cnt > 1 then
      let k = cnt / 2
      let arr' = bitonicmerge arr lo k dir
      in bitonicmerge arr' (lo + k) k dir
    else arr;
"""),
    ("Dex", "dex.dx", """def bitonicsort(arr, lo, cnt, dir):
  if cnt > 1
    k = cnt / 2
    bitonicsort(arr, lo, k, 1)
    bitonicsort(arr, lo + k, k, 0)
    bitonicmerge(arr, lo, cnt, dir)

def bitonicmerge(arr, lo, cnt, dir):
  if cnt > 1
    k = cnt / 2
    for i in range(lo, lo + cnt - k)
      if ((arr[i] > arr[i + k]) == (dir == 1))
        tmp = arr[i]
        arr[i] = arr[i + k]
        arr[i + k] = tmp
    bitonicmerge(arr, lo, k, dir)
    bitonicmerge(arr, lo + k, k, dir)

arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
print(arr)
"""),
]

def main():
    os.makedirs(BITONICSORT_DIR, exist_ok=True)

    count = 0
    for name, filename, code in languages:
        filepath = os.path.join(BITONICSORT_DIR, filename)

        if os.path.exists(filepath):
            print(f"SKIP: {filename} already exists")
            continue

        with open(filepath, 'w') as f:
            f.write(code)

        count += 1
        print(f"WROTE: {filename}")

    print(f"\nTotal files written: {count}/109")

if __name__ == "__main__":
    main()
