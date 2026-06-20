clear
clc
close all

% Vettore di 200 punti in [-pi, pi]
x = linspace(-pi, pi, 200);

% Funzione esatta
y = sin(x);

% Approssimazioni di Taylor
p1 = aprox_sin(x,1);
p2 = aprox_sin(x,2);
p3 = aprox_sin(x,3);

% Grafici
figure
plot(x,y,'k','LineWidth',2)
hold on

plot(x,p1,'r--','LineWidth',1.5)
plot(x,p2,'b-.','LineWidth',1.5)
plot(x,p3,'g:','LineWidth',1.5)

legend('sin(x)','p_1(x)','p_2(x)','p_3(x)')
xlabel('x')
ylabel('y')
title('Approssimazioni di Taylor del seno')
grid on

err1 = norm(y - p1, inf);
err2 = norm(y - p2, inf);
err3 = norm(y - p3, inf);

fprintf('Errore infinito p1 = %e\n', err1);
fprintf('Errore infinito p2 = %e\n', err2);
fprintf('Errore infinito p3 = %e\n', err3);