-module(erlang).
-export([treesort/1]).

insert(nil, V) -> {node, nil, V, nil};
insert({node, L, X, R}, V) when V < X -> {node, insert(L, V), X, R};
insert({node, L, X, R}, _V) -> {node, L, X, insert(R, _V)}.

inorder(nil) -> [];
inorder({node, L, V, R}) -> inorder(L) ++ [V] ++ inorder(R).

treesort(Arr) ->
    Tree = lists:foldl(fun(V, T) -> insert(T, V) end, nil, Arr),
    inorder(Tree).
