function [I] = pmc(f,a,b,m)
%calcola l'integrale con la formula del punto medio composita

H = (b-a)/m;
x = linspace(a,b,m+1);
som = 0;
for i=2:m+1
    som = som + f((x(i)+x(i-1))/2);
end
I = H*som;