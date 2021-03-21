include "alldifferent.mzn";
include "globals.mzn";

% VARIABLES
int: N = 6;
int: M = 5;
array [1..N,1..M] of int: game;
array[1..N] of int: rows;
array[1..M] of int: cols;
array [1..N,1..M] of var 0..9: game2;
rows = [0,9,13,13,7,19];
cols = [0,9,34,15,3];
game =  [|0,0,0,0,0|
          0,1,1,1,0|
          0,1,1,1,0|
          0,1,1,0,0|
          0,0,1,1,1|
          0,0,1,1,1|];

%COPY THE NOT VALID CELLS.
constraint forall (i in 1..N, j in 1..M) (if game[i,j] == 0 then game2[i,j] = 0 else game2[i,j] > 0 endif);
% ALL DIFFERENTS IN ROWS.
constraint (alldifferent_except_0( [game2[i,1] | i in 1..N]));
constraint (alldifferent_except_0( [game2[i,2] | i in 1..N]));
constraint (alldifferent_except_0( [game2[i,3] | i in 1..N]));
constraint (alldifferent_except_0( [game2[i,4] | i in 1..N]));
constraint (alldifferent_except_0( [game2[i,5] | i in 1..N]));

% ALL DIFFERENTS IN COLS.
constraint (alldifferent_except_0( [game2[1,i] | i in 1..M]));
constraint (alldifferent_except_0( [game2[2,i] | i in 1..M]));
constraint (alldifferent_except_0( [game2[3,i] | i in 1..M]));
constraint (alldifferent_except_0( [game2[4,i] | i in 1..M]));
constraint (alldifferent_except_0( [game2[5,i] | i in 1..M]));
constraint (alldifferent_except_0( [game2[6,i] | i in 1..M]));
%COLS CONSTRAINTS
constraint sum (i in 1..N)(game2[i,1]) == cols[1];
constraint sum (i in 1..N)(game2[i,2]) == cols[2];
constraint sum (i in 1..N)(game2[i,3]) == cols[3];
constraint sum (i in 1..N)(game2[i,4]) == cols[4];
constraint sum (i in 1..3)(game2[i,4]) == 4;
constraint sum (i in 1..N)(game2[i,5]) == cols[5];
%ROWS CONSTRAINTS
constraint sum (j in 1..M)(game2[1,j]) == rows[1];
constraint sum (j in 1..M)(game2[2,j]) == rows[2];
constraint sum (j in 1..M)(game2[3,j]) == rows[3];
constraint sum (j in 1..M)(game2[4,j]) == rows[4];
constraint sum (j in 1..M)(game2[5,j]) == rows[5];
constraint sum (j in 1..M)(game2[6,j]) == rows[6];

output [ show(game2[i,j]) ++ 
         if j == M then "\n" else " " endif |
         i in 1..N, j in 1..M
];
solve satisfy;
