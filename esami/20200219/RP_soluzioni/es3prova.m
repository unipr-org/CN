clc
clear
close all

g = @(x) (2.*x)./sqrt(x.^2+1);
a = sqrt(3);
b = 2;


pms = g((a+b)/2)*(b-a);
I_quad = quad(g,a,b);
xm = (a+b)/2;

err = abs(pms-I_quad);

for m = 1:30
    x = linspace(a,b,m+1);
    H = (b-a)/m;
    som = 0;
    for i=2:m+1
        som = som + g((x(i)+x(i-1))/2);
    end
    I = H*som;
    err = abs(I-I_quad);
    fprintf('con %d sottointervalli l errore è di: %f\n',m,err)
end


plot(x,g(x),'LineWidth',1.5)
hold on;
plot(x,g(xm)*ones(size(x)),'--')
legend('g(x)','funzione costante')
grid on

