-module(ex).
-export([nub/1, contains/2]).

% Does a list contain element A?
contains(_A, []) -> false;
contains(A, [X | Xs]) -> A == X orelse contains(A, Xs).

% Return unique elements in list.
nub([]) -> [];
nub([X | Xs]) -> case contains(X, Xs) of
true -> nub(Xs);
false -> [X | nub(Xs)]
end.
