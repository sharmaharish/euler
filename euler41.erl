-module(euler41).
-export([solve/0, is_pandigital/1, largest_pandigital_prime/2]).

solve() ->
    largest_pandigital_prime(7654321, 2143).

largest_pandigital_prime(LastPrime, Max) ->
    NextPrime = utility:next_prime(LastPrime, -2),
%    io:format("~p,~p~n",[LastPrime, NextPrime]),
    case is_pandigital(NextPrime) of
        true -> NextPrime;
        false -> largest_pandigital_prime(NextPrime, Max)
    end.

is_pandigital(Prime) ->
    D = utility:digits(Prime),
    case length(D) of
        9 -> [1,2,3,4,5,6,7,8,9] == lists:sort(D);
        8 -> [1,2,3,4,5,6,7,8] == lists:sort(D);
        7 -> [1,2,3,4,5,6,7] == lists:sort(D);
        6 -> [1,2,3,4,5,6] == lists:sort(D);
        5 -> [1,2,3,4,5] == lists:sort(D);
        4 -> [1,2,3,4] == lists:sort(D);
        3 -> [1,2,3] == lists:sort(D);
        2 -> [1,2] == lists:sort(D);
        1 -> false
    end.
