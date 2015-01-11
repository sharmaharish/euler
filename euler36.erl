-module(euler36).
-export([solve/0]).

solve() ->
    [X || X <- lists:seq(1, 1000000), is_palindrome(X)].

is_palindrome(N) ->
    Base_10 = integer_to_list(N, 10),
    case Base_10 == lists:reverse(Base_10) of
        true ->
            Base_2 = integer_to_list(N, 2),
            Base_2 == lists:reverse(Base_2);
        false -> false
    end.
