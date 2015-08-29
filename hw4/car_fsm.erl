% c(car_fsm).
% {ok, Pid} = car_fsm:start_link().
% car_fsm:start().
% car_fsm:stop().
-module(car_fsm).
-behaviour(gen_fsm).
-export([start_link/0, init/1, start/0, stop/0, stopped/2, starting/2, running/2]).

% -- public API
start() ->
  gen_fsm:send_event({global, car_fsm}, start).

stop() ->
  gen_fsm:send_event({global, car_fsm}, stop).

% -- states

stopped(start, _State) ->
  io:format('You turn on ignition'),
  % dunno, why this won't work w/o 1 ms timeout
  {next_state, starting, [], 1}.

starting(_, _State) ->
  io:format('Engine is starting up~n'),
  {next_state, running, [], 1000}.

running(timeout, _State) ->
  io:format('You hear engine purring~n'),
  {next_state, running, []};

running(stop, _State) ->
  io:format('Shutting down~n'),
  {next_state, stopped, []}.

% -- behaviour callbacks

start_link() ->
  gen_fsm:start_link({global, car_fsm}, car_fsm, [], []).

init(_Args) ->
  io:format('Hey, here\'s your car!~n'),
  {ok, stopped, []}.

terminate(normal, _State, _) ->
  ok.

code_change(_Args, State, _, _) ->
  {ok, State}.
