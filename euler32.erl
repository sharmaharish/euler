-module(euler32).
-export([solve/0, include/2, digits/1]).

solve() ->
    Range = lists:seq(1, 10000),
    lists:sum(
      lists:usort([X * Y || X <- Range, Y <- Range, include(X, Y)])).

include(X, Y) ->
    [1,2,3,4,5,6,7,8,9] == lists:sort(digits(X) ++ digits(Y) ++ digits(X * Y)).

digits(Num) ->
    digits(Num, []).

digits(0, Digits) -> Digits;

digits(Num, Digits) ->
    Unit = Num rem 10,
    case Unit of
        0 -> [0];
        _ -> digits(Num div 10, [Unit | Digits])
    end.
