clear
clc

alpha = 10;
n = 10;

% costruzione matrice
A = eye(n) + alpha*diag(ones(n-1,1),-1);

% soluzione esatta
x_es = ones(n,1);

% termine noto
b = A*x_es;

% soluzione numerica
x_num = sost_avanti_pm(A,b);

disp(x_num)