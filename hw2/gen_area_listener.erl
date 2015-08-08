-module(gen_area_listener).
-export([behaviour_info/1, init/1]).

behaviour_info(callbacks) ->
  [
    {compute_area, 1}
  ];

behaviour_info(_Other) ->
  undefined.

init(Mod) ->
  spawn(fun() -> loop(Mod) end).

output(Figure, Result) ->
  io:format("Received figure ~p and area is ~p~n", [Figure, Result]).

loop(Mod) ->
  receive
    terminate ->
      ok;
    Figure ->
      output(Figure, Mod:compute_area(Figure)),
      loop(Mod)
  end.
