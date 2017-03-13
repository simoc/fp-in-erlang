-module(game).
-export([result/2, tournament/2, test/0]).

% Atoms rock paper scissors.

% Possible results in each round of game.
beat(rock) -> paper;
beat(paper) -> scissors;
beat(scissors) -> rock.

lose(rock) -> scissors;
lose(scissors) -> paper;
lose(paper) -> rock.

% Calculate result of a round from point of view of P1.
result(P1, P2) -> compareRound(P1, beat(P2), P2).

compareRound(P1, BEATSP2, P2) -> case P1 of
  P2 -> 0;
  BEATSP2 -> 1;
  _ -> -1
end.

% Calculate cumulative result of several rounds from point of view of P1.
tournament(X, Y) -> lists:foldr(fun({P1, P2}, ACC) -> ACC + result(P1, P2) end, 0, lists:zip(X, Y)).

test() -> tournament([rock,rock,paper,paper],[rock,paper,scissors,rock]).
