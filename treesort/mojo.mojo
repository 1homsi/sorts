from python import Python

struct Node:
    var val: Int
    var left: Int
    var right: Int

    fn __init__(inout self, v: Int):
        self.val = v
        self.left = 0
        self.right = 0

fn treesort(arr: PythonObject) -> PythonObject:
    var py = Python.import_module("builtins")
    var nodes = py.list()
    nodes.append(py.None)
    var root = 0

    @parameter
    fn insert(idx: Int, v: Int) -> Int:
        if idx == 0:
            nodes.append(py.dict())
            var nidx = py.len(nodes).__index__() - 1
            nodes[nidx]["val"] = v
            nodes[nidx]["left"] = 0
            nodes[nidx]["right"] = 0
            return nidx
        var node = nodes[idx]
        if v < int(node["val"]):
            node["left"] = insert(int(node["left"]), v)
        else:
            node["right"] = insert(int(node["right"]), v)
        return idx

    var result = py.list()

    @parameter
    fn inorder(idx: Int):
        if idx == 0:
            return
        var node = nodes[idx]
        inorder(int(node["left"]))
        result.append(node["val"])
        inorder(int(node["right"]))

    for v in arr:
        root = insert(root, int(v))
    inorder(root)
    return result

fn main():
    var py = Python.import_module("builtins")
    var arr = py.list([5, 3, 7, 1, 4, 6, 8])
    print(treesort(arr))
