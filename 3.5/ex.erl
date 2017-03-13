-module(ex).
-export([doubleAll/1, evens/1, product/1, zip/2, zip_with/3, zip_with2/3, zip2/2]).

doubleElement(X) -> X + X.

% Double each element of list.
doubleAll(Xs) -> lists:map(fun doubleElement/1, Xs).

isEven(X) -> X rem 2 == 0.

% Select only even values in list.
evens(Xs) -> lists:filter(fun isEven/1, Xs).

multiply(X, Y) -> X * Y.

% Calculate product of all elements in list.
product(Xs) -> lists:foldr(fun multiply/2, 1, Xs).

% Zip together pairs of elements from two lists like this:
% zip([1,3,5,7], [2,4]) = [ {1,2}, {3,4} ]
zip(_Xs, []) -> [];
zip([], _Ys) -> [];
zip([X | Xs], [Y | Ys]) -> [ {X, Y} | zip(Xs, Ys) ].

% Zip together pairs of elements from two lists using the function in
% the first argument, like this:
% zip_with(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]) = [ 3, 7 ]
zip_with(_F, [], _Y) -> [];
zip_with(_F, _X, []) -> [];
zip_with(F, [X | Xs], [Y | Ys]) -> [ F(X, Y) | zip_with(F, Xs, Ys) ].

% Same as zip_with but using map instead.
zip_with2(F, X, Y) -> lists:map(fun({A, B}) -> F(A, B) end, zip(X, Y)).

% Same as zip but using zip_with2 instead.
zip2(X, Y) -> zip_with(fun(A, B) -> A + B end, X, Y).

