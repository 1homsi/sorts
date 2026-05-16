theory GnomeSort
imports Main

begin

fun gnome_loop :: "int list \<Rightarrow> nat \<Rightarrow> int list" where
  "gnome_loop arr i =
    (if i \<ge> length arr then arr
     else if i = 0 \<or> arr ! i \<ge> arr ! (i - 1) then gnome_loop arr (i + 1)
     else
        let arr' = arr[i := arr!(i-1), i-1 := arr!i]
        in gnome_loop arr' (i - 1))"

definition gnome_sort :: "int list \<Rightarrow> int list" where
  "gnome_sort arr = gnome_loop arr 0"

end
