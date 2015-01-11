-module(euler25).
-export([solve/0, pow/2]).

solve() ->
    fib(1, 1, 2, utility:pow(10, 999)).

fib(A, B, T, C) ->
    NB = A + B,
    if NB > C -> {T + 1, NB};
       true -> fib(B, NB, T + 1, C)
    end.
