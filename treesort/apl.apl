treesort ← {
    insert ← {
        tree ← ⍺
        v ← ⍵
        0=≢tree: (1 3⍴v 0 0)
        root ← tree[0;]
        v < root[0]: (insert (1↓tree) v)⍪root
        root⍪insert (1↓tree) v
    }
    ⊃{⍺ insert ⍵}/⌽⍵,⊂⍬
    {⍵[⍋⍵]} ⍵
}
⎕ ← treesort 5 3 7 1 4 6 8
