-module(day_2).
-export([pick/2, totals/1, tick_tac_toe/1]).


pick(Key, List) ->
  X = [ItemValue || {ItemKey, ItemValue} <- List, ItemKey == Key],
  case X of
    [H] -> io:format("~p", [H]);
    [] -> io:format("~p didn't match anything", [Key])
  end.

totals(List) ->
  [{Item, Price * Quantity} || {Item, Price, Quantity} <- List].

% [x,o,o,
%  x,x,o,
%  o,x,o]
tick_tac_toe(Board) ->
  Winner_by_row = fun(Row, Winner) ->
    Still_playing = lists:any(fun(X) -> X == "_" end, Row),
    case Row of
      [x,x,x] -> x;
      [o,o,o] -> o;
      _ when Still_playing -> no_winner;
      _ -> Winner
    end
  end,

  [R11, R12, R13,
   R21, R22, R23,
   R31, R32, R33] = Board,
  lists:foldl(Winner_by_row, cat, [
                                      [R11, R12, R13],
                                      [R21, R22, R23],
                                      [R31, R32, R33],

                                      [R11, R21, R31],
                                      [R12, R22, R32],
                                      [R13, R23, R33],

                                      [R11, R22, R33],
                                      [R31, R22, R13]
                                     ]).

