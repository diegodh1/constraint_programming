include "alldifferent.mzn";
include "globals.mzn";
% name
var 24..26: juan;
var 24..26: oscar;
var 24..26: dario;
% last name
var 24..26: lopez;
var 24..26: garcia;
var 24..26: gonzalez;
% music
var 24..26: pop;
var 24..26: jazz;
var 24..26: clasica;

% problem constraints
constraint all_different([juan, oscar, dario]);
constraint all_different([lopez, garcia, gonzalez]);
constraint all_different([pop, jazz, clasica]);

constraint gonzalez = clasica;
constraint juan > gonzalez;
constraint pop != 24;
constraint garcia != pop;
constraint oscar != lopez;
constraint oscar == 25;
constraint dario != jazz;

solve:: int_search(
    [juan, oscar, dario],
    first_fail,
    indomain_max,
    complete
) satisfy;
output
[
"nombre: ", show([juan, oscar, dario]), "\n",
"apellido: ", show([lopez, garcia, gonzalez]), "\n",
"musica: ", show([pop, jazz, clasica]), "\n"
]