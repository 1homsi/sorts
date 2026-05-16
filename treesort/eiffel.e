class TREE_SORT

create make

feature
    val: INTEGER
    left: detachable TREE_SORT
    right: detachable TREE_SORT

    make(v: INTEGER)
        do
            val := v
        end

    insert(v: INTEGER)
        do
            if v < val then
                if attached left as l then
                    l.insert(v)
                else
                    create left.make(v)
                end
            else
                if attached right as r then
                    r.insert(v)
                else
                    create right.make(v)
                end
            end
        end

    inorder(result: ARRAY[INTEGER]; idx: INTEGER): INTEGER
        local
            i: INTEGER
        do
            i := idx
            if attached left as l then
                i := l.inorder(result, i)
            end
            result[i] := val
            i := i + 1
            if attached right as r then
                i := r.inorder(result, i)
            end
            Result := i
        end

end

class APPLICATION

create make

feature
    make
        local
            arr: ARRAY[INTEGER]
            root: detachable TREE_SORT
            result: ARRAY[INTEGER]
            i: INTEGER
        do
            arr := <<5, 3, 7, 1, 4, 6, 8>>
            from i := 1 until i > arr.count loop
                if attached root as r then
                    r.insert(arr[i])
                else
                    create root.make(arr[i])
                end
                i := i + 1
            end
            create result.make_filled(0, 1, 7)
            if attached root as r then
                r.inorder(result, 1)
            end
            across result as c loop
                io.put_integer(c.item)
                io.put_character(' ')
            end
            io.new_line
        end
end
