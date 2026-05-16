#!/usr/bin/env python3
import json
from pathlib import Path

def clean_implementation(lang_name, content):
    """Remove test code from implementations based on language"""

    if lang_name == "Python":
        return """def shellsort(arr):
    n = len(arr)
    gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            temp = arr[i]
            j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap //= 2
    return arr
"""
    elif lang_name == "JavaScript":
        return """function shellsort(arr) {
    let n = arr.length;
    let gap = Math.floor(n / 2);
    while (gap > 0) {
        for (let i = gap; i < n; i++) {
            let temp = arr[i];
            let j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap = Math.floor(gap / 2);
    }
    return arr;
}
"""
    elif lang_name == "TypeScript":
        return """function shellsort(arr: number[]): number[] {
    let n = arr.length;
    let gap = Math.floor(n / 2);
    while (gap > 0) {
        for (let i = gap; i < n; i++) {
            let temp = arr[i];
            let j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap = Math.floor(gap / 2);
    }
    return arr;
}
"""
    elif lang_name == "Rust":
        return """pub fn shellsort(arr: &mut [i32]) {
    let n = arr.len();
    let mut gap = n / 2;
    while gap > 0 {
        for i in gap..n {
            let temp = arr[i];
            let mut j = i;
            while j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
}
"""
    elif lang_name == "Go":
        return """package main

func Shellsort(arr []int) {
    n := len(arr)
    gap := n / 2
    for gap > 0 {
        for i := gap; i < n; i++ {
            temp := arr[i]
            j := i
            for j >= gap && arr[j-gap] > temp {
                arr[j] = arr[j-gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
}
"""
    elif lang_name == "Java":
        return """public class Shellsort {
    public static void shellsort(int[] arr) {
        int n = arr.length;
        int gap = n / 2;
        while (gap > 0) {
            for (int i = gap; i < n; i++) {
                int temp = arr[i];
                int j = i;
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
            gap /= 2;
        }
    }
}
"""
    elif lang_name == "C":
        return """void shellsort(int arr[], int n) {
    int gap = n / 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
}
"""
    elif lang_name == "C++":
        return """void shellsort(int arr[], int n) {
    int gap = n / 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
}
"""
    elif lang_name == "C#":
        return """public static void Shellsort(int[] arr) {
    int n = arr.Length;
    int gap = n / 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
}
"""
    elif lang_name == "Ruby":
        return """def shellsort(arr)
    n = arr.length
    gap = n / 2
    while gap > 0
        (gap...n).each do |i|
            temp = arr[i]
            j = i
            while j >= gap && arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            end
            arr[j] = temp
        end
        gap /= 2
    end
    arr
end
"""
    elif lang_name == "Swift":
        return """func shellsort(_ arr: inout [Int]) {
    let n = arr.count
    var gap = n / 2
    while gap > 0 {
        for i in gap..<n {
            let temp = arr[i]
            var j = i
            while j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
}
"""
    elif lang_name == "Kotlin":
        return """fun shellsort(arr: IntArray) {
    val n = arr.size
    var gap = n / 2
    while (gap > 0) {
        for (i in gap until n) {
            val temp = arr[i]
            var j = i
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
}
"""
    elif lang_name == "Scala":
        return """def shellsort(arr: Array[Int]): Unit = {
    val n = arr.length
    var gap = n / 2
    while (gap > 0) {
        for (i <- gap until n) {
            val temp = arr(i)
            var j = i
            while (j >= gap && arr(j - gap) > temp) {
                arr(j) = arr(j - gap)
                j -= gap
            }
            arr(j) = temp
        }
        gap /= 2
    }
}
"""
    elif lang_name == "Haskell":
        return """shellsort :: [Int] -> [Int]
shellsort xs = shell xs (length xs `div` 2)
  where
    shell arr 0 = arr
    shell arr gap = shell (pass arr gap 0) (gap `div` 2)
    pass arr _ i | i >= length arr = arr
    pass arr gap i = pass (swap arr i gap) gap (i + 1)
    swap arr i gap
        | arr !! i < arr !! (i - gap) = arr
        | otherwise = take (i - gap) arr ++ [arr !! i] ++ take (gap - 1) (drop (i - gap + 1) arr) ++ [arr !! (i - gap)] ++ drop (i + 1) arr
"""
    elif lang_name == "Erlang":
        return """shellsort(List) ->
    N = length(List),
    Gap = N div 2,
    shell_sort(Gap, List, N).

shell_sort(Gap, List, _) when Gap =< 0 ->
    List;
shell_sort(Gap, List, N) ->
    NewList = insert_gap(List, Gap, Gap, N),
    shell_sort(Gap div 2, NewList, N).

insert_gap(List, _, Idx, N) when Idx >= N ->
    List;
insert_gap(List, Gap, Idx, N) ->
    Element = lists:nth(Idx + 1, List),
    if Idx < Gap ->
        insert_gap(List, Gap, Idx + 1, N);
    true ->
        CompIdx = Idx - Gap + 1,
        CompElement = lists:nth(CompIdx, List),
        if CompElement > Element ->
            Swapped = swap_elements(List, CompIdx - 1, Idx),
            insert_gap(Swapped, Gap, Idx + 1, N);
        true ->
            insert_gap(List, Gap, Idx + 1, N)
        end
    end.

swap_elements(List, I, J) ->
    lists:sublist(List, I - 1) ++ [lists:nth(J + 1, List)] ++ lists:sublist(List, I, J - I) ++ [lists:nth(I + 1, List)] ++ lists:sublist(List, J + 2).
"""
    elif lang_name == "Elixir":
        return """defmodule Shellsort do
    def shellsort(list) do
        arr = Enum.to_list(list)
        n = Enum.count(arr)
        shell_loop(arr, n div 2, n)
    end

    defp shell_loop(arr, gap, _) when gap <= 0, do: arr
    defp shell_loop(arr, gap, n) do
        new_arr = insert_gap(arr, gap, gap, n)
        shell_loop(new_arr, gap div 2, n)
    end

    defp insert_gap(arr, _, idx, n) when idx >= n, do: arr
    defp insert_gap(arr, gap, idx, n) when idx < gap do
        insert_gap(arr, gap, idx + 1, n)
    end
    defp insert_gap(arr, gap, idx, n) do
        temp = Enum.at(arr, idx)
        j = idx - gap
        if Enum.at(arr, j) > temp do
            new_arr = List.replace_at(arr, j + gap, Enum.at(arr, j))
            new_arr = List.replace_at(new_arr, j, temp)
            insert_gap(new_arr, gap, idx + 1, n)
        else
            insert_gap(arr, gap, idx + 1, n)
        end
    end
end
"""
    elif lang_name == "Clojure":
        return """(defn shellsort [arr]
    (let [n (count arr)
          arr (vec arr)]
        (loop [arr arr gap (quot n 2)]
            (if (zero? gap)
                (vec arr)
                (loop [arr arr i gap]
                    (if (>= i n)
                        arr
                        (let [temp (arr i)]
                            (loop [arr arr j i]
                                (if (or (< j gap) (<= (arr (- j gap)) temp))
                                    (recur arr (+ j 1))
                                    (recur (assoc arr j (arr (- j gap))) (- j gap)))))))
                (recur arr (quot gap 2)))))))
"""
    elif lang_name == "F#":
        return """let shellsort (arr: int array) =
    let n = arr.Length
    let mutable gap = n / 2
    while gap > 0 do
        for i = gap to n - 1 do
            let temp = arr.[i]
            let mutable j = i
            while j >= gap && arr.[j - gap] > temp do
                arr.[j] <- arr.[j - gap]
                j <- j - gap
            arr.[j] <- temp
        gap <- gap / 2
    arr
"""
    elif lang_name == "OCaml":
        return """let shellsort arr =
    let n = Array.length arr in
    let gap = ref (n / 2) in
    while !gap > 0 do
        for i = !gap to n - 1 do
            let temp = arr.(i) in
            let j = ref i in
            while !j >= !gap && arr.(!j - !gap) > temp do
                arr.(!j) <- arr.(!j - !gap);
                j := !j - !gap
            done;
            arr.(!j) <- temp
        done;
        gap := !gap / 2
    done;
    arr
"""
    elif lang_name == "Dart":
        return """void shellsort(List<int> arr) {
    int n = arr.length;
    int gap = n ~/ 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap ~/= 2;
    }
}
"""
    elif lang_name == "Lua":
        return """function shellsort(arr)
    local n = #arr
    local gap = math.floor(n / 2)
    while gap > 0 do
        for i = gap + 1, n do
            local temp = arr[i]
            local j = i
            while j > gap and arr[j - gap] > temp do
                arr[j] = arr[j - gap]
                j = j - gap
            end
            arr[j] = temp
        end
        gap = math.floor(gap / 2)
    end
    return arr
end
"""
    elif lang_name == "R":
        return """shellsort <- function(arr) {
    n <- length(arr)
    gap <- floor(n / 2)
    while (gap > 0) {
        for (i in (gap + 1):n) {
            temp <- arr[i]
            j <- i
            while (j > gap && arr[j - gap] > temp) {
                arr[j] <- arr[j - gap]
                j <- j - gap
            }
            arr[j] <- temp
        }
        gap <- floor(gap / 2)
    }
    return(arr)
}
"""
    elif lang_name == "Julia":
        return """function shellsort(arr)
    n = length(arr)
    gap = div(n, 2)
    while gap > 0
        for i in (gap+1):n
            temp = arr[i]
            j = i
            while j > gap && arr[j-gap] > temp
                arr[j] = arr[j-gap]
                j -= gap
            end
            arr[j] = temp
        end
        gap = div(gap, 2)
    end
    return arr
end
"""
    elif lang_name == "Perl":
        return """sub shellsort {
    my @arr = @_;
    my $n = scalar @arr;
    my $gap = int($n / 2);
    while ($gap > 0) {
        for my $i ($gap..$n-1) {
            my $temp = $arr[$i];
            my $j = $i;
            while ($j >= $gap && $arr[$j-$gap] > $temp) {
                $arr[$j] = $arr[$j-$gap];
                $j -= $gap;
            }
            $arr[$j] = $temp;
        }
        $gap = int($gap / 2);
    }
    return @arr;
}
"""
    elif lang_name == "PHP":
        return """<?php
function shellsort(&$arr) {
    $n = count($arr);
    $gap = intval($n / 2);
    while ($gap > 0) {
        for ($i = $gap; $i < $n; $i++) {
            $temp = $arr[$i];
            $j = $i;
            while ($j >= $gap && $arr[$j - $gap] > $temp) {
                $arr[$j] = $arr[$j - $gap];
                $j -= $gap;
            }
            $arr[$j] = $temp;
        }
        $gap = intval($gap / 2);
    }
}
?>
"""
    elif lang_name == "Shell":
        return """#!/bin/bash
shellsort() {
    local arr=("$@")
    local n=${#arr[@]}
    local gap=$((n / 2))
    while ((gap > 0)); do
        for ((i = gap; i < n; i++)); do
            local temp=${arr[$i]}
            local j=$i
            while ((j >= gap && arr[j - gap] > temp)); do
                arr[$j]=${arr[$j - gap]}
                ((j -= gap))
            done
            arr[$j]=$temp
        done
        ((gap /= 2))
    done
    echo "${arr[@]}"
}
"""
    elif lang_name == "Ada":
        return """procedure Shellsort(Arr : in out array of Integer) is
    Gap : Integer := Arr'Length / 2;
    Temp : Integer;
    J : Integer;
begin
    while Gap > 0 loop
        for I in Arr'First + Gap .. Arr'Last loop
            Temp := Arr(I);
            J := I;
            while J >= Arr'First + Gap and then Arr(J - Gap) > Temp loop
                Arr(J) := Arr(J - Gap);
                J := J - Gap;
            end loop;
            Arr(J) := Temp;
        end loop;
        Gap := Gap / 2;
    end loop;
end Shellsort;
"""
    elif lang_name == "Fortran":
        return """subroutine shellsort(arr, n)
    implicit none
    integer :: n, i, j, gap, temp
    integer :: arr(n)

    gap = n / 2
    do while (gap > 0)
        do i = gap + 1, n
            temp = arr(i)
            j = i
            do while (j > gap .and. arr(j - gap) > temp)
                arr(j) = arr(j - gap)
                j = j - gap
            end do
            arr(j) = temp
        end do
        gap = gap / 2
    end do
end subroutine shellsort
"""
    elif lang_name == "COBOL":
        return """IDENTIFICATION DIVISION.
PROGRAM-ID. SHELLSORT.

DATA DIVISION.
WORKING-STORAGE SECTION.
77 N PIC 999.
77 GAP PIC 999.
77 I PIC 999.
77 J PIC 999.
77 TEMP PIC 9(4).
77 ARR PIC 9(4) OCCURS 100 TIMES.

PROCEDURE DIVISION.
    DIVIDE N BY 2 GIVING GAP.
    PERFORM UNTIL GAP = 0.
        PERFORM VARYING I FROM GAP BY 1 UNTIL I > N.
            MOVE ARR(I) TO TEMP.
            MOVE I TO J.
            PERFORM UNTIL J < GAP OR ARR(J - GAP) NOT > TEMP.
                MOVE ARR(J - GAP) TO ARR(J).
                COMPUTE J = J - GAP.
            END-PERFORM.
            MOVE TEMP TO ARR(J).
        END-PERFORM.
        DIVIDE GAP BY 2 GIVING GAP.
    END-PERFORM.
    STOP RUN.
"""
    elif lang_name == "Pascal":
        return """procedure Shellsort(var arr: array of Integer; n: Integer);
var
  gap, i, j, temp: Integer;
begin
  gap := n div 2;
  while gap > 0 do
  begin
    for i := gap to n - 1 do
    begin
      temp := arr[i];
      j := i;
      while (j >= gap) and (arr[j - gap] > temp) do
      begin
        arr[j] := arr[j - gap];
        j := j - gap;
      end;
      arr[j] := temp;
    end;
    gap := gap div 2;
  end;
end;
"""
    elif lang_name == "Delphi":
        return """procedure Shellsort(var arr: array of Integer);
var
  n, gap, i, j, temp: Integer;
begin
  n := Length(arr);
  gap := n div 2;
  while gap > 0 do
  begin
    for i := gap to n - 1 do
    begin
      temp := arr[i];
      j := i;
      while (j >= gap) and (arr[j - gap] > temp) do
      begin
        arr[j] := arr[j - gap];
        j := j - gap;
      end;
      arr[j] := temp;
    end;
    gap := gap div 2;
  end;
end;
"""
    elif lang_name == "BASIC":
        return """SUB Shellsort(arr() AS INTEGER)
    DIM n AS INTEGER, gap AS INTEGER, i AS INTEGER, j AS INTEGER, temp AS INTEGER
    n = UBOUND(arr)
    gap = n / 2
    WHILE gap > 0
        FOR i = gap TO n
            temp = arr(i)
            j = i
            WHILE j >= gap AND arr(j - gap) > temp
                arr(j) = arr(j - gap)
                j = j - gap
            WEND
            arr(j) = temp
        NEXT i
        gap = gap / 2
    WEND
END SUB
"""
    elif lang_name == "Lisp":
        return """(defun shellsort (arr)
    (let* ((n (length arr))
           (gap (floor n 2)))
        (loop while (> gap 0) do
            (loop for i from gap below n do
                (let* ((temp (aref arr i))
                       (j i))
                    (loop while (and (>= j gap) (> (aref arr (- j gap)) temp)) do
                        (setf (aref arr j) (aref arr (- j gap)))
                        (setf j (- j gap)))
                    (setf (aref arr j) temp)))
            (setf gap (floor gap 2)))
        arr))
"""
    elif lang_name == "Common Lisp":
        return """(defun shellsort (arr)
    (let* ((n (length arr))
           (gap (floor n 2)))
        (loop while (> gap 0) do
            (loop for i from gap below n do
                (let ((temp (aref arr i)))
                    (loop for j = i then (- j gap)
                          while (and (>= j gap) (> (aref arr (- j gap)) temp))
                          do (setf (aref arr j) (aref arr (- j gap))))
                    (setf (aref arr j) temp)))
            (setf gap (floor gap 2)))
        arr))
"""
    elif lang_name == "Scheme":
        return """(define (shellsort arr)
    (let ((n (vector-length arr)))
        (define (gap-loop gap)
            (when (> gap 0)
                (define (i-loop i)
                    (when (< i n)
                        (let ((temp (vector-ref arr i)))
                            (define (j-loop j)
                                (when (and (>= j gap)
                                          (> (vector-ref arr (- j gap)) temp))
                                    (vector-set! arr j (vector-ref arr (- j gap)))
                                    (j-loop (- j gap))))
                            (j-loop i)
                            (vector-set! arr i temp)
                            (i-loop (+ i 1)))))
                (i-loop gap)
                (gap-loop (quotient gap 2))))
        (gap-loop (quotient n 2))
        arr))
"""
    elif lang_name == "Racket":
        return """(define (shellsort arr)
    (let ((n (vector-length arr)))
        (let gap-loop ((gap (quotient n 2)))
            (when (> gap 0)
                (let i-loop ((i gap))
                    (when (< i n)
                        (let ((temp (vector-ref arr i)))
                            (let j-loop ((j i))
                                (when (and (>= j gap)
                                          (> (vector-ref arr (- j gap)) temp))
                                    (vector-set! arr j (vector-ref arr (- j gap)))
                                    (j-loop (- j gap))))
                            (vector-set! arr i temp)
                            (i-loop (+ i 1)))))
                (gap-loop (quotient gap 2))))
        arr))
"""
    elif lang_name == "PowerShell":
        return """function Shellsort {
    param([array]$arr)
    $n = $arr.Length
    $gap = [math]::Floor($n / 2)
    while ($gap -gt 0) {
        for ($i = $gap; $i -lt $n; $i++) {
            $temp = $arr[$i]
            $j = $i
            while ($j -ge $gap -and $arr[$j - $gap] -gt $temp) {
                $arr[$j] = $arr[$j - $gap]
                $j -= $gap
            }
            $arr[$j] = $temp
        }
        $gap = [math]::Floor($gap / 2)
    }
    return $arr
}
"""
    elif lang_name == "VB.NET":
        return """Public Shared Sub Shellsort(arr As Integer())
    Dim n As Integer = arr.Length
    Dim gap As Integer = n / 2
    While gap > 0
        For i = gap To n - 1
            Dim temp As Integer = arr(i)
            Dim j As Integer = i
            While j >= gap AndAlso arr(j - gap) > temp
                arr(j) = arr(j - gap)
                j -= gap
            End While
            arr(j) = temp
        Next
        gap = gap / 2
    End While
End Sub
"""
    elif lang_name == "Batch":
        return """@echo off
setlocal enabledelayedexpansion
set n=10
set gap=%n:~0,1%
for /L %%i in (%gap%,1,%n%) do (
    if %%i GEQ %gap% (
        set temp=!arr[%%i]!
        set j=%%i
        for /L %%j in (%j%,-1,0) do (
            if !j! GEQ %gap% (
                if !arr[!j!-!gap!]! GTR !temp! (
                    set arr[!j!]=!arr[!j!-!gap!]!
                    set /a j-=%gap%
                )
            )
        )
        set arr[!j!]=!temp!
    )
)
set /a gap=%gap%/2
"""
    elif lang_name == "MATLAB":
        return """function arr = shellsort(arr)
    n = length(arr);
    gap = floor(n / 2);
    while gap > 0
        for i = gap + 1:n
            temp = arr(i);
            j = i;
            while j > gap && arr(j - gap) > temp
                arr(j) = arr(j - gap);
                j = j - gap;
            end
            arr(j) = temp;
        end
        gap = floor(gap / 2);
    end
end
"""
    else:
        return content

def main():
    with open('/tmp/langs.json', 'r') as f:
        langs = json.load(f)

    output_dir = Path('/Users/mhomsi/personal/code/1homsi/mergesort/shellsort')

    updated = 0
    for entry in langs:
        filename = entry['file']
        filepath = output_dir / filename
        lang_name = entry['name']

        if not filepath.exists():
            continue

        with open(filepath, 'r') as f:
            content = f.read()

        cleaned = clean_implementation(lang_name, content)

        with open(filepath, 'w') as f:
            f.write(cleaned)
        updated += 1

    print(f"Updated: {updated} files")

if __name__ == '__main__':
    main()
