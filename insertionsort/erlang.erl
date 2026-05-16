-module(insertion_sort).
-export([sort/1]).

sort([]) -> [];
sort([H|T]) -> insert(H, sort(T)).

insert(X, []) -> [X];
insert(X, [H|T]) when X =< H -> [X, H | T];
insert(X, [H|T]) -> [H | insert(X, T)].
