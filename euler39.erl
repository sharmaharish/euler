-module(euler39).
-export([solve/0]).

solve() ->
    Filter1 = fun(A,B,C) -> A < B andalso B < C andalso (A+B+C) =< 1000 end,
    Filter2 = fun(A,B,C) -> A * A + B * B == C * C end,
    Range = lists:seq(1, 500),
    Triples = [{A+B+C} || A<-Range, B<-Range, C<-Range, Filter1(A,B,C), Filter2(A,B,C)],
    most_frequent(Triples).

most_frequent(Triples) ->
    Frequencies = most_frequent(Triples, dict:new()),
    dict:fold(fun(Key, Val, {P,F}) ->
                      case Val > F of
                          true -> {Key, Val};
                          false -> {P,F}
                      end
              end, {120, 3}, Frequencies).

most_frequent([], Dict) -> Dict;
most_frequent([H|T], Dict) -> most_frequent(T, dict:update_counter(H, 1, Dict)).
