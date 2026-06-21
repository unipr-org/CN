clc
clear
close all

f = @(x) sqrt(x)-(3.*x.^2)+x;
z = linspace(0,1,500);
fprimo = @(x) (1/(2*sqrt(x)))-6*x+1;

x = newton(0.8,fprimo,f,10^-4,100)
x1 = newton(0.3,fprimo,f,10^-4,100)
plot(z,f(z))
grid on;