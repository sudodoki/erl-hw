% > c(gen_area_listener).
% {ok,gen_area_listener}
% > c(circle_area).
% {ok,circle_area}
% > f(Self), Self = square_area:init().
% <0.101.0>
% > Self ! {square, 5}.
% Received figure {square,5} and area is 25.0
% {square,5}
% > Self ! {circle, 5}.
% Received figure is not square, sorry
% {circle,5}
% =ERROR REPORT==== [REDUCTED] ===
% Error in process <0.101.0> with exit value: {badarith,[{square_area,compute_area,1,[{file,"square_area.erl"},{line,28}]},{gen_area_listener,loop,1,[{file,"gen_area_listener.erl"},{line,23}]}]}

-module(square_area).
-behaviour(gen_area_listener).
-export([init/0, compute_area/1]).
-import(math, [pow/2]).

init() ->
  gen_area_listener:init(?MODULE).

compute_area({square, Side}) ->
  pow(Side, 2);

compute_area(_) ->
  io:format("Received figure is not square, sorry~n"), erlang:error(badarith).