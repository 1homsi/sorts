#!/usr/bin/env python3
import json
from pathlib import Path

EXTENDED_IMPLEMENTATIONS = {
    "Groovy": """def shellsort(arr) {
    int n = arr.size()
    int gap = n / 2
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            def temp = arr[i]
            int j = i
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
    return arr
}
""",

    "D": """void shellsort(int[] arr) {
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
""",

    "Nim": """proc shellsort(arr: var seq[int]) =
    let n = arr.len
    var gap = n div 2
    while gap > 0:
        for i in gap..<n:
            let temp = arr[i]
            var j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap = gap div 2
""",

    "Crystal": """def shellsort(arr : Array(Int32)) : Array(Int32)
    n = arr.size
    gap = n // 2
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
        gap //= 2
    end
    arr
end
""",

    "Haxe": """public static function shellsort(arr:Array<Int>):Array<Int> {
    var n = arr.length;
    var gap = Std.int(n / 2);
    while (gap > 0) {
        for (i in gap...n) {
            var temp = arr[i];
            var j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap = Std.int(gap / 2);
    }
    return arr;
}
""",

    "CoffeeScript": """shellsort = (arr) ->
    n = arr.length
    gap = Math.floor(n / 2)
    while gap > 0
        i = gap
        while i < n
            temp = arr[i]
            j = i
            while j >= gap and arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
            i++
        gap = Math.floor(gap / 2)
    arr
""",

    "Raku": """sub shellsort(@arr) {
    my $n = @arr.elems;
    my $gap = $n div 2;
    while $gap > 0 {
        for $gap .. $n - 1 -> $i {
            my $temp = @arr[$i];
            my $j = $i;
            while $j >= $gap and @arr[$j - $gap] > $temp {
                @arr[$j] = @arr[$j - $gap];
                $j -= $gap;
            }
            @arr[$j] = $temp;
        }
        $gap = $gap div 2;
    }
    return @arr;
}
""",

    "Objective-C": """- (NSMutableArray *)shellsort:(NSMutableArray *)arr {
    NSInteger n = [arr count];
    NSInteger gap = n / 2;
    while (gap > 0) {
        for (NSInteger i = gap; i < n; i++) {
            id temp = [arr objectAtIndex:i];
            NSInteger j = i;
            while (j >= gap && [[arr objectAtIndex:(j - gap)] compare:temp] == NSOrderedDescending) {
                [arr setObject:[arr objectAtIndex:(j - gap)] atIndex:j];
                j -= gap;
            }
            [arr setObject:temp atIndex:j];
        }
        gap /= 2;
    }
    return arr;
}
""",

    "Zig": """pub fn shellsort(allocator: std.mem.Allocator, arr: []i32) !void {
    var n = arr.len;
    var gap = n / 2;
    while (gap > 0) {
        var i = gap;
        while (i < n) {
            var temp = arr[i];
            var j = i;
            while (j >= gap and arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
            i += 1;
        }
        gap /= 2;
    }
}
""",

    "V": """fn shellsort(mut arr []int) {
    n := arr.len
    mut gap := n / 2
    for gap > 0 {
        for i := gap; i < n; i++ {
            temp := arr[i]
            mut j := i
            for j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
}
""",

    "Ballerina": """function shellsort(int[] arr) returns int[] {
    int n = arr.length();
    int gap = n / 2;
    while (gap > 0) {
        int i = gap;
        while (i < n) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j = j - gap;
            }
            arr[j] = temp;
            i = i + 1;
        }
        gap = gap / 2;
    }
    return arr;
}
""",

    "GDScript": """func shellsort(arr):
    var n = arr.size()
    var gap = n / 2
    while gap > 0:
        for i in range(gap, n):
            var temp = arr[i]
            var j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap /= 2
    return arr
""",

    "Wren": """var shellsort = Fn.new { |arr|
    var n = arr.count
    var gap = (n / 2).floor
    while (gap > 0) {
        var i = gap
        while (i < n) {
            var temp = arr[i]
            var j = i
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap]
                j = j - gap
            }
            arr[j] = temp
            i = i + 1
        }
        gap = (gap / 2).floor
    }
    return arr
}
""",

    "GLSL": """void shellsort(inout float arr[100], int n) {
    int gap = n / 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            float temp = arr[i];
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
""",

    "WebAssembly": """(func $shellsort (param $arr i32) (param $n i32)
    (local $gap i32)
    (local $i i32)
    (local $j i32)
    (local $temp i32)
    (local.set $gap (i32.shr_u (local.get $n) (i32.const 1)))
    (block $break_gap
        (loop $gap_loop
            (br_if $break_gap (i32.le_s (local.get $gap) (i32.const 0)))
            (local.set $i (local.get $gap))
            (block $break_i
                (loop $i_loop
                    (br_if $break_i (i32.ge_s (local.get $i) (local.get $n)))
                    (local.set $temp (i32.load (i32.add (local.get $arr) (i32.mul (local.get $i) (i32.const 4)))))
                    (local.set $j (local.get $i))
                    (block $break_j
                        (loop $j_loop
                            (br_if $break_j (i32.lt_s (local.get $j) (local.get $gap)))
                            (br_if $break_j (i32.le_s (i32.load (i32.add (local.get $arr) (i32.mul (i32.sub (local.get $j) (local.get $gap)) (i32.const 4)))) (local.get $temp)))
                            (i32.store (i32.add (local.get $arr) (i32.mul (local.get $j) (i32.const 4))) (i32.load (i32.add (local.get $arr) (i32.mul (i32.sub (local.get $j) (local.get $gap)) (i32.const 4)))))
                            (local.set $j (i32.sub (local.get $j) (local.get $gap)))
                            (br $j_loop)))
                    (i32.store (i32.add (local.get $arr) (i32.mul (local.get $j) (i32.const 4))) (local.get $temp))
                    (local.set $i (i32.add (local.get $i) (i32.const 1)))
                    (br $i_loop)))
            (local.set $gap (i32.shr_u (local.get $gap) (i32.const 1)))
            (br $gap_loop))))
""",

    "Tcl": """proc shellsort {arr} {
    set n [llength $arr]
    set gap [expr {$n / 2}]
    while {$gap > 0} {
        for {set i $gap} {$i < $n} {incr i} {
            set temp [lindex $arr $i]
            set j $i
            while {$j >= $gap && [lindex $arr [expr {$j - $gap}]] > $temp} {
                lset arr $j [lindex $arr [expr {$j - $gap}]]
                set j [expr {$j - $gap}]
            }
            lset arr $j $temp
        }
        set gap [expr {$gap / 2}]
    }
    return $arr
}
""",

    "Apex": """public class ShellSort {
    public static void shellsort(List<Integer> arr) {
        Integer n = arr.size();
        Integer gap = n / 2;
        while (gap > 0) {
            for (Integer i = gap; i < n; i++) {
                Integer temp = arr.get(i);
                Integer j = i;
                while (j >= gap && arr.get(j - gap) > temp) {
                    arr.set(j, arr.get(j - gap));
                    j -= gap;
                }
                arr.set(j, temp);
            }
            gap /= 2;
        }
    }
}
""",

    "Solidity": """pragma solidity ^0.8.0;

contract ShellSort {
    function shellsort(uint[] memory arr) public returns (uint[] memory) {
        uint n = arr.length;
        uint gap = n / 2;
        while (gap > 0) {
            for (uint i = gap; i < n; i++) {
                uint temp = arr[i];
                uint j = i;
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
            gap /= 2;
        }
        return arr;
    }
}
""",

    "Vyper": """@external
def shellsort(arr: DynArray[uint256, 100]) -> DynArray[uint256, 100]:
    n: uint256 = len(arr)
    gap: uint256 = n / 2
    while gap > 0:
        i: uint256 = gap
        while i < n:
            temp: uint256 = arr[i]
            j: uint256 = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
            i += 1
        gap /= 2
    return arr
""",

    "Cairo": """func shellsort(arr: felt*, n: felt) {
    let gap = n / 2;
    loop_gap(arr, n, gap);
    return ();
}

func loop_gap(arr: felt*, n: felt, gap: felt) {
    if (gap == 0) {
        return ();
    }
    loop_i(arr, gap, n, gap);
    return loop_gap(arr, n, gap / 2);
}

func loop_i(arr: felt*, i: felt, n: felt, gap: felt) {
    if (i >= n) {
        return ();
    }
    let temp = arr[i];
    loop_j(arr, i, gap, temp);
    return loop_i(arr, i + 1, n, gap);
}

func loop_j(arr: felt*, j: felt, gap: felt, temp: felt) {
    if (j < gap) {
        arr[j] = temp;
        return ();
    }
    if (arr[j - gap] <= temp) {
        arr[j] = temp;
        return ();
    }
    arr[j] = arr[j - gap];
    return loop_j(arr, j - gap, gap, temp);
}
""",

    "Mojo": """fn shellsort(inout arr: DynamicVector[Int]) -> None:
    let n = len(arr)
    var gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            let temp = arr[i]
            var j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap //= 2
""",

    "Gleam": """import list

pub fn shellsort(arr: List(Int)) -> List(Int) {
    let n = list.length(arr)
    let gap = n / 2
    gap_loop(arr, gap, n)
}

fn gap_loop(arr: List(Int), gap: Int, n: Int) -> List(Int) {
    case gap {
        0 -> arr
        _ -> {
            let new_arr = i_loop(arr, gap, n, gap)
            gap_loop(new_arr, gap / 2, n)
        }
    }
}

fn i_loop(arr: List(Int), i: Int, n: Int, gap: Int) -> List(Int) {
    case i >= n {
        True -> arr
        False -> {
            let temp = list.index(arr, i)
            let new_arr = j_loop(arr, i, gap, temp)
            i_loop(new_arr, i + 1, n, gap)
        }
    }
}

fn j_loop(arr: List(Int), j: Int, gap: Int, temp: Int) -> List(Int) {
    case j < gap || list.index(arr, j - gap) <= temp {
        True -> list.index_map(arr, fn(idx, _) {
            case idx == j { True -> temp False -> list.index(arr, idx) }
        })
        False -> {
            let new_arr = list.index_map(arr, fn(idx, _) {
                case idx == j { True -> list.index(arr, j - gap) False -> list.index(arr, idx) }
            })
            j_loop(new_arr, j - gap, gap, temp)
        }
    }
}
""",

    "Grain": """export let shellsort = (arr: Array<Int32>) => {
    let n = Array.length(arr);
    let mut gap = n / 2;
    while (gap > 0) {
        for (let mut i = gap; i < n; i += 1) {
            let temp = arr[i];
            let mut j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
    arr;
};
""",

    "Markdown": """# Shellsort Algorithm

Shellsort is a generalization of insertion sort with a decreasing gap sequence.

## Algorithm
- Start with gap = n/2
- For each gap, perform insertion sort
- Halve gap until it becomes 0
""",

    "JSON": """{
    "algorithm": "shellsort",
    "type": "sorting",
    "description": "Shell sort with gap = n/2 halving",
    "complexity": "O(n^1.5)",
    "stable": false,
    "implementation": "gap-based insertion sort"
}
""",

    "XML": """<?xml version="1.0"?>
<shellsort>
    <algorithm>Shellsort</algorithm>
    <gapSequence>n/2, n/4, ..., 1</gapSequence>
    <timeComplexity>O(n^1.5)</timeComplexity>
    <spaceComplexity>O(1)</spaceComplexity>
    <stable>false</stable>
</shellsort>
""",

    "YAML": """algorithm: shellsort
type: sorting
complexity:
    time: O(n^1.5)
    space: O(1)
gapSequence:
    start: n/2
    operation: halve
stable: false
description: Insertion sort with decreasing gap sequence
""",

    "TOML": """[algorithm]
name = "shellsort"
type = "comparison_sort"

[complexity]
time = "O(n^1.5)"
space = "O(1)"
stable = false

[sequence]
start = "n/2"
operation = "halve"
until = 0
""",

    "INI": """[Shellsort]
algorithm=shellsort
type=sorting
complexity=O(n^1.5)
space=O(1)
stable=false
gap_start=n/2
gap_operation=halve
""",

    "Properties": """algorithm.name=shellsort
algorithm.type=sorting
complexity.time=O(n^1.5)
complexity.space=O(1)
stable=false
gap.initial=n/2
gap.operation=divide_by_2
""",

    "Environment Variables": """ALGORITHM=shellsort
ALGORITHM_TYPE=sorting
TIME_COMPLEXITY=O(n^1.5)
SPACE_COMPLEXITY=O(1)
IS_STABLE=false
GAP_SEQUENCE=n/2,n/4,...,1
""",
}

def main():
    with open('/tmp/langs.json', 'r') as f:
        langs = json.load(f)

    output_dir = Path('/Users/mhomsi/personal/code/1homsi/mergesort/shellsort')

    created = 0
    skipped = 0

    for entry in langs:
        filename = entry['file']
        filepath = output_dir / filename
        lang_name = entry['name']

        if filepath.exists():
            skipped += 1
            continue

        if lang_name in EXTENDED_IMPLEMENTATIONS:
            impl = EXTENDED_IMPLEMENTATIONS[lang_name]
        else:
            impl = """def shellsort(arr):
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

        try:
            with open(filepath, 'w') as f:
                f.write(impl)
            created += 1
        except Exception as e:
            print(f"Error creating {filename}: {e}")

    print(f"Extended - Created: {created}, Skipped: {skipped}")

if __name__ == '__main__':
    main()
