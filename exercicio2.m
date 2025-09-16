function [blendA, blendB] = exercicio2(NG)

% NG: numero do grupo

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% digite seu codigo aqui

NG = 2 ;

c = [10; 2*NG];

A = [-0.30, -0.20;  
     -0.20, -0.25; 
     -0.25, -0.30]; 

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
