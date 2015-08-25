% c(user_server).
% {ok, Pid} = user_server:start_link().
% user_server:create_user(Pid, "Johny").
% user_server:list_users(Pid).

-module(user_server).
-behaviour(gen_server).
-export([start_link/0, init/1, create_user/2, list_users/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).


start_link() ->
  gen_server:start_link(?MODULE, [], []).

init(_Args) ->
  {ok, []}.

create_user(Pid, Name) ->
  gen_server:cast(Pid, {create, Name}).

list_users(Pid) ->
  gen_server:call(Pid, list).

handle_call(list, From, State) ->
  {reply, State, State};

handle_call(_Args, _From, State) ->
  {noreply, State, State}.

handle_cast({create, Name}, State) ->
  {noreply, [Name|State]};

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(Msg, State) ->
  io:format("Unexpected message: ~p~n",[Msg]),
  {noreply, State}.

terminate(normal, _State) ->
  ok.

code_change(_Args, State, _) ->
  {ok, State}.
