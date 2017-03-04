-module(ex).
-export([double/1, even/1]).

% Double each element of list.
double([]) -> [];
double([X | Xs]) -> [X * 2 | double(Xs)].

% Filter list, keeping even values.
even([]) -> [];
even([X | Xs]) when X rem 2 == 0 -> [X | even(Xs)];
even([_X | Xs]) -> even(Xs).
