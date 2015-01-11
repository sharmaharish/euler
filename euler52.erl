-module(euler52).
-export([solve/0]).

solve() ->
    impl(2).

impl(N) ->
    Ds = lists:sort(utility:digits(2 * N)),
    Same = Ds == lists:sort(utility:digits(3 * N)) andalso
        Ds == lists:sort(utility:digits(4 * N)) andalso
        Ds == lists:sort(utility:digits(5 * N)) andalso
        Ds == lists:sort(utility:digits(6 * N)),
    case Same of
        true -> io:format("~p~n", [N]);
        _ -> impl(N + 1)
    end.
