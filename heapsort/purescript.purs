module Heapsort where

import Prelude
import Data.Array (length, unsafeIndex, modifyAt)
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Console (logShow)

swap :: forall a. Array a -> Int -> Int -> Array a
swap arr i j =
  let vi = unsafeIndex arr i
      vj = unsafeIndex arr j
  in fromMaybe arr (modifyAt i (const vj) arr >>= modifyAt j (const vi))

heapify :: Array Int -> Int -> Int -> Array Int
heapify arr n i =
  let left = 2 * i + 1
      right = 2 * i + 2
      largest0 = if left < n && unsafeIndex arr left > unsafeIndex arr i then left else i
      largest = if right < n && unsafeIndex arr right > unsafeIndex arr largest0 then right else largest0
  in if largest /= i
     then heapify (swap arr i largest) n largest
     else arr

heapsort :: Array Int -> Array Int
heapsort arr =
  let n = length arr
      buildHeap a k = if k < 0 then a else buildHeap (heapify a n k) (k - 1)
      heap = buildHeap arr (n / 2 - 1)
      sortStep a k = if k <= 0 then a else sortStep (heapify (swap a 0 k) k 0) (k - 1)
  in sortStep heap (n - 1)

main :: Effect Unit
main = logShow $ heapsort [12, 11, 13, 5, 6, 7]
