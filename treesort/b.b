nodevals[100];
nodelefts[100];
noderights[100];
nodecount;

newnode(v) {
    ++nodecount;
    nodevals[nodecount] = v;
    nodelefts[nodecount] = 0;
    noderights[nodecount] = 0;
    return(nodecount);
}

insert(idx, v) {
    if (idx == 0) return(newnode(v));
    if (v < nodevals[idx]) {
        nodelefts[idx] = insert(nodelefts[idx], v);
        return(idx);
    }
    noderights[idx] = insert(noderights[idx], v);
    return(idx);
}

inorder(idx) {
    if (idx == 0) return;
    inorder(nodelefts[idx]);
    printf("%d ", nodevals[idx]);
    inorder(noderights[idx]);
}

main() {
    auto arr[7], root, i;
    arr[0]=5; arr[1]=3; arr[2]=7; arr[3]=1;
    arr[4]=4; arr[5]=6; arr[6]=8;
    nodecount = 0;
    root = 0;
    i = 0;
    while (i < 7) {
        root = insert(root, arr[i]);
        i = i + 1;
    }
    inorder(root);
    printf("\n");
}
