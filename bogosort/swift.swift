import Foundation

func bogosort(_ arr: inout [Int]) {
    while !arr.enumerated().allSatisfy({ $0.offset == 0 || arr[$0.offset - 1] <= $0.element }) {
        arr.shuffle()
    }
}
