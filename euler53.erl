-module(euler53).
-export([main/0]).

factorial(N) ->
    factorial(N, 1).

factorial(N, F) when N < 2 -> F;
factorial(N, F) ->
    factorial(N - 1, F * N).

filter([R, N]) ->
    1000000 < factorial(N) / (factorial(N - R) * factorial(R)).

main() ->
    Cn = utility:combinations(2, lists:seq(1, 100)),
    lists:filtermap(fun filter/1, Cn).
