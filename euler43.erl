-module(euler43).
-export([solve/0, check/1, number/3]).

solve() ->
    lists:foldl(fun (X, A) -> number(X, [1,2,3,4,5,6,7,8,9,10], 0) + A end, 0,
                utility:permutations([0,1,2,3,4,5,6,7,8,9], fun check/1)).

number(_, [], N) -> N;
number(L, [H|T], N) -> number(L, T, (N * 10) + lists:nth(H, L)).

check(L) when 10 > length(L) -> true;
check(L) ->
    (number(L, [8,9,10], 0) rem 17 == 0) andalso
    (number(L, [7,8,9], 0) rem 13 == 0) andalso
    (number(L, [6,7,8], 0) rem 11 == 0) andalso
    (number(L, [5,6,7], 0) rem 7 == 0) andalso
    (number(L, [4,5,6], 0) rem 5 == 0) andalso
    (number(L, [3,4,5], 0) rem 3 == 0) andalso
    (number(L, [2,3,4], 0) rem 2 == 0).
