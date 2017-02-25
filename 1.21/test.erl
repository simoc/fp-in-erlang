-module(test).
-export([fib/1, perfect/1]).

% fib(N) procedural algorithm:
% A = 0
% B = 1
% while (N > 0)
%   {A, B, N} = {B, A + B, N - 1}
% return A

fib(N) -> fib3(0, 1, N).

fib3(A, _B, 0) -> A;
fib3(A, B, N) -> fib3(B, A + B, N - 1).

% perfect(N) procedural algorithm:
% A = 0
% B = N - 1
% while (B > 0)
%   {A, B} = {A + (N modulo B == 0), B - 1}
% return A == N

perfect(N) -> perfect3(0, N - 1, N).

perfect3(_A, 0, _A) -> true;
perfect3(_A, 0, _N) -> false;
perfect3(A, B, N) when N rem B == 0 -> perfect3(A + B, B - 1, N);
perfect3(A, B, N) -> perfect3(A, B - 1, N).


