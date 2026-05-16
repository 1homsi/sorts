using System;
using System.Collections.Generic;

class Node {
    public int Val;
    public Node Left, Right;
    public Node(int val) { Val = val; }
}

class TreeSort {
    static Node Insert(Node node, int val) {
        if (node == null) return new Node(val);
        if (val < node.Val) node.Left = Insert(node.Left, val);
        else node.Right = Insert(node.Right, val);
        return node;
    }

    static void Inorder(Node node, List<int> result) {
        if (node == null) return;
        Inorder(node.Left, result);
        result.Add(node.Val);
        Inorder(node.Right, result);
    }

    static List<int> Sort(int[] arr) {
        Node root = null;
        foreach (int val in arr) root = Insert(root, val);
        var result = new List<int>();
        Inorder(root, result);
        return result;
    }

    static void Main() {
        var sorted = Sort(new int[]{5, 3, 7, 1, 4, 6, 8});
        Console.WriteLine(string.Join(" ", sorted));
    }
}
