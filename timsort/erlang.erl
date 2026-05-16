-module(erlang).
-export([timsort/1]).

-define(MIN_RUN, 32).

insertion_sort([]) -> [];
insertion_sort([H|T]) -> insert(H, insertion_sort(T)).

insert(X, []) -> [X];
insert(X, [H|T]) when X =< H -> [X, H | T];
insert(X, [H|T]) -> [H | insert(X, T)].

merge([], Ys) -> Ys;
merge(Xs, []) -> Xs;
merge([X|Xs], [Y|Ys]) when X =< Y -> [X | merge(Xs, [Y|Ys])];
merge([X|Xs], [Y|Ys]) -> [Y | merge([X|Xs], Ys)].

chunks(_, []) -> [];
chunks(N, Xs) ->
    {Chunk, Rest} = lists:split(min(N, length(Xs)), Xs),
    [Chunk | chunks(N, Rest)].

merge_pairs([]) -> [];
merge_pairs([X]) -> [X];
merge_pairs([X, Y | Rest]) -> [merge(X, Y) | merge_pairs(Rest)].

merge_all([X]) -> X;
merge_all(Xs) -> merge_all(merge_pairs(Xs)).

timsort([]) -> [];
timsort(Xs) ->
    Runs = [insertion_sort(C) || C <- chunks(?MIN_RUN, Xs)],
    merge_all(Runs).
