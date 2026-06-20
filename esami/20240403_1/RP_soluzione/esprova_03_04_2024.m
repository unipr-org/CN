clc
clear
close all

a = -2;
b = 5;
x = [1 -1 2];
y = [13 7 16];
z = linspace(a,b,100);

p = polyfit(x,y,2);
val = polyval(p,z);

subplot(2,1,1)
plot(z,val,'LineWidth',1.5)
hold on;
grid on;
plot(x,y,'o')
legend('polinomio interpolante','nodi')

f = @(x) log(x+1)./(-2-log(x+1));
g = linspace(-0.99,5,1000);
subplot(2,1,2)
plot(g,f(g))
grid on;
root = fzero(f,0)