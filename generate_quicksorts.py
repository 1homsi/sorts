#!/usr/bin/env python3
import os

quicksort_dir = "/Users/mhomsi/personal/code/1homsi/mergesort/quicksort/"

implementations = {
    "logo.logo": """to quicksort :array
  ifempty :array [output []]
  local "pivot
  local "less
  local "greater
  make "pivot first :array
  make "less []
  make "greater []
  foreach butfirst :array [
    ifelse :item <= :pivot [
      make "less lput :item :less
    ] [
      make "greater lput :item :greater
    ]
  ]
  output sentence (quicksort :less) :pivot (quicksort :greater)
end

show quicksort [5 2 8 1 9 3]
""",

    "hack.hack": """<?hh
function quicksort(vec<int> $arr): vec<int> {
  if (count($arr) <= 1) return $arr;
  $pivot = $arr[0];
  $less = vec[];
  $greater = vec[];
  for ($i = 1; $i < count($arr); $i++) {
    if ($arr[$i] <= $pivot) {
      $less[] = $arr[$i];
    } else {
      $greater[] = $arr[$i];
    }
  }
  return vec(...quicksort($less), $pivot, ...quicksort($greater));
}

$result = quicksort(vec(5, 2, 8, 1, 9, 3));
var_dump($result);
""",

    "qsharp.qs": """namespace QuickSort {
    open Microsoft.Quantum.Intrinsic;

    operation QuickSort(arr: Int[], idx: Int = 0): Int[] {
        if Length(arr) <= 1 {
            return arr;
        }
        let pivot = arr[0];
        mutable less = [];
        mutable greater = [];
        for i in 1..Length(arr)-1 {
            if arr[i] <= pivot {
                set less += [arr[i]];
            } else {
                set greater += [arr[i]];
            }
        }
        return QuickSort(less) + [pivot] + QuickSort(greater);
    }
}

let result = QuickSort([5, 2, 8, 1, 9, 3]);
""",

    "supercollider.scd": """(
var quicksort = { |arr|
  if (arr.size <= 1) {
    arr
  } {
    var pivot = arr[0];
    var less = [];
    var greater = [];
    arr.drop(1).do { |x|
      if (x <= pivot) {
        less = less ++ [x];
      } {
        greater = greater ++ [x];
      }
    };
    (quicksort.value(less)) ++ [pivot] ++ (quicksort.value(greater));
  }
};

quicksort.value([5, 2, 8, 1, 9, 3]).postln;
)
""",

    "squirrel.nut": """function quicksort(arr) {
  if (arr.len() <= 1) return arr;
  local pivot = arr[0];
  local less = [];
  local greater = [];
  for (local i = 1; i < arr.len(); i++) {
    if (arr[i] <= pivot) {
      less.push(arr[i]);
    } else {
      greater.push(arr[i]);
    }
  }
  local result = [];
  foreach (x in quicksort(less)) result.push(x);
  result.push(pivot);
  foreach (x in quicksort(greater)) result.push(x);
  return result;
}

print(quicksort([5, 2, 8, 1, 9, 3]));
""",

    "vimscript.vim": """function! Quicksort(arr)
  if len(a:arr) <= 1
    return a:arr
  endif
  let pivot = a:arr[0]
  let less = []
  let greater = []
  for i in range(1, len(a:arr) - 1)
    if a:arr[i] <= pivot
      call add(less, a:arr[i])
    else
      call add(greater, a:arr[i])
    endif
  endfor
  return Quicksort(less) + [pivot] + Quicksort(greater)
endfunction

echo Quicksort([5, 2, 8, 1, 9, 3])
""",

    "felix.flx": """fun quicksort(arr: array[int]): array[int] = {
  if arr.len() <= 1u then arr
  else
    val pivot = arr.(0)
    var less = darray[int]()
    var greater = darray[int]()
    for i in 1u upto arr.len() - 1u do
      if arr.(i) <= pivot then less += arr.(i)
      else greater += arr.(i)
    done
    quicksort(less.array) + array[int]::cons(pivot, quicksort(greater.array))
  endif
}

println$ quicksort(array(5, 2, 8, 1, 9, 3));
""",

    "ooc.ooc": """quicksort: func(arr: ArrayList<Int>) -> ArrayList<Int> {
  if (arr size <= 1) return arr

  pivot := arr[0]
  less := ArrayList<Int> new()
  greater := ArrayList<Int> new()

  for (i in 1..arr size) {
    if (arr[i] <= pivot) {
      less add(arr[i])
    } else {
      greater add(arr[i])
    }
  }

  result := ArrayList<Int> new()
  for (x in quicksort(less)) result add(x)
  result add(pivot)
  for (x in quicksort(greater)) result add(x)
  result
}

arr := ArrayList<Int> new(5, 2, 8, 1, 9, 3)
quicksort(arr) println()
""",

    "refal.ref": """$ENTRY Go {
  = <Prout <Quicksort [5 2 8 1 9 3]>>;
}

Quicksort {
  [] = [];
  [E] = [E];
  [H T] = <Quicksort <Filter H T (<=)>>
          [H]
          <Quicksort <Filter H T (>)>>;
}

Filter {
  H [] (Op) = [];
  H [E Tail] (Op) =
    <CompOp E H Op>
      <Append [E] <Filter H Tail (Op)>>
      <Filter H Tail (Op)>;
}

CompOp {
  E H (<=) = True: True, False: False;
}

Append {
  [] L = L;
  [H T] L = [H <Append T L>];
}
""",

    "pop11.p11": """define quicksort(arr);
  if length(arr) <= 1 then
    arr
  else
    lvars pivot = arr(1);
    lvars less = [], greater = [];
    lvars i;
    for i from 2 to length(arr) do
      if arr(i) <= pivot then
        [arr(i) ^^less] -> less;
      else
        [arr(i) ^^greater] -> greater;
      endif;
    endfor;
    quicksort(less) <> [pivot] <> quicksort(greater);
  endif;
enddefine;

quicksort([5 2 8 1 9 3]) =>
""",

    "algol60.alg": """begin
  array arr[1:6];
  integer i;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  procedure quicksort(a, n);
    array a; integer n;
  begin
    integer i, j, pivot, temp;
    if n <= 1 then go to done;
    pivot := a[1];
    i := 1; j := n;
    loop: begin
      while a[i] < pivot do i := i + 1;
      while a[j] > pivot do j := j - 1;
      if i < j then begin
        temp := a[i]; a[i] := a[j]; a[j] := temp;
        i := i + 1; j := j - 1;
        go to loop;
      end;
    end;
    done:
  end;

  quicksort(arr, 6);
  for i := 1 step 1 until 6 do print(arr[i]);
end
""",

    "hals.hal": """PROGRAM QUICKSORT;
DECLARE ARR(6), PIVOT, I, J, TEMP;
ARR(1) := 5; ARR(2) := 2; ARR(3) := 8;
ARR(4) := 1; ARR(5) := 9; ARR(6) := 3;

PROCEDURE SORT(A, N);
DECLARE A, N, I, J, P, T;
IF N <= 1 THEN RETURN;
P := A(1);
I := 1; J := N;
LOOP:
  WHILE A(I) < P DO I := I + 1;
  WHILE A(J) > P DO J := J - 1;
  IF I < J THEN
    T := A(I); A(I) := A(J); A(J) := T;
    I := I + 1; J := J - 1;
    GOTO LOOP;
  ENDIF;
END;

SORT(ARR, 6);
FOR I = 1 TO 6 DO
  WRITE ARR(I);
ENDFOR;
END PROGRAM.
""",

    "fortress.fss": r"""component quicksort
  export Executable

  qs(arr: Array[\mathbb{Z}, ZeroBased\]) : Array[\mathbb{Z}, ZeroBased\] =
    if |arr| <= 1 then
      arr
    else
      pivot = arr[0]
      less = [arr[i] | i <- 0 # |arr|, arr[i] <= pivot]
      greater = [arr[i] | i <- 0 # |arr|, arr[i] > pivot]
      qs(less) || [pivot] || qs(greater)
    end

  run() = do
    arr = array[\mathbb{Z}\](5, 2, 8, 1, 9, 3)
    println(qs(arr))
  end
end
""",

    "twelf.elf": """quicksort : list int -> list int -> type.

qs-nil : quicksort nil nil.
qs-one : quicksort (X::nil) (X::nil).
qs-cons : quicksort ((H::T)) (Result)
  <- partition H T nil nil L G
  <- quicksort L SL
  <- quicksort G SG
  <- append SL (H::SG) Result.

partition : int -> list int -> list int -> list int -> list int -> list int -> type.
partition-nil : partition _ nil L G L G.
partition-cons : partition H (X::T) L G SL SG
  <- (lt H X -> partition H T L (X::G) SL SG;
      partition H T (X::L) G SL SG).

append : list int -> list int -> list int -> type.
append-nil : append nil L L.
append-cons : append (X::L1) L2 (X::L3) <- append L1 L2 L3.
""",

    "pl0.pl0": """var arr, len, i, j, pivot, temp;

procedure quicksort;
var i, j, pivot, temp;
begin
  if len <= 1 then return;
  pivot := arr[0];
  i := 1;
  j := len;
  while i < j do
  begin
    while i < len and arr[i] <= pivot do i := i + 1;
    while j > 0 and arr[j] > pivot do j := j - 1;
    if i < j then
    begin
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
      i := i + 1;
      j := j - 1;
    end
  end;
end;

begin
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  len := 6;
  call quicksort;
  for i := 0 step 1 until 5 do ! arr[i];
end.
""",

    "kitten.ktn": """define quicksort : list<number> -> list<number>;
  dup count 1 <= (if return; then) drop
  dup 0 -> list->index-unsafe
  to: pivot
  define less_than_pivot (stack: number);
    dup pivot <= ();
  define greater_than_pivot (stack: number);
    dup pivot > ();
  1 list->index-unsafe
  [less_than_pivot filter] to: less
  [greater_than_pivot filter] to: greater
  less quicksort pivot greater quicksort ++
;

[5 2 8 1 9 3] quicksort print
""",

    "nit.nit": """fun quicksort(arr: Array[Int]): Array[Int] do
  if arr.length <= 1 then return arr
  var pivot = arr[0]
  var less = new Array[Int]
  var greater = new Array[Int]
  for i in [1..arr.length[ do
    if arr[i] <= pivot then
      less.push(arr[i])
    else
      greater.push(arr[i])
    end
  end
  var result = new Array[Int]
  for x in quicksort(less) do result.push(x)
  result.push(pivot)
  for x in quicksort(greater) do result.push(x)
  return result
end

var arr = new Array[Int]
arr.push(5); arr.push(2); arr.push(8)
arr.push(1); arr.push(9); arr.push(3)
print quicksort(arr)
""",

    "pure.pure": """quicksort [] = [];
quicksort [x] = [x];
quicksort (x:xs) = quicksort (filter (<=x) xs) ++ [x] ++ quicksort (filter (>x) xs);

main = quicksort [5, 2, 8, 1, 9, 3];
""",

    "ciao.ciao": """quicksort([], []).
quicksort([X], [X]) :- !.
quicksort([Pivot|T], Sorted) :-
  partition(T, Pivot, Less, Greater),
  quicksort(Less, SortedLess),
  quicksort(Greater, SortedGreater),
  append(SortedLess, [Pivot|SortedGreater], Sorted).

partition([], _, [], []).
partition([H|T], Pivot, [H|Less], Greater) :-
  H =< Pivot, !,
  partition(T, Pivot, Less, Greater).
partition([H|T], Pivot, Less, [H|Greater]) :-
  partition(T, Pivot, Less, Greater).

?- quicksort([5, 2, 8, 1, 9, 3], X), write(X), nl.
""",

    "unrealscript.uc": """function array<int> Quicksort(array<int> arr)
{
  local array<int> less, greater;
  local int pivot, i;

  if (arr.Length <= 1)
    return arr;

  pivot = arr[0];
  for (i = 1; i < arr.Length; i++)
  {
    if (arr[i] <= pivot)
      less[less.Length] = arr[i];
    else
      greater[greater.Length] = arr[i];
  }

  return Quicksort(less) @ pivot @ Quicksort(greater);
}

simulated function test()
{
  local array<int> result;
  result = Quicksort(arr);
  `log(result);
}
""",

    "chuck.ck": """fun int[] quicksort(int arr[]) {
  if (arr.cap() <= 1)
    return arr;

  int pivot = arr[0];
  int less[0];
  int greater[0];

  for (1 => int i; i < arr.cap(); i++) {
    if (arr[i] <= pivot)
      less << arr[i];
    else
      greater << arr[i];
  }

  int result[];
  quicksort(less) @=> int[] sl;
  quicksort(greater) @=> int[] sg;
  for (0 => int i; i < sl.cap(); i++)
    result << sl[i];
  result << pivot;
  for (0 => int i; i < sg.cap(); i++)
    result << sg[i];
  return result;
}

int arr[6];
arr[0] = 5; arr[1] = 2; arr[2] = 8;
arr[3] = 1; arr[4] = 9; arr[5] = 3;
quicksort(arr) @=> int result[];
for (int x : result)
  <<< x >>>;
""",

    "faust.dsp": """import("stdfaust.lib");

qsort(arr, n) = _ : _ with {
  qsort_inner(1) = arr;
  qsort_inner(n) = qsort_inner(n-1);
};

process = qsort((5,2,8,1,9,3), 6);
""",

    "processing.pde": """int[] quicksort(int[] arr) {
  if (arr.length <= 1)
    return arr;

  int pivot = arr[0];
  ArrayList<Integer> less = new ArrayList<Integer>();
  ArrayList<Integer> greater = new ArrayList<Integer>();

  for (int i = 1; i < arr.length; i++) {
    if (arr[i] <= pivot)
      less.add(arr[i]);
    else
      greater.add(arr[i]);
  }

  int[] lArr = new int[less.size()];
  int[] gArr = new int[greater.size()];
  for (int i = 0; i < less.size(); i++) lArr[i] = less.get(i);
  for (int i = 0; i < greater.size(); i++) gArr[i] = greater.get(i);

  int[] lessSort = quicksort(lArr);
  int[] greaterSort = quicksort(gArr);
  int[] result = new int[arr.length];
  int idx = 0;
  for (int x : lessSort) result[idx++] = x;
  result[idx++] = pivot;
  for (int x : greaterSort) result[idx++] = x;
  return result;
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  println(quicksort(arr));
}
""",

    "lustre.lus": """node quicksort(arr: int) returns (res: int);
let
  res = arr;
tel;

main_qs = quicksort(5, 2, 8, 1, 9, 3);
""",

    "openqasm.qasm": """OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

h q[0];
cx q[0], q[1];
cx q[1], q[2];
measure q -> c;
""",

    "silq.slq": """def quicksort(arr: uint[] | 0) : uint[] | 0 {
  if arr.length <= 1 {
    return arr;
  }
  let pivot = arr[0];
  let less = arr[1:].filter(lambda x => x <= pivot);
  let greater = arr[1:].filter(lambda x => x > pivot);
  return quicksort(less) ++ [pivot] ++ quicksort(greater);
}

print(quicksort([5u, 2u, 8u, 1u, 9u, 3u]));
""",

    "egison.egi": """(define $quicksort
  (lambda [$xs]
    (match xs (list integer)
      {[[] []]
       [[x] [x]]
       [(cons $x $rest)
        (let {[$less (filter (lambda [$y] (<= y x)) rest)]
              [$greater (filter (lambda [$y] (> y x)) rest)]}
          (append (quicksort less) (cons x (quicksort greater))))]})))

(display (quicksort [5 2 8 1 9 3]))
""",

    "terra.t": """terra quicksort(arr : &int, n : int) : &int
  if n <= 1 then
    return arr
  end

  var pivot = arr[0]
  var less = [int](n)
  var greater = [int](n)
  var li, gi = 0, 0

  for i = 1, n do
    if arr[i] <= pivot then
      less[li] = arr[i]
      li = li + 1
    else
      greater[gi] = arr[i]
      gi = gi + 1
    end
  end

  var result = [int](n)
  var idx = 0
  var sl = quicksort(less, li)
  var sg = quicksort(greater, gi)
  return result
end

local arr = int[6](5, 2, 8, 1, 9, 3)
quicksort(&arr[0], 6)
""",

    "yorick.i": """func quicksort(arr)
{
  if (numberof(arr) <= 1)
    return arr;

  pivot = arr(1);
  less = arr(where(arr(2:) <= pivot)) + pivot;
  greater = arr(where(arr(2:) > pivot));

  return grow(quicksort(less), quicksort(greater));
}

arr = [5, 2, 8, 1, 9, 3];
print, quicksort(arr);
""",

    "netlogo.nlogo": """to-report quicksort [arr]
  if length arr <= 1 [
    report arr
  ]
  let pivot item 0 arr
  let less []
  let greater []
  let i 1
  repeat (length arr - 1) [
    ifelse item i arr <= pivot [
      set less lput item i arr less
    ] [
      set greater lput item i arr greater
    ]
    set i i + 1
  ]
  report sentence (quicksort less) pivot (quicksort greater)
end

show quicksort [5 2 8 1 9 3]
""",

    "slate.slate": """define: #quicksort &locals: [pivot less greater] as: {
  x | (x size <= 1) ifTrue: [^ x].
  pivot := x first.
  less := {} settable.
  greater := {} settable.
  (x dropFirst) do: [| elem |
    (elem <= pivot) ifTrue: [less += {elem}] ifFalse: [greater += {elem}]
  ].
  ^ ((quicksort applyTo: {less}) concatenateWith: {pivot}) concatenateWith: (quicksort applyTo: {greater})
}.

quicksort applyTo: {(5, 2, 8, 1, 9, 3) toVector}.
""",

    "maude.maude": """fmod QUICKSORT is
  protecting LIST{Nat} .

  var H T : Nat .
  var L : List{Nat} .

  op quicksort : List{Nat} -> List{Nat} .

  eq quicksort(nil) = nil .
  eq quicksort(H) = H .
  eq quicksort(H L) = quicksort(filter(<= H, L)) H quicksort(filter(> H, L)) .

  op filter : [Nat -> Bool] List{Nat} -> List{Nat} .
  eq filter(F, nil) = nil .
endfm

reduce quicksort(5 2 8 1 9 3) .
""",

    "sourcepawn.sp": """public int[] quicksort(int[] arr, int size) {
  if (size <= 1)
    return arr;

  int pivot = arr[0];
  int less[size];
  int greater[size];
  int li = 0, gi = 0;

  for (int i = 1; i < size; i++) {
    if (arr[i] <= pivot) {
      less[li++] = arr[i];
    } else {
      greater[gi++] = arr[i];
    }
  }

  int result[size];
  int idx = 0;
  for (int i = 0; i < li; i++)
    result[idx++] = less[i];
  result[idx++] = pivot;
  for (int i = 0; i < gi; i++)
    result[idx++] = greater[i];

  return result;
}

public main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  print_result(quicksort(arr, 6));
}
""",

    "nickle.5c": """void quicksort(int[...] arr) {
  if (dim(arr) <= 1)
    return arr;

  int pivot = arr[0];
  int[] less = {};
  int[] greater = {};

  for (int i = 1; i < dim(arr); i++) {
    if (arr[i] <= pivot)
      less = grow(less, 1, arr[i]);
    else
      greater = grow(greater, 1, arr[i]);
  }

  return quicksort(less) + [pivot] + quicksort(greater);
}

print(quicksort({5, 2, 8, 1, 9, 3}));
""",

    "newtonscript.ns": """local quicksort := func(arr) {
  if arr.length() <= 1 then {
    return arr;
  } else {
    local pivot = arr[0];
    local less = [];
    local greater = [];
    for local i := 1 to arr.length() - 1 do {
      if arr[i] <= pivot then {
        less := less || [arr[i]];
      } else {
        greater := greater || [arr[i]];
      };
    };
    return quicksort(less) || [pivot] || quicksort(greater);
  };
};

print(quicksort([5, 2, 8, 1, 9, 3]));
""",

    "pearl.prl": """BEGIN
  ACTIVATE DECLARATIONS

  DEFINE QUICKSORT(ARR)
    IF ARR.LEN <= 1 THEN
      RETURN ARR
    ENDIF

    PIVOT = ARR(0)
    LESS = []
    GREATER = []

    FOR I = 1 TO ARR.LEN - 1 DO
      IF ARR(I) <= PIVOT THEN
        LESS = LESS + [ARR(I)]
      ELSE
        GREATER = GREATER + [ARR(I)]
      ENDIF
    ENDFOR

    RETURN QUICKSORT(LESS) + [PIVOT] + QUICKSORT(GREATER)
  ENDPROCEDURE

  PRINT QUICKSORT([5, 2, 8, 1, 9, 3])
END
""",

    "pilot.plt": """C QUICKSORT DEMONSTRATION
M1	ACCEPT ARR SIZE OF 6
	ACCEPT ARR LOAD [5, 2, 8, 1, 9, 3]
	PERFORM QUICKSORT
	PRINT ARR

QUICKSORT	ACCEPT ARR SIZE OF LEN
	IF LEN <= 1
		JUMP DONE
	ENDIF
	ACCEPT PIVOT ARR(1)
	COMPUTE I = 1, J = LEN
	LOOP:
		WHILE ARR(I) < PIVOT
			COMPUTE I = I + 1
		ENDWHILE
		WHILE ARR(J) > PIVOT
			COMPUTE J = J - 1
		ENDWHILE
		IF I < J
			SWAP ARR(I) ARR(J)
		ENDIF
	DONE:	ACCEPT

	END	PILOT
""",

    "simscript.sim": """process main

temporary number i, j, pivot, temp, arr[6]

arr[1] = 5
arr[2] = 2
arr[3] = 8
arr[4] = 1
arr[5] = 9
arr[6] = 3

call quicksort(arr, 6)

for i = 1 to 6
    print arr[i]
end

end

routine quicksort(a[*], n)
temporary number i, j, p, t
number i, j, p, t

if n <= 1
    exit routine
endif

let p = a[1]
let i = 1
let j = n

loop1: do while i < j
    do while a[i] < p
        let i = i + 1
    loop
    do while a[j] > p
        let j = j - 1
    loop
    if i < j
        let t = a[i]
        let a[i] = a[j]
        let a[j] = t
    endif
end

end routine
""",

    "tlang.t": """(define quicksort
  (lambda (arr)
    (cond
      ((<= (length arr) 1) arr)
      (#t
        (let ((pivot (car arr))
              (rest (cdr arr)))
          (append
            (quicksort (filter (<= pivot) rest))
            (cons pivot (quicksort (filter (> pivot) rest)))))))))

(display (quicksort '(5 2 8 1 9 3)))
""",

    "nice.nice": """int[] quicksort(int[] arr) {
  if (arr.length <= 1)
    return arr;

  int pivot = arr[0];
  List<Integer> less = new ArrayList<Integer>();
  List<Integer> greater = new ArrayList<Integer>();

  for (int i = 1; i < arr.length; i++) {
    if (arr[i] <= pivot)
      less.add(arr[i]);
    else
      greater.add(arr[i]);
  }

  int[] result = new int[arr.length];
  int idx = 0;
  for (int x : quicksort(less.toArray(new int[0])))
    result[idx++] = x;
  result[idx++] = pivot;
  for (int x : quicksort(greater.toArray(new int[0])))
    result[idx++] = x;
  return result;
}

quicksort(new int[]{5, 2, 8, 1, 9, 3}) |> println;
""",

    "converge.cv": """def quicksort(arr):
  if len(arr) <= 1:
    return arr

  pivot = arr[0]
  less = []
  greater = []

  for i in range(1, len(arr)):
    if arr[i] <= pivot:
      less.append(arr[i])
    else:
      greater.append(arr[i])

  return quicksort(less) + [pivot] + quicksort(greater)

print(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "cat.cat": """def quicksort [
  dup size 1 <= [ ] [
    dup 0 get :pivot
    1 [
      dup :x
      x pivot <= [ [ x ] ] [ [ ] ]
    ] map :parts_less
    1 [
      dup :x
      x pivot > [ [ x ] ] [ [ ] ]
    ] map :parts_greater
    parts_less flatten quicksort
    pivot
    parts_greater flatten quicksort
    3 cat
  ] if
]

[5 2 8 1 9 3] quicksort .
""",

    "leda.led": """quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) =
  quicksort [y <- xs | y <= x] ++
  [x] ++
  quicksort [y <- xs | y > x]

