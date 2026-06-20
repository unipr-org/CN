function [pn] = aprox_sin(x,N)
%approssima la funzione seno

pn = 0;
for i=0:N
    pn = pn + ((-1).^i)/factorial(2.*i+1).*(x.^(2.*i+1));
end

end