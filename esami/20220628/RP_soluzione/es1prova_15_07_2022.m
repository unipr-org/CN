clc
clear
close all

x = [-1 0 1 2];
y = [-0.1 2.03 3.5 6];
n = 3;
z = linspace(-2,3,100);

p = polyfit(x,y,n);
val = polyval(p,z);

%reg = @(x) 1.977.*x+1.869
% oppure
p_reg = polyfit(x, y, 1);
val_reg = polyval(p_reg, z);

plot(x,y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8)%punti
hold on;
plot(z,val, 'b-', 'LineWidth', 1.5)%polinomio interpolante
%plot(z,reg(z))%retta mq
plot(z,val_reg, 'g--', 'LineWidth', 1.5)
grid on;
xlabel('x');
ylabel('y');
title('Confronto Modelli di Approssimazione');
legend('Punti dati', 'Polinomio Interpolante', 'Retta Minimi Quadrati')

diff = abs(val-val_reg)'