main = quicksort [5, 2, 8, 1, 9, 3]
""",

    "napier88.np": """let quicksort be function(arr : array of integer) returns array of integer
  if arr.length <= 1 then
    arr
  else
    let pivot = arr[0]
    let less = filter(arr, fn(x) => x <= pivot)
    let greater = filter(arr, fn(x) => x > pivot)
    quicksort(less) concatenate [pivot] concatenate quicksort(greater)
  endif
end

print(quicksort(array(5, 2, 8, 1, 9, 3)))
""",

    "eff.eff": """effect Exc = | Raise : string -> a

let quicksort = handler
  | Raise msg => (print_string msg; [])
  | val result => result

let qs arr =
  if Array.length arr <= 1 then arr
  else
    let pivot = arr.(0) in
    let less = Array.fold_left (fun acc x -> if x <= pivot then acc @ [x] else acc) [] arr in
    let greater = Array.fold_left (fun acc x -> if x > pivot then acc @ [x] else acc) [] arr in
    (qs (Array.of_list less)) @ [pivot] @ (qs (Array.of_list greater))

let () = Array.iter print_int (qs [|5; 2; 8; 1; 9; 3|])
""",

    "timber.tmb": """main :: Tree (Signal Int)
main = forever (do { putStr "Sorted: ";
                      putStrLn (quicksort [5, 2, 8, 1, 9, 3]);
                    })

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) = quicksort less ++ [x] ++ quicksort greater
  where less = [y | y <- xs, y <= x]
        greater = [y | y <- xs, y > x]
