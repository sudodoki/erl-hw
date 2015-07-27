% HW: rewrite https://github.com/vessi/erlcourses/blob/develop/selective.erl to take care of ranges of priorities without numbers, just by atoms:
% lowest, low, high, highest

% 1> c(priority_selective).
% {ok,selective}
% 2> self() ! {highest, 1}, self() ! {low, 2}, self() ! {lowest, 3}, self() ! {high, 4}, self() ! {low, 5}.
% {low,5}
% 3> process_info(self(), messages).
% {messages,[{highest,1},{low,2},{lowest,3},{high,4},{low,5}]}
% 4> priority_selective:queue().
% [highest,high,low,low,lowest]

-module(priority_selective).
-export([queue/0]).

queue() ->
  helper_queue([highest, high, lowest, low]).

helper_queue([]) -> [];
helper_queue(Priorities) ->
  [Priority|Tail] = Priorities,
  receive
    {Priority, Message} ->
      [{Priority, Message} | helper_queue(Priorities)]
    after 0 ->
      helper_queue(Tail)
  end.
