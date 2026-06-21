clc
clear
close all

x = [3 -2 -1];
y = [2 4 0];
z = linspace(-2,4,100);
reg =@(x) -1/7*x + 2;

plot(x,y,'o')
hold on;
grid on;
plot(z,reg(z))
legend('punti','retta di regressione')