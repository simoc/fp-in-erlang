-module(ex).
-export([test/0, makeIndex/1, indexLine/2, getWords/1]).

% Partial solution to Assignment 2 (I have no more free time this week).
% Index is created but without calculating line number ranges.
% Run ex.test() to test my solution.

% Build index for a list of lines.
% Result is a list of tuples containing word and the line numbers it occurs on.
makeIndex(X) -> createLineRanges(collate(buildIndex(X, 1))).

% Map {word, [line, line, ..]} list into line number range for each word.
createLineRanges([]) -> [];
createLineRanges([{W, Ls} | Xs]) -> [{W, createRange(Ls)} | createLineRanges(Xs)].

% TODO: map list of line numbers to list of ranges
% For example, [3, 4, 5, 7, 11, 12, 13] maps to [{3, 5}, {7, 7}, {11, 13}].
createRange(X) -> lists:usort(X).

% Map list of {word, line} tuples into list of {word, [line line ...]}
collate(Xs) -> dict:to_list(collate(dict:new(), Xs)).

collate(D, []) -> D;
collate(D, [{W, L} | Xs]) -> collate(dict:append(W, L, D), Xs).

% Recursively build index for each line.
buildIndex([], _) -> [];
buildIndex([X | Xs], N) ->
  lists:append(indexLine(getWords(X), N), buildIndex(Xs, N + 1)).

% Split string into list of words.
getWords(X) -> string:tokens(X, " .,!?").

% Build an index for a list of words on line number N.
indexLine([], _N) -> [];
indexLine([X | Xs], N) -> [{X, N} | indexLine(Xs, N)].

test() -> makeIndex(["the quick brown fox",
"jumped over a lazy dog",
"and then saw another fox jumping over a dog",
"and became quite excited",
"and jumped up and down and laughed"]).

