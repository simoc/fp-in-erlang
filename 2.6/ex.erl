-module(ex).
-export([product/1, productTR/1, maximum/1, maximumTR/1]).

% Simple recursive version for calculating product of list.
product([]) -> 1;
product([X | Xs]) -> X * product(Xs).

% Tail recursion version for calculating product of list.
productTR(Xs) -> productTR(Xs, 1).

productTR([], P) -> P;
productTR([X | Xs], P) -> productTR(Xs, X * P).

% Simple recursive version for finding maximum value in a list.
maximum([]) -> -1;
maximum([X | Xs]) -> max(X, maximum(Xs)).

% Tail recursion version for finding maximum value in a list.
maximumTR([]) -> -1;
maximumTR([X | Xs]) -> maximumTR(Xs, X).

maximumTR([], M) -> M;
maximumTR([X | Xs], M) -> maximumTR(Xs, max(X, M)).

