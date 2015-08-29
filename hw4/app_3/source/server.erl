% application:start(app_3).
% gen_server:call({global, key_value_storage}, {set, "123", "Lol"}).
% gen_server:call({global, key_value_storage}, {get, "123"}).
% server:set(this, "is Sparta").
% server:get(this).

-module(server).
-behaviour(gen_server).
-export([start_link/0, init/1, set/2, get/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

% --- public api ---

set(Key, Value) ->
  gen_server:call({global, key_value_storage}, {set, Key, Value}).

get(Key) ->
  gen_server:call({global, key_value_storage}, {get, Key}).

% --- gen_server stuff ---

start_link() ->
  gen_server:start_link({global, key_value_storage}, ?MODULE, [], []).

stop(_Stop) ->
  ok.

init(_Args) ->
  {ok, dict:new()}.

handle_call({set, Key, Value}, _From, State) ->
  {reply, {ok, Key, Value}, dict:append(Key, Value, State)};

handle_call({get, Key}, _From, State) ->
  {reply, dict:find(Key, State), State};

handle_call(_Args, _From, State) ->
  {noreply, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(Msg, State) ->
  io:format("Unexpected message: ~p~n",[Msg]),
  {noreply, State}.

terminate(normal, _State) ->
  ok.

code_change(_Args, State, _) ->
  {ok, State}.
