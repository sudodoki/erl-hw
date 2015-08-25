% > c(gen_area_listener).
% {ok,gen_area_listener}
% > c(circle_area).
% {ok,circle_area}
% > f(Self), Self = circle_area:init().
% <0.92.0>
% > Self ! {circle, 5}.
% Received figure {circle,5} and area is 49.34802200544679
% {circle,5}
% > Self ! {square, 5}.
% Received figure is not circle, sorry
% {square,5}
% =ERROR REPORT==== [REDUCTED] ===
% Error in process <0.92.0> with exit value: {badarith,[{circle_area,compute_area,1,[{file,"circle_area.erl"},{line,13}]},{gen_area_listener,loop,1,[{file,"gen_area_listener.erl"},{line,23}]}]}

-module(circle_area).
-behaviour(gen_area_listener).
-export([init/0, compute_area/1]).
-import(math, [pi/0, pow/2]).

init() ->
  gen_area_listener:init(?MODULE).

compute_area({circle, Radius}) ->
  pow(pi(), 2) * Radius;

compute_area(_) ->
  io:format("Received figure is not circle, sorry~n"), erlang:error(badarith).
