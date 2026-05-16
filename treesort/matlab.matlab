function result = treesort(arr)
    nodeVal = zeros(1, 1000);
    nodeLeft = zeros(1, 1000);
    nodeRight = zeros(1, 1000);
    nodeCount = 0;
    root = 0;

    function idx = newNode(v)
        nodeCount = nodeCount + 1;
        idx = nodeCount;
        nodeVal(idx) = v;
        nodeLeft(idx) = 0;
        nodeRight(idx) = 0;
    end

    function insertNode(pIdx, v)
        if nodeVal(pIdx) == 0
            nodeVal(pIdx) = v;
        elseif v < nodeVal(pIdx)
            if nodeLeft(pIdx) == 0
                nodeLeft(pIdx) = newNode(v);
            else
                insertNode(nodeLeft(pIdx), v);
            end
        else
            if nodeRight(pIdx) == 0
                nodeRight(pIdx) = newNode(v);
            else
                insertNode(nodeRight(pIdx), v);
            end
        end
    end

    function inorder(idx)
        if idx == 0, return; end
        inorder(nodeLeft(idx));
        result(end+1) = nodeVal(idx);
        inorder(nodeRight(idx));
    end

    result = [];
    root = newNode(arr(1));
    for i = 2:length(arr)
        insertNode(root, arr(i));
    end
    inorder(root);
end

disp(treesort([5 3 7 1 4 6 8]))
