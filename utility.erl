-module(utility).
-export([pow/2,
         primes_under/1,
         primes_between/2,
         is_prime/1,
         next_prime/1,
         permutations/2,
         combinations/2,
         digits/1,
         is_even/1,
         is_odd/1]).

%% todos:
%% - fix primes_between
%% - add prev_prime
%% - add generalised permutations
%% - add generalized combinations
%%
pow(X, Y) ->
    pow(X, 1, Y).

pow(_, R, 0) -> R;
pow(X, R, Y) -> pow(X, R * X, Y - 1).

primes_under(N) ->
    primes_under(N, []).

primes_under(N, LP) ->
    Next = prev_prime(N),
    case Next > 2  of
        true -> primes_under(Next, [Next | LP]);
        false -> [2|LP]
    end.

primes_between(Lo, Hi) ->
    primes_between(lists:max([1, Lo]), Hi, []).

primes_between(Lo, Hi, LP) ->
    Next = next_prime(Lo),
    case Next >= Hi of
        true -> lists:reverse(LP);
        false -> primes_between(Next, Hi, [Next|LP])
    end.

is_prime(N) when N > 1 ->
    is_prime(2, trunc(math:sqrt(N)), N);
is_prime(_) ->
    false.

is_prime(D, E, _) when D > E -> true;
is_prime(D, E, N) ->
    case N rem D of
        0 -> false;
        _ -> is_prime(case D of 2 -> 3; _ -> D + 2 end, E, N)
    end.

digits(Num) ->
    digits(Num, []).

digits(0, Digits) -> Digits;
digits(Num, Digits) ->
    digits(Num div 10, [Num rem 10 | Digits]).

is_even(N) -> N rem 2 == 0.
is_odd(N) -> not is_even(N).

next_prime(Num) ->
    case Num of
        1 -> 2;
        2 -> 3;
        _ ->
            Next = Num + case Num rem 2 == 0 of true -> 1; _ -> 2 end,
            case utility:is_prime(Next) of
                true -> Next;
                _ -> next_prime(Next)
            end
    end.

prev_prime(Num) ->
    case Num of
        3 -> 2;
        _ ->
            Next = Num + case Num rem 2 == 0 of true -> -1; _ -> -2 end,
            case utility:is_prime(Next) of
                true -> Next;
                _ -> prev_prime(Next)
            end
    end.


permutations([], _) -> [[]];
permutations(L, Filter) ->
    [[H|T] || H <- L, T <- permutations(L--[H], Filter), Filter([H|T])].

combinations(0, _) -> [[]];
combinations(_, []) -> [];
combinations(M, [H|T]) ->
    [[H|L] || L <- combinations(M - 1, T)] ++ combinations(M, T).
