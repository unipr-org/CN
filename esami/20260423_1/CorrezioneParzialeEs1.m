clear
clc

g1 = [1 -1 -4 4 -5 5];
disp('Radice con comando roots');
disp(roots(g1));

% funzione e derivata
g = @(x) x^5 - x^4 - 4*x^3 + 4*x^2 - 5*x + 5;
gp = @(x) 5*x^4 - 4*x^3 - 12*x^2 + 8*x - 5;

% parametri
x0 = 2; % punto iniziale 
toll = 1e-10;
max = 50;

% inizializzazione
x_prec = x0;
iter = 0;

incremento = [];
x_val = [];

while iter < max
    
    x_nuovo = x_prec - g(x_prec)/gp(x_prec);
    
    iter = iter + 1;
    
    incremento(iter) = abs(x_nuovo - x_prec);
    x_val(iter) = x_nuovo;
    
    if incremento(iter) < toll
        break;
    end
    
    x_prec = x_nuovo;
    
end

radice = x_nuovo;

disp("Radice trovata:")
disp(radice)

disp("Iterazioni:")
disp(iter)

% grafico incremento
figure
semilogy(1:iter, incremento, '-o')
xlabel('Iterazioni')
ylabel('Incremento')
title('Convergenza metodo di Newton')
grid on