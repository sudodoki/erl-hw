-module(looper).
-export([loop/0]).

loop() ->
  receive
    "beep" ->
      io:format("boop~n"),
      loop();

    "loop" ->
      io:format( "will do another loop ~n"),
      loop();

    _ ->
      io:format("I don't understand.~n"),
      loop();

    die ->
      erlang:error(wanted_me_to_edie);

    terminate ->
      ok.
  end.
