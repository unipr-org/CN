clc
clear
close all

b1 = 0; % condizione |b1| < 1
A = [3 1 0; -1 2 0.2; 1 b1 2];
b = [7;8;9];
max = 10;
toll = 10^-3;
x0 = 1;

xjac = jac(A,b,max,toll,x0)
x1 = A\b