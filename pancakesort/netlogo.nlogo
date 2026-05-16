to pancake-sort
    let arr [5 2 8 1 9 3]
    let n length arr
    let i 0
    
    repeat (n - 1) [
        let j 0
        repeat (n - i - 1) [
            if (item j arr) > (item (j + 1) arr) [
                let temp item j arr
                set arr replace-item j arr (item (j + 1) arr)
                set arr replace-item (j + 1) arr temp
            ]
            set j j + 1
        ]
        set i i + 1
    ]
    
    print "Pancake Sort: " + (word arr)
end

pancake-sort
