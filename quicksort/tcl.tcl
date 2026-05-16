proc quicksort {lst} {
    if {[llength $lst] <= 1} { return $lst }
    set pivot [lindex $lst [expr {[llength $lst] / 2}]]
    set left {}
    set middle {}
    set right {}
    foreach x $lst {
        if {$x < $pivot} { lappend left $x }
        elseif {$x == $pivot} { lappend middle $x }
        else { lappend right $x }
    }
    return [concat [quicksort $left] $middle [quicksort $right]]
}

puts [quicksort {3 6 8 10 1 2 1}]
