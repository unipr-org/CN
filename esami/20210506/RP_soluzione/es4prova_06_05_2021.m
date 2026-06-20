clear
clc
close all

alpha = 10;

n_vec = 10:10:100;

condA = zeros(size(n_vec));
errInf = zeros(size(n_vec));

for j = 1:length(n_vec)

    n = n_vec(j);

    A = eye(n) + alpha*diag(ones(n-1,1),-1);

    x_es = ones(n,1);

    b = A*x_es;

    x_num = sost_avanti_pm(alpha,b);

    condA(j) = cond(A,inf);

    errInf(j) = norm(x_es-x_num,inf);

end


subplot(2,1,1)
plot(n_vec,condA,'o-','LineWidth',2)
grid on
xlabel('n')
ylabel('cond_\infty(A)')
title('Condizionamento')

subplot(2,1,2)
plot(n_vec,errInf,'o-','LineWidth',2)
grid on
xlabel('n')
ylabel('Errore infinito')
title('Errore sulla soluzione')