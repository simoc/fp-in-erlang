-module(ex).
-export([perimeter/1, area/1, enclose/1, bits/1, test1/0, test2/0, test3/0, test4/0, test5/0, test6/0, test7/0, test8/0]).

% Return maximum of three values.
max3(A, B, C) -> max(max(A, B), C).

% Return minimum of three values.
min3(A, B, C) -> min(min(A, B), C).

% Return absolute value of N.
absolute(N) when N < 0 -> -N;
absolute(N) -> N.

% Calulate distance between points (X1, Y1) and (X2, Y2).
distance(X1, Y1, X2, Y2) -> math:sqrt(((X2 - X1) * (X2 - X1)) + ((Y2 - Y1) * (Y2 - Y1))).

% Calculate perimeter of geometric objects.
perimeter({circle, {_X, _Y}, R}) -> 2 * 3.1415 * R;
perimeter({rectangle, {X1, Y1}, {X2, Y2}}) -> absolute(X2 - X1) * 2 + absolute(Y2 - Y1) * 2;
perimeter({triangle, {X1, Y1}, {X2, Y2}, {X3, Y3}}) -> distance(X1, Y1, X2, Y2) + distance(X2, Y2, X3, Y3) + distance(X1, Y1, X3, Y3).

% Calculate area of geometric objects.
area({circle, {_X, _Y}, R}) -> 3.1415 * R * R;
area({rectangle, {X1, Y1}, {X2, Y2}}) -> absolute(X2 - X1) * absolute(Y2 - Y1);
area({triangle, {X1, Y1}, {X2, Y2}, {X3, Y3}}) -> area({rectangle, {min3(X1, X2, X3), min3(Y1, Y2, Y3)}, {max3(X1, X2, X3), max3(Y1, Y2, Y3)}}) / 2.

% Calculate smallest enclosing rectangle of geometric object.
enclose({circle, {X, Y}, R}) -> {rectangle, {X - R, Y - R}, {X + R, Y + R}};
enclose({rectangle, {X1, Y1}, {X2, Y2}}) -> {rectangle, {X1, Y1}, {X2, Y2}};
enclose({triangle, {X1, Y1}, {X2, Y2}, {X3, Y3}}) -> {rectangle, {min3(X1, X2, X3), min3(Y1, Y2, Y3)}, {max3(X1, X2, X3), max3(Y1, Y2, Y3)}}.

% procedural algorithm bits(N):
% BITCOUNTER = 0
% MASK = 1
% while (MASK <= N)
%  {BITCOUNTER, MASK} = {BITCOUNTER + (N % MASK == 1), MASK * 2}
% return BITCOUNTER
bits(N) -> bits3(0, 1, N).
bits3(BITCOUNTER, MASK, N) when MASK > N -> BITCOUNTER;
bits3(BITCOUNTER, MASK, N) when N band MASK /= 0 -> bits3(BITCOUNTER + 1, MASK * 2, N);
bits3(BITCOUNTER, MASK, N) -> bits3(BITCOUNTER, MASK * 2, N).

% test functions.
test1() -> bits(7) == 3.
test2() -> bits(8) == 1. 
test3() -> bits(72) == 2.
test4() -> perimeter({rectangle, {1, 3}, {12, 7}}) == 30.
test5() -> perimeter({triangle, {0, 0}, {3, 0}, {0 ,4}}) == 3 + 4 + 5.
test6() -> area({triangle, {0, 0}, {3, 0}, {0 ,4}}) == 6.
test7() -> enclose({circle, {10, 20}, 7}) == {rectangle, {3, 13}, {17, 27}}.
test8() -> enclose({triangle, {10, 20}, {13, 24}, {11, 6}}) == {rectangle, {10, 6}, {13, 24}}.
