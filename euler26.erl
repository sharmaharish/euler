-module(euler26).
-export([solve/0]).

solve() ->
    P = [X || X <- utility:primes_under(1000)],
    lists:max([fraction_length(X) || X <- P]).

fraction_length(P) ->
    fraction_length(P, 1).

fraction_length(P, N) when N < P ->
    E = utility:pow(10, N),
    case E rem P of
        1 -> N;
        _ -> fraction_length(P, N + 1)
    end;

fraction_length(_, N) -> N.
