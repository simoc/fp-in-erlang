-module(second).
-export([hypot/2, area/2, perimeter/2]).

hypot(A, B) -> math:sqrt(first:square(A) + first:square(B)).

area(A, B) -> A * B / 2.

perimeter(A, B) -> A + B + hypot(A, B).
