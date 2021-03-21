include "alldifferent.mzn";
include "globals.mzn";
array [1..8] of string: persons;
persons = ["jose", "julian", "diana", "juan", "david", "claudia", "edgar", "mario"];
array [1..length(persons)] of var 1..8: persons2;
array [1..1, 1..2] of int: next;
next = [|5,8|];
array [1..1, 1..2] of int: separate;
separate = [|3,7|];
array [1..1, 1..3] of int: distancia;
distancia = [|6,5,2|];

constraint alldifferent(persons2);
constraint forall (i in 1..1, j in 1..length(persons)) (if persons2[j] == next[i,1] then persons2[j-1] == next[i,2] \/ persons2[j+1] == next[i,2] endif);
constraint forall (i in 1..1, j in 1..length(persons)) (if persons2[j] == separate[i,1] then persons2[j-1] != next[i,2] \/ persons2[j+1] != next[i,2] endif);
constraint forall (i in 1..1, j in 1..length(persons)) (if persons2[j] == distancia[i,1] then persons2[j-distancia[i,3]] == next[i,2] \/ persons2[j+distancia[i,3]] == next[i,2] endif);

output [ show(persons2[i]) ++  " "|i in 1..length(persons)
];

solve satisfy;