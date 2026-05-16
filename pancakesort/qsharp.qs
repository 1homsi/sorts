namespace PancakeSort {
    import Microsoft.Quantum.Diagnostics.DumpRegister;
    
    operation PancakeSortDemo() : Unit {
        let arr = [5, 2, 8, 1, 9, 3];
        Message($"Pancake Sort: {arr}");
    }
}
