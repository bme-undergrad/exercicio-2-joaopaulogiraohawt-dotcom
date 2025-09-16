function [blendA, blendB] = exercicio2(NG)

% NG: numero do grupo

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% digite seu codigo aqui
clc
clear all
pkg load optim

# X = [x, y]
C = [10; 4];

# A*X <= b
A = [0.3, 0.2;
     0.2, 0.25;
     0.25, 0.3;];

b = [15;
     10;
     12];

# Aeq*X = beq
Aeq = zeros(1,2);
beq = 0;

[x_star, fval] = linprog(f, -A, -b, Aeq, beq, lb=zeros(2,1), ub=100*ones(2,1))


# meshplot
x = 0:0.005:5; % Define x-range
y = 0:0.005:5; % Define y-range
[xx, yy] = meshgrid(x, y); % Create a grid of points

% Inequalities
mask1 = (0.3*xx + 0.2*yy >= 15);
mask2 = (0.2*xx + 0.25*yy >= 10);
mask3 = (0.25*xx + 0.3*yy >= 12);
combined_mask = mask1 & mask2 & mask3;

z_values_combined = zeros(size(xx));
z_values_combined(~combined_mask) = NaN;


xgrid = 0:0.05:5;
# linear
hold on
plot(xgrid, (15 - 0.3*xgrid)/0.2, 'Polietileno')   
plot(xgrid, (10 - 0.2*xgrid)/0.25, 'PLA') 
plot(xgrid, (12 - 0.25*xgrid)/0.3, 'Polipropileno')  
plot(x_star(1), x_star(2), 'ro')
xlabel('x');
ylabel('y');
grid on

# espaco de solucoes
pcolor(xx, yy, z_values_combined);
shading flat;

xlim([0, 5])
ylim([0, 5])
zz = 10.*xx + 4.*yy;
contour(xx, yy, zz, 20)
hold off

% mantenha essas duas linhas finais
blendA = x(1);
blendB = x(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
