-module(euler34).
-export([solve/0, factorial/1, include/1, digits/1]).

solve() ->
    Range = lists:seq(3, 100000, 1),
    [X || X <- Range, include(X)].

factorial(N) -> factorial(N, 1).

factorial(N, P) when N >= 0 ->
    case N of
        0 -> P;
        1 -> P;
        2 -> 2 * P;
        _ -> factorial(N - 1, N * P)
    end.

include(N) ->
    N == lists:sum([factorial(X) || X <- digits(N)]).

digits(Num) ->
    digits(Num, []).

digits(0, Digits) -> Digits;

digits(Num, Digits) ->
    digits(Num div 10, [Num rem 10 | Digits]).
