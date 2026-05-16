var<private> nodeVal: array<i32, 64>;
var<private> nodeLeft: array<i32, 64>;
var<private> nodeRight: array<i32, 64>;
var<private> nodeCount: i32 = 0;
var<private> root: i32 = 0;

fn newNode(v: i32) -> i32 {
    nodeCount = nodeCount + 1;
    nodeVal[nodeCount] = v;
    nodeLeft[nodeCount] = 0;
    nodeRight[nodeCount] = 0;
    return nodeCount;
}

fn insertNode(start: i32, v: i32) {
    var idx = start;
    loop {
        if v < nodeVal[idx] {
            if nodeLeft[idx] == 0 { nodeLeft[idx] = newNode(v); break; }
            idx = nodeLeft[idx];
        } else {
            if nodeRight[idx] == 0 { nodeRight[idx] = newNode(v); break; }
            idx = nodeRight[idx];
        }
    }
}

var<private> stk: array<i32, 64>;
var<private> stkTop: i32 = 0;
var<private> resArr: array<i32, 64>;
var<private> resIdx: i32 = 0;

fn inorderTraversal() {
    var cur = root;
    loop {
        if cur == 0 && stkTop == 0 { break; }
        loop {
            if cur == 0 { break; }
            stk[stkTop] = cur; stkTop = stkTop + 1;
            cur = nodeLeft[cur];
        }
        stkTop = stkTop - 1; cur = stk[stkTop];
        resArr[resIdx] = nodeVal[cur]; resIdx = resIdx + 1;
        cur = nodeRight[cur];
    }
}

@compute @workgroup_size(1)
fn main() {
    let arr = array<i32,7>(5, 3, 7, 1, 4, 6, 8);
    root = newNode(arr[0]);
    for (var i = 1; i < 7; i++) { insertNode(root, arr[i]); }
    inorderTraversal();
}
