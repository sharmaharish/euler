-module(euler50).
-export([solve/0, sum/4]).

solve() ->
    Ps = utility:primes_under(1000000),
    check(Ps, 4).

sum(_, B, E, S) when B > E -> S;
sum(Ps, B, E, S) ->
    Nth = lists:nth(B, Ps),
    sum(Ps, B + 1, E, S + Nth).

check(Ps, N) ->
    Sn = sum(Ps, 4, N, 0),
    case Sn < 1000000 of
        true ->
            case lists:member(Sn, Ps) of
                true ->
                    io:format("{~p,~p},", [N,Sn]);
                false -> ''
            end,
            check(Ps, N + 1);
        false -> done
    end.
