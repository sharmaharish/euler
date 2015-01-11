-module(euler29).
-export([solve/0, gen_powers/0, solve2/0, gen_prime_factors/1, factorize/0, factorize/5]).

solve() ->
    length(gen_prime_factors(gen_powers())).

gen_powers() ->
    Range = lists:seq(2, 100, 1),
    [{X, Y} || X <- Range, Y <- Range].

gen_prime_factors(Powers) ->
    {Primes, NonPrimes} = lists:partition(fun({N, _}) -> utility:is_prime(N) end, Powers),
    FactorFun = factorize(),
    NonPrimeFactors = lists:map(FactorFun, NonPrimes),
    lists:usort(lists:map(fun(T) -> [T|[]] end, Primes) ++ NonPrimeFactors).

factorize(1, [P|_], Power, Mult, FactorList) ->
    lists:reverse([{P, Power * Mult} | FactorList]);

factorize(Num, [P|PT], Power, Mult, FactorList) ->
    case Num rem P of
        0 -> factorize(Num div P, [P|PT], Power + 1, Mult, FactorList);
        _ -> case Power of
                 0 -> factorize(Num, PT, Power, Mult, FactorList);
                 _ -> factorize(Num, PT, 0, Mult, [{P, Power * Mult}|FactorList])
             end
    end.

factorize() ->
    Primes = utility:primes_under(100),
    fun ({Num, Power}) ->
            factorize(Num, Primes, 0, Power, [])
    end.

solve2() ->
    Range = lists:seq(2, 100, 1),
    sets:size(sets:from_list([utility:pow(X, Y) || X <- Range, Y <- Range])).
