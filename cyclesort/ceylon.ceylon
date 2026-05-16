shared void run() {
    value arr = arrayOfSize(5, 0);
    arr.set(0, 5); arr.set(1, 4); arr.set(2, 3); arr.set(3, 2); arr.set(4, 1);
    value n = 5;
    variable value writes = 0;
    for (cycleStart in 0:n-1) {
        variable value item = arr.get(cycleStart) else 0;
        variable value pos = cycleStart;
        for (i in cycleStart+1:n-cycleStart-1) {
            if ((arr.get(i) else 0) < item) {
                pos++;
            }
        }
        if (pos != cycleStart) {
            while ((arr.get(pos) else 0) == item) { pos++; }
            value tmp = arr.get(pos) else 0;
            arr.set(pos, item);
            item = tmp;
            writes++;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (i in cycleStart+1:n-cycleStart-1) {
                    if ((arr.get(i) else 0) < item) { pos++; }
                }
                while ((arr.get(pos) else 0) == item) { pos++; }
                value t = arr.get(pos) else 0;
                arr.set(pos, item);
                item = t;
                writes++;
            }
        }
    }
    for (i in 0:n) {
        process.write((arr.get(i) else 0).string + " ");
    }
    print("");
}