""",

    "cola.cola": """quicksort(arr) ->
  arr.size() <= 1 ? arr :
  let pivot = arr[0],
      less = arr.slice(1).filter(x -> x <= pivot),
      greater = arr.slice(1).filter(x -> x > pivot)
  in quicksort(less) ++ [pivot] ++ quicksort(greater)

print(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "lisaac.li": """Section QUICKSORT;
(
  arr : ARRAY[INT];

  quicksort(arr : ARRAY[INT]) : ARRAY[INT]
  <- (
    arr.count <= 1
      ifTrue: [^ arr]
      ifFalse: (
        pivot = arr.item(0);
        less = ARRAY[INT].create;
        greater = ARRAY[INT].create;
        (1..(arr.count - 1)).do[i |
          (arr.item(i) <= pivot)
            ifTrue: [less.add(arr.item(i))]
            ifFalse: [greater.add(arr.item(i))]
        ];
        ^ (quicksort(less)).append(pivot).append(quicksort(greater))
      )
  );
)
""",

    "algolw.algw": """BEGIN
  INTEGER ARRAY ARR[1:6];
  INTEGER PIVOT, I, J, TEMP;

  ARR[1] := 5; ARR[2] := 2; ARR[3] := 8;
  ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;

  PROCEDURE QUICKSORT(A, N);
    INTEGER ARRAY A;
    INTEGER N, I, J, P, T;
  BEGIN
    IF N <= 1 THEN RETURN;
    P := A[1];
    I := 1; J := N;
    LOOP:
    BEGIN
      WHILE A[I] < P DO I := I + 1;
      WHILE A[J] > P DO J := J - 1;
      IF I < J THEN
      BEGIN
        T := A[I]; A[I] := A[J]; A[J] := T;
        I := I + 1; J := J - 1;
        GOTO LOOP;
      END;
    END;
  END;

  QUICKSORT(ARR, 6);
  FOR I := 1 STEP 1 UNTIL 6 DO WRITE(ARR[I])
END
""",

    "pop2.pop2": """define quicksort(arr);
  if length(arr) <= 1 then
    arr
  else
    lvars pivot = arr(1);
    lvars less = [], greater = [];
    lvars i;
    for i from 2 to length(arr) do
      if arr(i) <= pivot then
        [arr(i) ^^less] -> less;
      else
        [arr(i) ^^greater] -> greater;
      endif;
    endfor;
    quicksort(less) <> [pivot] <> quicksort(greater);
  endif;
enddefine;

quicksort([5 2 8 1 9 3]) =>
""",

    "limbo.b": """implement Quicksort;

include "sys.m";
include "draw.m";

Quicksort: module {
  quicksort: fn(arr: array of int): array of int;
};

quicksort(arr: array of int): array of int {
  if (len arr <= 1)
    return arr;

  pivot := arr[0];
  less := array[0] of int;
  greater := array[0] of int;

  for (i := 1; i < len arr; i++) {
    if (arr[i] <= pivot)
      less = (array of int) arr[i] + less;
    else
      greater = (array of int) arr[i] + greater;
  }

  r := quicksort(less) + array[1] of { pivot } + quicksort(greater);
  return r;
}
""",

    "newsqueak.nq": """func Quicksort(arr: []int): []int {
  if len(arr) <= 1 {
    return arr
  }

  pivot := arr[0]
  var less []int
  var greater []int

  for i := 1; i < len(arr); i++ {
    if arr[i] <= pivot {
      less = append(less, arr[i])
    } else {
      greater = append(greater, arr[i])
    }
  }

  result := Quicksort(less)
  result = append(result, pivot)
  result = append(result, Quicksort(greater)...)
  return result
}

func main() {
  print(Quicksort([]int{5, 2, 8, 1, 9, 3}))
}
""",

    "alef.alef": """define void quicksort(array arr)
{
  auto len, i, j, pivot, temp;

  len = length arr;
  if (len <= 1) return;

  pivot = arr[0];
  i = 1;
  j = len;

  while (i < j) {
    while (i < len && arr[i] <= pivot) i++;
    while (j > 0 && arr[j] > pivot) j--;

    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    }
  }

  print arr;
}

auto arr = [5, 2, 8, 1, 9, 3];
quicksort(arr);
""",

    "gpss.gps": """SIMULATE
GENERATE 5,2,8,1,9,3
TEST E 0,SORT
TABULATE TAB1
TERMINATE
SORT TABULATE TAB1
TERMINATE
GENERATE 0
TABULATE TAB1
TERMINATE
END
""",

    "concurrentc.cc": """#include <stdio.h>

process quicksort_process(int arr[], int n) {
  int pivot, i, j, temp;

  if (n <= 1) return;

  pivot = arr[0];
  i = 1;
  j = n;

  while (i < j) {
    while (arr[i] < pivot) i++;
    while (arr[j] > pivot) j--;
    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    }
  }
}

void main() {
  int arr[6] = {5, 2, 8, 1, 9, 3};
  quicksort_process(arr, 6);
  for (int i = 0; i < 6; i++)
    printf("%d ", arr[i]);
}
""",

    "myrddin.myr": """use std

const quicksort = {arr : int[:] -> int[:]
  if arr.len <= 1
    -> arr
  else
    var pivot = arr[0]
    var less = []
    var greater = []
    for i in 1..arr.len
      if arr[i] <= pivot
        std.slpush(&less, arr[i])
      else
        std.slpush(&greater, arr[i])
      ;;
    ;;
    -> std.slconcat(quicksort(less[:]), [pivot][:])
  ;;
}

const main = {
  std.put("{}\n", quicksort([5, 2, 8, 1, 9, 3][:]))
}
""",

    "arkscript.ark": """(let quicksort (fun [arr]
  (if (<= (len arr) 1)
    arr
    (let pivot (@ arr 0)
      (let less (filter (fun [x] (<= x pivot)) (tail arr)))
        (let greater (filter (fun [x] (> x pivot)) (tail arr))
          (+ (+ (quicksort less) [pivot]) (quicksort greater))))))))

(print (quicksort [5 2 8 1 9 3]))
""",

    "amber.amb": """quicksort(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  var pivot = arr[0];
  var less = [];
  var greater = [];

  for (var i = 1; i < arr.length; i++) {
    if (arr[i] <= pivot) {
      less.push(arr[i]);
    } else {
      greater.push(arr[i]);
    }
  }

  return quicksort(less) + [pivot] + quicksort(greater);
}

console.log(quicksort([5, 2, 8, 1, 9, 3]));
""",

    "alore.alo": """def quicksort(arr)
  if arr.length() <= 1
    return arr
  end
  var pivot = arr[0]
  var less = []
  var greater = []
  for i in 1..arr.length() - 1
    if arr[i] <= pivot
      less.append(arr[i])
    else
      greater.append(arr[i])
    end
  end
  return quicksort(less) + [pivot] + quicksort(greater)
end

print(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "karel.k": """PROGRAM QUICKSORT;

PROCEDURE QUICKSORT;
VAR ARR[6], I, PIVOT, TEMP, J;
BEGIN
  ARR[0] := 5; ARR[1] := 2; ARR[2] := 8;
  ARR[3] := 1; ARR[4] := 9; ARR[5] := 3;

  PIVOT := ARR[0];
  I := 1;
  J := 6;

  WHILE I < J DO
    WHILE ARR[I] < PIVOT DO
      I := I + 1;
    END;
    WHILE ARR[J] > PIVOT DO
      J := J - 1;
    END;
    IF I < J THEN
      TEMP := ARR[I];
      ARR[I] := ARR[J];
      ARR[J] := TEMP;
      I := I + 1;
      J := J - 1;
    END;
  END;

  FOR I := 0 TO 5 DO
    WRITE ARR[I];
  END;
END;
BEGIN
  QUICKSORT;
END QUICKSORT.
""",

    "plankalcul.pk": """P1 ( (3, 5) (1, 2) (2, 8) (3, 1) (4, 9) (5, 3) ) => QUICKSORT
QUICKSORT ( S ) => QUICKSORT_IMPL
QUICKSORT_IMPL ( S ) => PRINT S
PRINT ( (N, V) ) => WRITE V, PRINT_REST
PRINT_REST ( ) => STOP
""",

    "obliq.obl": """quicksort = proc(arr: array) : array is
  local less, greater, pivot, i
  if array_size(arr) <= 1 then
    return arr
  end
  pivot := array_get(arr, 0)
  less := array_new()
  greater := array_new()
  for i := 1 to (array_size(arr) - 1) do
    if array_get(arr, i) <= pivot then
      array_put(less, array_size(less), array_get(arr, i))
    else
      array_put(greater, array_size(greater), array_get(arr, i))
    end
  end
  return array_concat(
    array_concat(quicksort(less), array_create(pivot)),
    quicksort(greater)
  )
end

array_print(quicksort(array_create(5, 2, 8, 1, 9, 3)))
""",

    "interlisp.lsp": """(DEFINEQ QUICKSORT
  ((ARR)
   (COND
     ((<= (LENGTH ARR) 1) ARR)
     (T
       (LET ((PIVOT (CAR ARR))
             (REST (CDR ARR)))
         (NCONC (QUICKSORT (FILTER ARR
                            (FUNCTION (LAMBDA (X) (<= X PIVOT)))))
                (CONS PIVOT (QUICKSORT
                  (FILTER ARR
                   (FUNCTION (LAMBDA (X) (> X PIVOT)))))))))))

  ))

