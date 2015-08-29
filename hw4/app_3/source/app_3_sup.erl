-module(app_3_sup).
-export([start_link/0, init/1]).

-behaviour(supervisor).

start_link() ->
  supervisor:start_link(app_3_sup, []).

init(_Args) ->
  {ok, {{one_for_one, 1, 5},
        [{server_instance,
          {server, start_link, []},
          permanent,
          5000,
          worker,
          [server]}
        ]
      }}.

