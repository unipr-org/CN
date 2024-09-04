function [q] = cavalieri_simpson_composita(f, a, b, m)
    x = linspace(a,b,m+1);
    H = (b-a) / m;
    
    sol = H/6 * (f(x(1)) + 2*sum(f(x(2:m)))+ 4*sum(f((x(2:m+1)+x((2:m+1)-1))/2)) + f(x(m+1)));
end
