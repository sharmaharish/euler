-module(euler38).
-export([solve/0, conc_prod/2]).

solve() ->
    solve(9, 9999, [1,2,3,4,5], utility:digits(123456789)).

solve(Start, End, _, Max) when Start == End -> Max;
solve(Start, End, MList, Max) ->
    ConcProd = conc_prod(Start, MList),
    case is_pandigital(ConcProd) andalso ConcProd > Max of
        true ->
            io:format("~p,~p~n",[Start, ConcProd]),
            solve(Start + 1, End, MList, ConcProd);
        false -> solve(Start + 1, End, MList, Max)
    end.

conc_prod(Num, Multipliers) ->
    conc_prod(Num, Multipliers, []).

conc_prod(_, [], Prod) -> Prod;
conc_prod(Num, [H|T], Prod) ->
    NProd = Prod ++ utility:digits(Num * H),
    case length(NProd) >= 9 of
        true -> NProd;
        false -> conc_prod(Num, T, NProd)
    end.

is_pandigital(Num) ->
    length(Num) == 9 andalso
        lists:sort(Num) == [1,2,3,4,5,6,7,8,9].
