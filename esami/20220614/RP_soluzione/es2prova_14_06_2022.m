clc
clear
close all

f = @(s) s.^8-2;
a = 0.5;
b = 2;
s = linspace(a,b,500);
toll = 10^-10;

[x,iter]=bis(f,a,b,toll,100);

fprintf('--- Risultati Bisezione (Punto 2c) ---\n');
fprintf('Numero di iterazioni necessarie: %d\n', iter);
fprintf('Radice approssimata (Bisezione): %f\n\n', x);

x1 = fzero(f,[a b]);
fprintf('--- Risultati fzero (Punto 2d) ---\n');
fprintf('Radice approssimata (fzero): %f\n', x1);

diff_numerica = abs(x - x1);
fprintf('Differenza assoluta tra i due metodi: %e\n', diff_numerica);

plot(s,f(s),'b-', 'LineWidth', 1.5)
grid on;
hold on;
plot(x,f(x), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')
plot(x1,f(x1), 'kx', 'MarkerSize', 10, 'LineWidth',2)
xlabel('s');
ylabel('f(s)');
title('Grafico di f(s) = s^8 - 2 e radici calcolate');
legend('funzione','approssimazione bis','approssimazione fzero')