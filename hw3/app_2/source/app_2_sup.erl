-module(app_2_sup).
-export([start_link/0, init/1]).

-behaviour(supervisor).

start_link() ->
  supervisor:start_link(app_2_sup, []).

init(_Args) ->
    SupFlags = #{strategy => one_for_one, intensity => 1, period => 5},
    ChildSpecs = [#{id => looper,
                    start => {looper, start_link, []},
                    restart => permanent,
                    shutdown => brutal_kill,
                    type => worker,
                    modules => [looper]}],
    {ok, {SupFlags, ChildSpecs}}.
