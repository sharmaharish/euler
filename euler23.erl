-module(problem23).
-export([solve/0, sum_of_nonabundants/2,abundant_numbers/2,factors/1,combine/2]).

%%% todo: try splitting the number ranges and solving it in parallel
solve() ->
    sum_of_nonabundants(1, 28123).

%%% find sum of non abundant numbers
sum_of_nonabundants(F, T) ->
    AN = abundant_numbers(F, T),
    US = combine(AN, []),
    sum_of_nonabundants(F, 0, US).

sum_of_nonabundants(N, S, L) when N =< 28123, N > 0 ->
    [H|T] = L,
    case H == N of
        true -> sum_of_nonabundants(N + 1, S, T);
        false -> sum_of_nonabundants(N + 1, S + N, L)
    end;

sum_of_nonabundants(_, S, _) -> S.

%%% abundant_numbers(1, 28)
%%% [12,18,20,24]
abundant_numbers(SN, EN) ->
    Pred = fun(Y) -> lists:sum(factors(Y)) > Y end,
    [X || X <- lists:seq(SN, EN), Pred(X)].

%%% factors(28)
%%% [1,2,4,7,14]
factors(N) ->
    Pred = fun(Y) -> (N rem Y) == 0 end,
    [X || X <- lists:seq(1, (N div 2)), Pred(X)].

%%% combine([1,2,3], [])
%%% [1+1,1+2,1+3,2+2,2+3,3+3]
combine([H|T], A) ->
    combine(T, [H + X || X <- [H|T]] ++ A);

combine([], A) -> lists:usort(A).
