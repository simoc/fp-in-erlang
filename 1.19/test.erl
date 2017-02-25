-module(test).
-export([fib/1, pieces/1]).

fib(1) -> 0;
fib(2) -> 1;
fib(N) when N > 0 -> fib(N - 2) + fib(N - 1).

pieces(0) -> 1;
pieces(1) -> 2;
pieces(2) -> 4;
pieces(3) -> 7;
pieces(4) -> 11;
pieces(N) when N > 0 -> pieces(N - 1) + N.

