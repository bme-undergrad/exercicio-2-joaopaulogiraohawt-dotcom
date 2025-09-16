function [blendA, blendB] = exercicio2(NG)

% NG: numero do grupo

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% digite seu codigo aqui

# X = [x, y]
C = [10; 2*NG]
NG = 2

# A*X <= b
A = [-0.3, -0.2;
     -0.2, -0.25;
     -0.25, -0.3];

b = [-15;
     -10;
     -12];

lb = [0; 0];

ub = [20; 50];

x = linprog(c, A, b, [], [], lb, ub);

% mantenha essas duas linhas finais
blendA = x(1);
blendB = x(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
