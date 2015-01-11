-module(euler35).
-export([solve/0, circular/1]).

solve() ->
    [X || X <- utility:primes_under(1000000), circular(X)].

circular(P) when P < 10 -> true;
circular(P) ->
    Digits = utility:digits(P),
    case lists:any(fun utility:is_even/1, Digits) of
        true -> false;
        false -> lists:all(fun utility:is_prime/1, rotate(P, length(Digits)))
    end.

rotate(Num, Len) ->
    rotate(Num, Len, 1, [Num]).

rotate(Num, Len, Cnt, NumList) ->
    case Cnt < Len of
        true ->
            RNum = (Num div 10) + utility:pow(10, Len - 1) * (Num rem 10),
            rotate(RNum, Len, Cnt + 1, [RNum | NumList]);
        false -> NumList
    end.