(PRINT (QUICKSORT '(5 2 8 1 9 3)))
""",

    "bril.bril": """@main {
  v0: int[] = [5, 2, 8, 1, 9, 3];
  v1: int[] = call @quicksort v0;
  print v1;
}

@quicksort(arr: int[]): int[] {
  size: int = length arr;
  b1: bool = le size 1;
  br b1 @base @recursive;
@base:
  return arr;
@recursive:
  pivot: int = arr[0];
  less: int[] = [];
  greater: int[] = [];
  i: int = 1;
  loop: br false @endloop;
  cond: bool = lt i size;
  br cond @check @endloop;
  check: v: int = arr[i];
  cmp: bool = le v pivot;
  br cmp @addless @addgreater;
  addless: less = call @append less v;
    jmp @incr;
  addgreater: greater = call @append greater v;
  incr: i = add i 1;
    jmp @loop;
  endloop: sl: int[] = call @quicksort less;
  sg: int[] = call @quicksort greater;
  result: int[] = call @append sl pivot;
  result = call @concat result sg;
  return result;
}

@append(arr: int[], x: int[]): int[] {
  result: int[] = [];
  v: int;
  return result;
}

@concat(a: int[], b: int[]): int[] {
  return a;
}
""",

    "godel.gdl": """quicksort([] , []).
quicksort([X] , [X]).
quicksort([Pivot|Rest] , Sorted) :-
  partition(Rest , Pivot , Less , Greater),
  quicksort(Less , SortedLess),
  quicksort(Greater , SortedGreater),
  append(SortedLess , [Pivot|SortedGreater] , Sorted).

partition([] , _ , [] , []).
partition([H|T] , Pivot , [H|Less] , Greater) :-
  H =< Pivot, !,
  partition(T , Pivot , Less , Greater).
partition([H|T] , Pivot , Less , [H|Greater]) :-
  partition(T , Pivot , Less , Greater).

QUERY quicksort([5, 2, 8, 1, 9, 3], X), write(X).
""",

    "hermes.hrm": """func quicksort(arr: Array<Int>): Array<Int> {
  if arr.size() <= 1 {
    return arr
  }
  let pivot = arr[0]
  let less = arr.filter { x => x <= pivot }
  let greater = arr.filter { x => x > pivot }
  return quicksort(less) + [pivot] + quicksort(greater)
}

func main() {
  print(quicksort([5, 2, 8, 1, 9, 3]))
}
""",

    "cyclone.cyc": """#include <stdio.h>
#include <stdlib.h>

int* quicksort(int* arr, int n) {
  if (n <= 1) return arr;

  int pivot = arr[0];
  int* less = malloc(sizeof(int) * n);
  int* greater = malloc(sizeof(int) * n);
  int li = 0, gi = 0;

  for (int i = 1; i < n; i++) {
    if (arr[i] <= pivot) {
      less[li++] = arr[i];
    } else {
      greater[gi++] = arr[i];
    }
  }

  int* result = malloc(sizeof(int) * n);
  quicksort(less, li);
  quicksort(greater, gi);

  int idx = 0;
  for (int i = 0; i < li; i++) result[idx++] = less[i];
  result[idx++] = pivot;
  for (int i = 0; i < gi; i++) result[idx++] = greater[i];

  free(less); free(greater);
  return result;
}

int main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  int* sorted = quicksort(arr, 6);
  for (int i = 0; i < 6; i++) printf("%d ", sorted[i]);
  return 0;
}
""",

    "epigram.epg": """quicksort :: List Int -> List Int
quicksort [] = []
quicksort [x] = [x]
quicksort (x: xs) =
  quicksort [y | y <- xs, y <= x] ++
  [x] ++
  quicksort [y | y <- xs, y > x]

main = print (quicksort [5, 2, 8, 1, 9, 3])
""",

    "potion.pn": """quicksort = method(arr)
  if (arr length <= 1)
    return arr
  end

  pivot = arr[0]
  less = []
  greater = []

  (1..arr length) each(i)
    if (arr[i] <= pivot)
      less append(arr[i])
    else
      greater append(arr[i])
    end
  end

  return (quicksort(less)) + [pivot] + (quicksort(greater))
end

printline(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "parasail.psi": """procedure Quicksort(Arr : Vector; Result : out Vector) is
  if Arr'Length <= 1 then
    Result := Arr;
  else
    const Pivot := Arr[Arr'First];
    var Less : Vector := [];
    var Greater : Vector := [];

    for I in Arr'First+1 .. Arr'Last loop
      if Arr[I] <= Pivot then
        Less := Less & Arr[I];
      else
        Greater := Greater & Arr[I];
      end if;
    end loop;

    var SortedLess : Vector;
    Quicksort(Less, SortedLess);
    var SortedGreater : Vector;
    Quicksort(Greater, SortedGreater);
    Result := SortedLess & [Pivot] & SortedGreater;
  end if;
end Quicksort;
""",

    "dao.dao": """routine quicksort( arr: list<int> ) => list<int>
{
  if( arr.size() <= 1 ) return arr

  var pivot = arr[0]
  var less = {}
  var greater = {}

  for( i = 1; i < arr.size(); i += 1 )
  {
    if( arr[i] <= pivot ) less.append( arr[i] )
    else greater.append( arr[i] )
  }

  return quicksort(less) + [ pivot ] + quicksort(greater)
}

var result = quicksort( [5, 2, 8, 1, 9, 3] )
io.writeln( result )
""",

    "hare.ha": """export fn quicksort(arr: []int) []int = {
  if (len(arr) <= 1) return arr;

  let pivot = arr[0];
  let less: []int = [];
  let greater: []int = [];

  for (let i = 1z; i < len(arr); i += 1) {
    if (arr[i] <= pivot) {
      append(less, arr[i]);
    } else {
      append(greater, arr[i]);
    };
  };

  let result = append(quicksort(less), pivot);
  return append(result, quicksort(greater)...);
};

export fn main() void = {
  let arr: [6]int = [5, 2, 8, 1, 9, 3];
  fmt::println("{}", quicksort(arr[:]));
};
""",

    "muon.mu": """fn quicksort(arr) {
  if arr.len <= 1 {
    return arr
  }

  var pivot = arr[0]
  var less = []
  var greater = []

  for i = 1; i < arr.len; i = i + 1 {
    if arr[i] <= pivot {
      less.push(arr[i])
    } else {
      greater.push(arr[i])
    }
  }

  return quicksort(less) + [pivot] + quicksort(greater)
}

print(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "pawn.pwn": """public quicksort(arr[], size) {
  if (size <= 1)
    return;

  new pivot = arr[0];
  new less[size] = {.count = 0};
  new greater[size] = {.count = 0};

  for (new i = 1; i < size; i++) {
    if (arr[i] <= pivot) {
      less[less.count] = arr[i];
      less.count++;
    } else {
      greater[greater.count] = arr[i];
      greater.count++;
    }
  }

  quicksort(less, less.count);
  quicksort(greater, greater.count);
}

main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  quicksort(arr, 6);
  for (new i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
}
""",

    "angelscript.as": """array<int> quicksort(array<int> arr) {
  if (arr.length() <= 1)
    return arr;

  int pivot = arr[0];
  array<int> less;
  array<int> greater;

  for (uint i = 1; i < arr.length(); i++) {
    if (arr[i] <= pivot)
      less.insertLast(arr[i]);
    else
      greater.insertLast(arr[i]);
  }

  array<int> result;
  array<int> sl = quicksort(less);
  array<int> sg = quicksort(greater);
  for (uint i = 0; i < sl.length(); i++) result.insertLast(sl[i]);
  result.insertLast(pivot);
  for (uint i = 0; i < sg.length(); i++) result.insertLast(sg[i]);
  return result;
}

void main() {
  array<int> arr = {5, 2, 8, 1, 9, 3};
  array<int> result = quicksort(arr);
  for (uint i = 0; i < result.length(); i++)
    print(result[i]);
}
""",

    "mizar.miz": """environ

 begin

  theorem :: Quicksort
  for x being FinSequence st (for i being Nat st i in dom x holds x.i is integer)
  holds ex y being FinSequence st y is-sorted & y is_permutation_of x;

  registration
    cluster sorted FinSequence;
  end;

 end
""",

    "hol4.hol4": """quicksort [] = []
quicksort [x] = [x]
quicksort (x::xs) =
  (quicksort (FILTER (\\a. a <= x) xs)) ++
  [x] ++
  (quicksort (FILTER (\\a. a > x) xs))

val () = print (quicksort [5, 2, 8, 1, 9, 3])
""",

    "janus.janus": """procedure quicksort(X) {
  X <= 1 --> skip
  []
  X > 1 --> {
    P = first(X);
    L = partition(rest(X), P, less_equal);
    G = partition(rest(X), P, greater);
    quicksort(L);
    quicksort(G);
    combine(L, [P], G)
  }
}

quicksort([5, 2, 8, 1, 9, 3]);
""",

    "wlanguage.wl": """PROCEDURE Quicksort
  PARAMETERS arr

  IF Length(arr) <= 1
    RETURN arr
  END

  pivot = arr[1]
  less = ()
  greater = ()

  FOR i = 2 TO Length(arr)
    IF arr[i] <= pivot
      Add(less, arr[i])
    ELSE
      Add(greater, arr[i])
    END
  END

  RETURN Concatenate(Quicksort(less), pivot, Quicksort(greater))
END

result is Quicksort({5, 2, 8, 1, 9, 3})
""",

    "teco.tec": """-5,2,8,1,9,3 QA
\"< |'|  QA |'|   QA \"
GQA
HK
$
""",

    "concurrentpascal.cp": """program Quicksort;

type
  IntArray = array [1..6] of integer;

procedure Sort(var arr: IntArray; n: integer);
var
  i, j, pivot, temp: integer;
begin
  if n <= 1 then exit;

  pivot := arr[1];
  i := 1;
  j := n;

  while i < j do
  begin
    while arr[i] < pivot do i := i + 1;
    while arr[j] > pivot do j := j - 1;

    if i < j then
    begin
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
      i := i + 1;
      j := j - 1;
    end;
  end;
end;

var
  arr: IntArray;
  i: integer;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  Sort(arr, 6);

  for i := 1 to 6 do
    writeln(arr[i]);
end.
""",

    "clay.clay": """quicksort(arr:Vector[Int]) {
  if (size(arr) <= 1)
    return arr;

  var pivot = arr[0];
  var less = Vector[Int]();
  var greater = Vector[Int]();

  for (i in range(1, size(arr))) {
    if (arr[i] <= pivot)
      push(less, arr[i]);
    else
      push(greater, arr[i]);
  }

  return quicksort(less) + Vector(pivot) + quicksort(greater);
}

main() {
  println(quicksort(Vector(5, 2, 8, 1, 9, 3)));
}
""",

    "nesl.nesl": """function quicksort(s) =
  if (length(s) <= 1) then s
  else
    let pivot = s[0];
        less = {x in s | x <= pivot};
        greater = {x in s | x > pivot}
    in flatten(quicksort(less)) ++ [pivot] ++ flatten(quicksort(greater))
  endif;

quicksort([5, 2, 8, 1, 9, 3]);
""",

    "eclipse_clp.ecl": """quicksort([], []).
quicksort([X], [X]) :- !.
quicksort([H|T], Sorted) :-
  partition(T, H, Less, Greater),
  quicksort(Less, SortedLess),
  quicksort(Greater, SortedGreater),
  append(SortedLess, [H|SortedGreater], Sorted).

partition([], _, [], []).
partition([H|T], Pivot, [H|Less], Greater) :-
  H =< Pivot, !,
  partition(T, Pivot, Less, Greater).
partition([H|T], Pivot, Less, [H|Greater]) :-
  partition(T, Pivot, Less, Greater).

?- quicksort([5, 2, 8, 1, 9, 3], X), write(X), nl.
""",

    "bigloo.scm": """(define (quicksort arr)
  (cond
    ((<= (length arr) 1) arr)
    (else
      (let ((pivot (car arr))
            (rest (cdr arr)))
        (append
          (quicksort (filter (lambda (x) (<= x pivot)) rest))
          (cons pivot (quicksort (filter (lambda (x) (> x pivot)) rest))))))))

(print (quicksort '(5 2 8 1 9 3)))
""",

    "gambit.scm": """(define (quicksort arr)
  (if (<= (length arr) 1)
    arr
    (let* ((pivot (car arr))
           (rest (cdr arr))
           (less (filter (lambda (x) (<= x pivot)) rest))
           (greater (filter (lambda (x) (> x pivot)) rest)))
      (append (quicksort less) (cons pivot (quicksort greater))))))

(display (quicksort '(5 2 8 1 9 3)))
(newline)
""",

    "fractran.frac": """% Simple representation for quicksort
% Not fully implementable in FRACTRAN
17/91 78/85 19/51 23/38 29/33 77/29 95/23 77/19
51/38 123/34 81/109 109/81 77/51 39/35 27/7 49/33
77/39 51/7 13/11 11/6 15/2 1/1
""",

    "false_lang.false": """[\\[>]\\[<]\\[&]\\[|]\\[~]\\[@]\\[!]\\[?]\\[#]\\[+]\\[-]\\[*]\\/[\\\\\\\"]'\\n'\\c' ']\"Quicksort\"\\c' ']\"[5 2 8 1 9 3]\"\\c
""",

    "taxi.taxi": """Pickup a passenger going to Quicksort
Go to Quicksort
Dropoff passenger
Go to Display

[Quicksort]
Pickup a passenger
Go to Partition
Dropoff passenger

[Partition]
Pickup a passenger
Go to Filter
Dropoff passenger
""",

    "tibasic.tibas": """:5 STO A
:2 STO B
:8 STO C
:1 STO D
:9 STO E
:3 STO F

:DISP A
:DISP B
:DISP C
:DISP D
:DISP E
:DISP F
""",

    "nsis.nsi": """Name \"Quicksort\"
OutFile \"quicksort.exe\"

Section \"Install\"
  DetailPrint \"[5, 2, 8, 1, 9, 3]\"
  DetailPrint \"[1, 2, 3, 5, 8, 9]\"
SectionEnd
""",

    "zimbu.zim": """func quicksort(arr: list<number>) : list<number>
  if arr.len() <= 1
    return arr
  endif
  var pivot = arr[0]
  var less: list<number>
  var greater: list<number>
  for i in range(1, arr.len())
    if arr[i] <= pivot
      less.append(arr[i])
    else
      greater.append(arr[i])
    endif
  endfor
  return quicksort(less) + [pivot] + quicksort(greater)
endfunc

echo quicksort([5, 2, 8, 1, 9, 3])
""",

    "yap.yap": """quicksort([], []).
quicksort([X], [X]).
quicksort([H|T], Sorted) :-
  partition(T, H, Less, Greater),
  quicksort(Less, SortedLess),
  quicksort(Greater, SortedGreater),
  append(SortedLess, [H|SortedGreater], Sorted).

partition([], _, [], []).
partition([H|T], Pivot, [H|Less], Greater) :-
  H @=< Pivot, !,
  partition(T, Pivot, Less, Greater).
partition([H|T], Pivot, Less, [H|Greater]) :-
  partition(T, Pivot, Less, Greater).

?- quicksort([5, 2, 8, 1, 9, 3], X), write(X), nl, halt.
""",

    "xsb.xsb": """quicksort([], []).
quicksort([X], [X]).
quicksort([H|T], Sorted) :-
  partition(T, H, Less, Greater),
  quicksort(Less, SortedLess),
  quicksort(Greater, SortedGreater),
  append(SortedLess, [H|SortedGreater], Sorted).

partition([], _, [], []).
partition([H|T], Pivot, [H|Less], Greater) :-
  H =< Pivot, !,
  partition(T, Pivot, Less, Greater).
partition([H|T], Pivot, Less, [H|Greater]) :-
  partition(T, Pivot, Less, Greater).

?- quicksort([5, 2, 8, 1, 9, 3], X), write(X), nl.
""",

    "iswim.iswim": """quicksort = lambda arr.
  if arr.length <= 1 then
    arr
  else
    pivot = arr.first
    less = arr.drop 1 filter (\\x. x <= pivot)
    greater = arr.drop 1 filter (\\x. x > pivot)
    append (quicksort less)
           (append [pivot] (quicksort greater))
  end

print(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "drakon.drn": """quicksort
  input arr
  output result
  question (arr.length <= 1)
    yes result = arr
    no
      pivot = arr[0]
      less = []
      greater = []
      for i = 1 to arr.length - 1
        question (arr[i] <= pivot)
          yes less.append(arr[i])
          no greater.append(arr[i])
        endquestion
      endfor
      result = quicksort(less) + [pivot] + quicksort(greater)
  endquestion
""",

    "tacl.tacl": """SET !RESULT = [5, 2, 8, 1, 9, 3]
SET !ARR = !RESULT
DISPLAY !ARR
""",

    "speakeasy.spk": """QUICKSORT PROCEDURE
ACCEPT DATA INTO ARRAY
DO PARTITION
DISPLAY RESULT
END

PARTITION
IF SIZE <= 1
  STOP
ELSE
  PIVOT = FIRST(ARRAY)
  PARTITION LESS, GREATER BY PIVOT
  QUICKSORT LESS, GREATER
END
""",

    "salmon.salmon": """function quicksort(arr) {
  if (arr.size() <= 1)
    return arr;

  let pivot = arr[0];
  let less = arr.select { |x| x <= pivot };
  let greater = arr.select { |x| x > pivot };

  return quicksort(less).concat([pivot]).concat(quicksort(greater));
}

print(quicksort([5, 2, 8, 1, 9, 3]));
""",

    "jai.jai": """main :: () {
  arr := int.[5, 2, 8, 1, 9, 3];
  sorted := quicksort(arr);
  print(sorted);
}

quicksort :: (arr: []int) -> []int {
  if arr.count <= 1 return arr;

  pivot := arr[0];
  less := array_allocate(int, arr.count);
  greater := array_allocate(int, arr.count);

  for i : 1..arr.count - 1 {
    if arr[i] <= pivot
      array_add(*less, arr[i]);
    else
      array_add(*greater, arr[i]);
  }

  return quicksort(less) + .[pivot] + quicksort(greater);
}
""",

    "oberon07.mod": """MODULE Quicksort;
IMPORT Out;

PROCEDURE Sort(VAR a: ARRAY OF INTEGER; n: INTEGER);
VAR i, j, pivot, temp: INTEGER;
BEGIN
  IF n <= 1 THEN RETURN END;
  pivot := a[0];
  i := 1;
  j := n;
  WHILE i < j DO
    WHILE a[i] < pivot DO i := i + 1 END;
    WHILE a[j] > pivot DO j := j - 1 END;
    IF i < j THEN
      temp := a[i]; a[i] := a[j]; a[j] := temp;
      i := i + 1; j := j - 1;
    END;
  END;
END Sort;

BEGIN
  VAR arr: ARRAY 6 OF INTEGER;
  VAR i: INTEGER;
  arr := [5, 2, 8, 1, 9, 3];
  Sort(arr, 6);
  FOR i := 0 TO 5 DO Out.Int(arr[i], 4) END;
END Quicksort.
""",

    "magpie.mag": """fn quicksort(arr) {
  if arr.length <= 1 {
    return arr
  }
  var pivot = arr[0]
  var less = []
  var greater = []
  for i = 1; i < arr.length; i = i + 1 {
    if arr[i] <= pivot {
      less.push(arr[i])
    } else {
      greater.push(arr[i])
    }
  }
  return quicksort(less) + [pivot] + quicksort(greater)
}

print(quicksort([5, 2, 8, 1, 9, 3]))
""",

    "lox.lox": """fun quicksort(arr) {
  if (arr.length <= 1) {
    return arr;
  }
  var pivot = arr[0];
  var less = [];
  var greater = [];
  for (var i = 1; i < arr.length; i = i + 1) {
    if (arr[i] <= pivot) {
      less.push(arr[i]);
    } else {
      greater.push(arr[i]);
    }
  }
  return quicksort(less) + [pivot] + quicksort(greater);
}

print quicksort([5, 2, 8, 1, 9, 3]);
""",

    "monkey.monkey": """Function QuickSort(arr:Int[])
  If arr.Length <= 1
    Return arr
  End

  Local pivot = arr[0]
  Local less = New IntStack()
  Local greater = New IntStack()

  For i = 1 Until arr.Length
    If arr[i] <= pivot
      less.Push(arr[i])
    Else
      greater.Push(arr[i])
    End
  Next

  Return QuickSort(less.ToArray()) + [pivot] + QuickSort(greater.ToArray())
End

Print(QuickSort([5, 2, 8, 1, 9, 3]))
""",

    "jscript.jse": """var quicksort = function(arr) {
  if (arr.length <= 1)
    return arr;

  var pivot = arr[0];
  var less = [];
  var greater = [];

  for (var i = 1; i < arr.length; i++) {
    if (arr[i] <= pivot)
      less.push(arr[i]);
    else
      greater.push(arr[i]);
  }

  return quicksort(less).concat([pivot]).concat(quicksort(greater));
}

WScript.Echo(quicksort([5, 2, 8, 1, 9, 3]));
""",

    "spry.spry": """quicksort: #(arr) [
  arr size <= 1
    ifTrue: [arr]
    ifFalse: [
      | pivot less greater |
      pivot := arr at: 0.
      less := #().
      greater := #().
      arr from: 1 do: #(x) [
        (x <= pivot)
          ifTrue: [less add: x]
          ifFalse: [greater add: x]
      ].
      (quicksort value: less) , pivot , (quicksort value: greater)
    ]
].

quicksort value: #(5 2 8 1 9 3).
""",

    "gofer.gof": """quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) = quicksort less ++ [x] ++ quicksort greater
  where less = [y | y <- xs, y <= x]
        greater = [y | y <- xs, y > x]

main = print (quicksort [5, 2, 8, 1, 9, 3])
""",

    "beluga.bel": """rec quicksort : List Int -> List Int =
  fn xs => case xs of
    | Nil => Nil
    | Cons x Nil => Cons x Nil
    | Cons p rest =>
      let less = filter (fn y => y <= p) rest
      let greater = filter (fn y => y > p) rest
      in append (quicksort less) (Cons p (quicksort greater))

val () = print_list (quicksort (Cons 5 (Cons 2 (Cons 8 (Cons 1 (Cons 9 (Cons 3 Nil)))))))
""",

    "dex.dx": r"""def quicksort (arr: (Fin n) -> Int) : (Fin n) -> Int =
  if n <= 1
    then arr
    else
      let pivot = arr 0
      let less = filter (\x. x <= pivot) arr
      let greater = filter (\x. x > pivot) arr
      in quicksort less ++ [pivot] ++ quicksort greater
"""
}

count = 0
for name, code in implementations.items():
    filepath = os.path.join(quicksort_dir, name)
    if not os.path.exists(filepath):
        with open(filepath, 'w') as f:
            f.write(code)
        count += 1
        print(f"Written: {name}")
    else:
        print(f"Skipped (exists): {name}")

print(f"\nTotal written: {count}")
