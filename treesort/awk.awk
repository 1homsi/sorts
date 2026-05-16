BEGIN {
    split("5 3 7 1 4 6 8", arr, " ")
    nodeCount = 0
    root = 0
    for (i = 1; i <= 7; i++) {
        v = arr[i]
        if (root == 0) {
            nodeCount++
            root = nodeCount
            val[root] = v
            left[root] = 0
            right[root] = 0
        } else {
            cur = root
            while (1) {
                if (v < val[cur]) {
                    if (left[cur] == 0) {
                        nodeCount++
                        left[cur] = nodeCount
                        val[nodeCount] = v
                        left[nodeCount] = 0
                        right[nodeCount] = 0
                        break
                    } else {
                        cur = left[cur]
                    }
                } else {
                    if (right[cur] == 0) {
                        nodeCount++
                        right[cur] = nodeCount
                        val[nodeCount] = v
                        left[nodeCount] = 0
                        right[nodeCount] = 0
                        break
                    } else {
                        cur = right[cur]
                    }
                }
            }
        }
    }
    inorder(root)
    print ""
}

function inorder(idx) {
    if (idx == 0) return
    inorder(left[idx])
    printf "%d ", val[idx]
    inorder(right[idx])
}
