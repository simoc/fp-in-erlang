-module(ex).
-export([palindrome/1]).

% Is list a palindrome?
palindrome(Xs) -> Xs == lists:reverse(Xs).
