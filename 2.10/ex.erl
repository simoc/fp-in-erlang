-module(ex).
-export([take/2]).
-spec(take(integer(), [T]) -> [T]).

% Double first N elements of a list
% (or all remaining elements if N is larger than the length of the list).
take(_N, []) -> [];
take(0, _Xs) -> [];
take(N, [X | Xs]) -> [X | take(N - 1, Xs)].
