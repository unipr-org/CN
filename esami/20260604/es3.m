clc
clear
close all

x = [3 -2 -1];
y = [2 4 0];
n = 2; %grado, punti = 3
z = linspace(-5,5,500);

% retta di regressione
p_reg = polyfit(x,y,n-1);
val = polyval(p_reg,z);

plot(x,y,'ro','MarkerSize',15)
hold on;
plot(z,val,'b','LineWidth',2)
legend('punti','retta regressione')
grid on;