

array[1..4] of var 0..1: x;

constraint x[1] + x[2] >= 1;
constraint x[3] + x[4] >= 1;

% solve minimize sum(x); % get x = 2;

constraint sum(x) = 2;
solve satisfy;

output ["x = ", show(x)];