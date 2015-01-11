-module(euler31).
-export([solve/0]).

solve() -> count(200, 8).

value(M) ->
    case M of
        1 -> 1;
        2 -> 2;
        3 -> 5;
        4 -> 10;
        5 -> 20;
        6 -> 50;
        7 -> 100;
        8 -> 200
    end.

count(0, _) -> 1;
count(N, _) when N =< 0 -> 0;
count(N, M) when N >= 1, M =< 0 -> 0;
count(N, M) ->
    count(N, M - 1) + count(N - value(M), M).
