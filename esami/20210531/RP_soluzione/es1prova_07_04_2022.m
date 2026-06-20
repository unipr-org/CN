clc
clear
close all

%% Funzione
f = @(x) sin(2*x) + exp(x) + 1;

%% Nodi interpolazione
x = [-2, -1.25, -0.7, 0.1];
y = f(x);

%% Intervallo e griglia
a = -2;
b = 0.1;
z = linspace(a,b,1000);

fz = f(z);

%% =========================
% 1) Interpolazione Lagrange
%% =========================

p = polyfit(x,y,3);
val = polyval(p,z);

%% =========================
% 2) Minimi quadrati
%% =========================

p1 = polyfit(z,fz,2);
val1 = polyval(p1,z);

%% =========================
% 3) Grafico
%% =========================

figure
hold on
grid on

plot(z,fz,'k','LineWidth',2)
plot(z,val,'r--','LineWidth',2)
plot(z,val1,'b-.','LineWidth',2)
plot(x,y,'ko','MarkerFaceColor','g')

legend('f(x)','Interpolante','Minimi quadrati','Nodi')

title('Interpolazione e Minimi Quadrati')

%% =========================
% 4) Errori (norma infinito)
%% =========================

err  = norm(fz - val, inf);
err1 = norm(fz - val1, inf);

fprintf('Errore interpolazione = %e\n', err);
fprintf('Errore minimi quadrati = %e\n', err1);

%% confronto
if err1 < err
    disp('Minimi quadrati migliori (norma infinito)')
else
    disp('Interpolazione migliore (norma infinito)')
end

%% =========================
% 5) Integrale esatto
%% =========================

I = integral(f,a,b);
fprintf('\nIntegrale esatto = %.10f\n', I);

%% =========================
% 6) Integrale polinomio interpolante
%% =========================

int = polyint(p);
Int = polyval(int,b) - polyval(int,a);

err_Int = abs(Int - I);

fprintf('Errore integrale interpolante = %e\n', err_Int);

%% =========================
% 7) Integrale minimi quadrati
%% =========================

int1 = polyint(p1);
Int1 = polyval(int1,b) - polyval(int1,a);

err_Int1 = abs(Int1 - I);

fprintf('Errore integrale minimi quadrati = %e\n', err_Int1);

%% confronto integrali
if err_Int1 < err_Int
    disp('Minimi quadrati migliori per integrale')
else
    disp('Interpolazione migliore per integrale')
end