-module(euler28).
-export([solve/0]).

solve() ->
    solve(3, 1, 1).

solve(Level, LastTerm, Total) when Level < 1002 ->
    Delta = Level - 1,
    solve(Level + 2, LastTerm + 4 * Delta, Total + 4 * LastTerm + 10 * Delta);

solve(_, _, Total) -> Total.
