module Heapsort exposing (main)

import Array exposing (Array, get, set, length)
import Browser
import Html exposing (text)

heapify : Array Int -> Int -> Int -> Array Int
heapify arr n i =
    let
        left = 2 * i + 1
        right = 2 * i + 2
        va = Maybe.withDefault 0 (get i arr)
        vl = Maybe.withDefault 0 (get left arr)
        vr = Maybe.withDefault 0 (get right arr)
        largest0 = if left < n && vl > va then left else i
        vlargest0 = Maybe.withDefault 0 (get largest0 arr)
        largest = if right < n && vr > vlargest0 then right else largest0
    in
    if largest /= i then
        let
            vi = Maybe.withDefault 0 (get i arr)
            vl2 = Maybe.withDefault 0 (get largest arr)
            arr2 = set i vl2 arr |> set largest vi
        in
        heapify arr2 n largest
    else
        arr

heapsort : Array Int -> Array Int
heapsort arr =
    let
        n = length arr
        buildHeap a k = if k < 0 then a else buildHeap (heapify a n k) (k - 1)
        heap = buildHeap arr (n // 2 - 1)
        sortStep a k =
            if k <= 0 then a
            else
                let
                    v0 = Maybe.withDefault 0 (get 0 a)
                    vk = Maybe.withDefault 0 (get k a)
                    a2 = set 0 vk a |> set k v0
                in
                sortStep (heapify a2 k 0) (k - 1)
    in
    sortStep heap (n - 1)

main =
    text (Debug.toString (heapsort (Array.fromList [12, 11, 13, 5, 6, 7])))
