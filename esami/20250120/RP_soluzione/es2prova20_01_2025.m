clear
close all
clc

n = 20;
a = -4;
b = 4;

f = @(x) 4*x./(1+x.^2);

%% nodi equispaziati
x = linspace(a,b,n+1);
y = f(x);

%% nodi di Chebyshev
i = 0:n;

cheby = (a+b)/2-(b-a)/2*cos((2*i+1)*pi/(2*n+2));

y2 = f(cheby);

%% interpolanti
p  = polyfit(x,y,n);
p2 = polyfit(cheby,y2,n);

%% griglia per il grafico
z = linspace(a,b,1000);

val  = polyval(p,z);
val2 = polyval(p2,z);

%% grafico
figure

plot(z,f(z),'k','LineWidth',2)
hold on

plot(z,val,'b','LineWidth',1.5)
plot(z,val2,'g','LineWidth',1.5)

plot(x,y,'ro','MarkerFaceColor','r')
plot(cheby,y2,'ms','MarkerFaceColor','m')

grid on

legend('f(x)', ...
       'Interpolante equispaziato', ...
       'Interpolante Chebyshev', ...
       'Nodi equispaziati', ...
       'Nodi Chebyshev')