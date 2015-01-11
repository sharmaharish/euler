-module(euler47).
-export([solve/0]).

solve() ->
    find_consecutive(99999).

find_consecutive(N) ->
    AreConsecutive = has_factor_count(N, 4) andalso
        has_factor_count(N + 1, 4) andalso
        has_factor_count(N + 2, 4) andalso
        has_factor_count(N + 3, 4),
    case AreConsecutive of
        true ->
            io:format("~p,~p,~p,~p~n", [N,N+1,N+2,N+3]);
        false ->
            find_consecutive(N+1)
    end.

has_factor_count(N, Count) ->
    Count == factors(N).

next_prime(2) -> 3;
next_prime(N) ->
    case erlang:get({'next_prime', N}) of
        F when is_integer(F) ->
            F;
        'undefined' ->
            F = utility:next_prime(N),
            erlang:put({'next_prime', N}, F),
            F
    end.

factors(N) ->
    factors(N, 0, 2, 0).

factors(1, _, _, FC) -> FC + 1;
factors(N, C, P, FC) ->
    case N rem P == 0 of
        true ->
            factors(N div P, C + 1, P, FC);
        _ ->
            factors(N, 0, next_prime(P), case C == 0 of true -> FC; _ -> FC + 1 end)
    end.
