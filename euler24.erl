-module(problem24).
-export([solve/0]).

solve() ->
    lists:nth(1000000, perm([0,1,2,3,4,5,6,7,8,9])).

perm([]) -> [[]];
perm(L) -> [[H|T] || H <- L, T <- perm(L -- [H])].
