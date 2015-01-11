-module(euler37).
-export([solve/0, next_prime/1, is_tprime/1, truncate_rtol/2, truncate_ltor/3]).

solve() ->
    gen_tprimes().

gen_tprimes() ->
    gen_tprimes(7, []).

gen_tprimes(LastPrime, TPrimes) ->
    case length(TPrimes) == 11 of
        true -> TPrimes;
        false ->
            NextPrime = utility:next_prime(LastPrime),
            case is_tprime(NextPrime) of
                true -> gen_tprimes(NextPrime, [NextPrime|TPrimes]);
                false -> gen_tprimes(NextPrime, TPrimes)
            end
    end.

is_tprime(Num) ->
    TruncatedNums = truncate_ltor(Num, utility:digits(Num), []) ++ truncate_rtol(Num, []),
    lists:all(fun utility:is_prime/1, TruncatedNums).

truncate_rtol(Num, NList) ->
    TNum = Num div 10,
    case TNum of
        0 -> NList;
        _ -> truncate_rtol(TNum, [TNum | NList])
    end.

truncate_ltor(Num, [H|T] = _, NList) ->
    TNum = Num - H * utility:pow(10, length(T)),
    case TNum of
        0 -> NList;
        _ -> truncate_ltor(TNum, T, [TNum | NList])
    end.
