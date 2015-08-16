-module(looper).
-export([start_link/0]).

start_link() ->
  PID = spawn(fun() -> loop() end),
  % io:format("Starting looper with PID of ~p~n", [PID]),
  register(looper, PID),
  {ok, PID}.

loop() ->
  receive
    "who are you" ->
      io:format("I am ~p~n", [self()]),
      loop();

    "beep" ->
      io:format("boop~n"),
      loop();

    "loop" ->
      io:format( "will do another loop ~n"),
      loop();

    die ->
      erlang:error(wanted_me_to_edie);

    terminate ->
      ok;

    _ ->
      io:format("I don't understand.~n"),
      loop()
  end.
