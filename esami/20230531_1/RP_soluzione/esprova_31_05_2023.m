clc
clear
close all

f = @(x) sin(pi*x) + 2*cos(pi*x);
a = 0.5;
b = 1.5;
n = 2;
x = [0.5 0.75 1.5]
z = linspace(a,b,1000);

% Sistema di Vandermonde
V = vander(x);
b = f(x)';

% coefficienti
c = V\b

val = polyval(c,z);
err = abs(f(z)-val);

subplot(2,1,1);
plot(x,f(x),'o')
hold on;
plot(z,f(z),'LineWidth',1.5)
plot(z,val,'LineWidth',1.5)
legend('nodi','funzione','polinomio interpolante')

subplot(2,1,2)
plot(z,err)
legend('errore')

max = 10;
toll = 10^-5;
x0 = zeros(3,1);
gs(V,b,x0,max,toll)

% soluzione esatta
sol = V\b

h = 0.5;
Ftr = h/2*(f(0.5)+2*f(1)+f(1.5));
I = integral(f,0.5,1.5)
err2 = abs(Ftr - I)