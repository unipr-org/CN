clc
clear

B = 1; %|B|<=2
A = [1 1 B; -1 2 0.2; 1 -0.1 2];
b = [1;2;3];
toll = 10^-3;
x1 = A\b
x = jac(A,b,toll,100,-1)