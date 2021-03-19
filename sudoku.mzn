include "alldifferent.mzn";
include "globals.mzn";

% Use this editor as a MiniZinc scratch book
array [1..9,1..9] of int: game;
game =  [|0,9,0,0,0,0,0,1,0|
          8,0,4,0,2,0,3,0,7|
          0,6,0,9,0,7,0,2,0|
          0,0,5,0,3,0,1,0,0|
          0,7,0,5,0,1,0,3,0|
          0,0,3,0,9,0,8,0,0|
          0,2,0,8,0,5,0,6,0|
          1,0,7,0,6,0,4,0,9|
          0,3,0,0,0,0,0,8,0|];
array [1..9,1..9] of var 1..9: game2;

% All different in rows.
constraint forall (i in 1..9) (alldifferent( [ game2[i,j] | j in 1..9]));
% All different in columns.
constraint forall (j in 1..9) (alldifferent( [ game2[i,j] | i in 1..9]));
% All different in square #1.
constraint alldifferent( [ game2[i,j] | i in 1..3, j in 1..3]);
% All different in square #2.
constraint alldifferent( [ game2[i,j] | i in 1..3, j in 4..6]);
% All different in square #3.
constraint alldifferent( [ game2[i,j] | i in 1..3, j in 7..9]);
% All different in square #4.
constraint alldifferent( [ game2[i,j] | i in 4..6, j in 1..3]);
% All different in square #5.
constraint alldifferent( [ game2[i,j] | i in 4..6, j in 4..6]);
% All different in square #6.
constraint alldifferent( [ game2[i,j] | i in 4..6, j in 7..9]);
% All different in square #7.
constraint alldifferent( [ game2[i,j] | i in 7..9, j in 1..3]);
% All different in square #8.
constraint alldifferent( [ game2[i,j] | i in 7..9, j in 4..6]);
% All different in square #9.
constraint alldifferent( [ game2[i,j] | i in 7..9, j in 7..9]);


constraint forall (i in 7..9) (alldifferent( [ game2[i,j] | j in 7..9]));

output [ show(game2[i,j]) ++ 
         if j == 9 then "\n" else if j == 3 \/ j == 6 then "|" else " " endif endif |
         i in 1..9, j in 1..9 
];
solve satisfy;