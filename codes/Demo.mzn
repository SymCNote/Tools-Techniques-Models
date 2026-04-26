

include "para.dzn";
% ==================================================================
% integer parameters
int: INT_0;
int: INT_1;              % 必须外部传入
int: INT_2 = 128;        % 有默认值，可被覆盖
% ---
output[show(INT_1) ++ "\n"];
output[show(INT_2) ++ "\n"];


% ==================================================================
% bool parameters
bool: BOOL_1;
bool: BOOL_2 = true;
% ---
output[show(BOOL_1) ++ "\n"];
output[show(BOOL_2) ++ "\n"];



% ==================================================================
% list 
array[1..3] of 0..3: LIST_1;                           % 默认数组下标从 1 开始    
array[0..2] of int: LIST_2;                            % 传入格式为 array1d(0..2,[1,2,3])
array[0..2, 1..3] of int: LIST_3 = array2d(0..2,1..3,[3,2,1, 6,5,4, 9,8,7]);    % 传入格式为 array1d(0..2,[1,2,3])
% ---
output[show(LIST_1) ++ "\n"];
output[show(LIST_2) ++ "\n"];
output[show(LIST_3) ++ "\n"];



% % ==================================================================
% % set 
% set of 0..7: SET_1 = 0..7;
% % 支持集合推导式
% set of int: EVEN = {i | i in SET_1 where i mod 2 = 0};
% set of int: POWER2 = {2^i | i in 0..7};
% % 支持集合运算
% set of 0..255: UNION = EVEN union POWER2;
% set of 0..255: INTERSECT = EVEN intersect POWER2;
% % ---
% output[show(SET_1) ++ "\n"];
% output[show(EVEN) ++ "\n"];
% output[show(POWER2) ++ "\n"];
% output[show(UNION) ++ "\n"];
% output[show(INTERSECT) ++ "\n"];

% % ##################################################################
% % ##################################################################

% int: INTa = 7;
% var int: I_1;                           % 决策变量，整数空间
% var 0..255: I_2;                        % 决策变量，指定整数空间
% var bool: B;                            % 决策变量，布尔空间
% array [0..2] of var int: VAR_LIST;      % 决策变量，数组
% array [0..2] of var 0..2: VAR_LIST_2;   % 决策变量，指定空间数组

% % ##################################################################
% % ##################################################################
int: R = 2;
int: C = 8;
array [0..R] of var int: X;
array [0..R, 0..C] of var int: Y;

% constraint forall(i in 0..R)(X[i] <= 100);
% constraint 
% 	forall(i in 0..R)(
% 		forall(j in 0..C)(
% 			Y[i,j] <= 100
% 		)
% 	)
% ;


% constraint exists(i in 0..R)(X[i] == 0);
% constraint if exists(i in 0..R)(X[i] == 0) then exists(i in 0..R)(X[i] == 1) else exists(i in 0..R)(X[i] == 2) endif;

% constraint sum(i in 0..R)(X[i]) = 5;


% var int: prod;
% constraint prod = product(i in 0..R)(X[i]);


% array[1..R] of var int: squares;
% constraint squares = [i*i | i in 1..R];


% constraint max(i in 0..R)(X[i]) <= 3;
% constraint min(i in 0..R)(X[i]) >= 2;


% var int: MAX;
% constraint MAX = max([X[i] | i in 0..R] ++ [Y[m,n] | m in 0..R, n in 0..C]);


% array[1..3] of var bool: x;
% array[1..4, 1..3] of int: truth_table = array2d(1..4, 1..3, [
%     0, 0, 0,
%     0, 1, 1,
%     1, 0, 1,
%     1, 1, 0
% ]);
% % constraint table(x, truth_table);
% % constraint x[2] = x[3] /\ x[1] != x[2];
% constraint x[1] = truth_table[2,1] /\ x[2] = truth_table[2,2] /\ x[3] = truth_table[2,3];


% constraint not(X[1] = 0);
% constraint X[1] mod 4 == 0;


% constraint (X[1] > 0) -> (X[2] < 10);
% constraint (X[1] > 0) <-> (X[2] < 10);



% var 1..10: x = 5;
% var 1..10: y = 3;
% var int: result = 
%     let {
%         var int: add = x + y;
%         var int: minus = x - y;
%     } in add * minus;

% output ["Result: ", show(result), "\n"];



% var int: x;
% constraint in_range(x,2,3);

% predicate in_range(var int: x, int: low, int: high) = 
%     (x >= low) /\ (x <= high)
% ;