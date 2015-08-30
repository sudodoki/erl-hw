% testing/fibonacci_00.erl
-module(fibonacci).
-include_lib("eunit/include/eunit.hrl").

fib(0) -> 0;
fib(1) -> 1;
fib(N) when N < 0 -> undefined;
fib(N) -> fib(N-1)+fib(N-2);
fib(_) -> undefined.

fibonacci_test() ->
  ?_assert(fib(-5) =:= undefined),
  ?_assert(fib(0) =:= 0),
  ?_assert(fib(1) =:= 1),
  ?_assert(fib(2) =:= 1),
  ?_assert(fib(5) =:= 5).
