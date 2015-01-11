-module(euler49).
-export([solve/0, check/2]).

solve() ->
    Ps = utility:primes_between(999, 10000),
    Checker = gen_checker(Ps),
    lists:foreach(Checker, Ps).

gen_checker(Ps) ->
    fun (X) -> check(X, Ps) end.

is_permutation(A, B, C) ->
    Da = lists:sort(utility:digits(A)),
    Db = lists:sort(utility:digits(B)),
    case Da == Db of
        true ->
            Da == lists:sort(utility:digits(C));
        _ -> false
    end.

check(_, []) -> true;
check(P, [H|T]) when P >= H -> check(P, T);
check(P, [H|T] = Ps) ->
    K = H + (H - P),
    case lists:member(K, Ps) andalso is_permutation(P, H, K) of
        true ->
            io:format("~p,~p,~p~n", [P, H, K]),
            check(P, T);
        _ -> check(P, T)
    end.
