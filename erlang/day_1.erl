-module(day_1).
-export([factorial/1]).
-export([wc/1]).
-export([count_to_ten/0]).
-export([success_or_not/1]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

wc([]) -> 0;
wc([First, 32 | T]) when First > 32 -> 1 + wc(T);
wc([_ | []]) -> 1 + wc([]);
wc([_ | T]) -> wc(T).

count_to_ten() ->
  count_to_ten_(1).
count_to_ten_(10) -> io:write(10);
count_to_ten_(N) when N =< 10 ->
  io:write(N),io:nl(),
  count_to_ten_(N + 1).


success_or_not(success) -> success;
success_or_not({error, Message}) -> "error: " ++  Message.
