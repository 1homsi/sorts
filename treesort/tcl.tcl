proc insert {node val} {
    if {$node eq ""} {
        return [list $val "" ""]
    }
    lassign $node v left right
    if {$val < $v} {
        return [list $v [insert $left $val] $right]
    } else {
        return [list $v $left [insert $right $val]]
    }
}

proc inorder {node result_var} {
    upvar $result_var result
    if {$node eq ""} return
    lassign $node v left right
    inorder $left result
    lappend result $v
    inorder $right result
}

proc treesort {arr} {
    set tree ""
    foreach val $arr {
        set tree [insert $tree $val]
    }
    set result {}
    inorder $tree result
    return $result
}

puts [treesort {5 3 7 1 4 6 8}]
