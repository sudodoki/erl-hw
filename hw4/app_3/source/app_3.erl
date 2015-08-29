-module(app_3).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, _Args) ->
  app_3_sup:start_link(). % we start a root supervisor from application process

stop(_Stop) ->
  ok.
