-module(euler45).
-export([solve/0]).

solve() ->
    next(144).

next(N) ->
    H = hexagonal(N),
    M = pentagonal_exists(N) andalso
        triangular_exists(N),
    case M of
        true -> {N, H};
        false -> next(N + 1)
    end.

hexagonal(N) -> N * (2 * N - 1).

triangular_exists(N) ->
    B = (2 * N + 1),
    C = (3 * N) * (1 - N),
    R = (math:sqrt(B * B - (4 * C)) - B),
    trunc(R) div 2 == R / 2.

pentagonal_exists(N) ->
    B = (6 * N - 1),
    C = N * (1 - N),
    R = (math:sqrt(B * B - (4 * 3 * C)) - B),
    trunc(R) div 6 == R / 6.
