-module(euler27).
-export([solve/0]).

solve() -> max_of([count_primes(X) || X <- gen_ce(1, 41, -1)]).

gen_ce(A, B, D) -> gen_ce(A, B, D, D, []).

gen_ce(A, B, D, DU, CE) when abs(A) < 1000, abs(B) < 1000 ->
    gen_ce(1 + D * 2, 41 + D * D + D, D + DU, DU, [{A, B} | CE]);

gen_ce(_, _, _, _, CE) -> CE.

max_of(PC) -> max_of(PC, {40, 1, 41}).

max_of([], M) -> M;
max_of([H|T], M) ->
    case element(1, H) > element(1, M) of
        true -> max_of(T, H);
        false -> max_of(T, M)
    end.

count_primes({A, B}) -> count_primes(A, B, 0).

count_primes(A, B, N) when abs(A) < 1000, abs(B) < 1000 ->
    case utility:is_prime(N * N + A * N + B) of
        true -> count_primes(A, B, N + 1);
        false -> {N, A * B}
    end;

count_primes(A, B, _) -> {0, A * B}.
