clc
clear

q = @(x) (1-x)^4;
r = @(x) x^4-4*x^3+6*x^2-4*x+1;
s = 0.9975;

q(s)
r(s)