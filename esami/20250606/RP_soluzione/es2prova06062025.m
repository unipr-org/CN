x = [-1.5 -0.5 0.5 1.5];
y = [0.1054 0.7788 0.7788 0.1054];
n = 3;
z = linspace(-1.5,1.5,500);
p = polyfit(x,y,n)
val = polyval(p,z)

%a
plot(x,y,'o'); % punti
hold on;
plot(z,val);

%b
int = interp1(x,y,z,'linear')
plot(z,int);
legend ('Nodi',' Polinomio interpolante', 'Interpolazione lineare');

%c
q = polyint(p);
IP = polyval(q,1.5)-polyval(q,-1.5)

%d
IL = trapz(x,y)
%oppure
%fun_lineare = @(z) interp1(x, y, z, 'linear');
%IL2 = integral(fun_lineare, -1.5, 1.5)

%e
g = @(x) exp(-x.^2);
I = integral(g, -1.5, 1.5);

%f
err_c = abs(I - IP)
err_d = abs(I - IL )