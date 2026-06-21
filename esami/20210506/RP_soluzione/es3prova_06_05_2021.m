clear
clc
close all

n = 10;

k = 1:10;
alpha_vec = 10.^k;

condA = zeros(size(alpha_vec));
errInf = zeros(size(alpha_vec));

for j = 1:length(alpha_vec)

    alpha = alpha_vec(j);

    A = eye(n) + alpha*diag(ones(n-1,1),-1);

    x_es = ones(n,1);

    b = A*x_es;

    x_num = sost_avanti_pm(alpha,b);

    condA(j) = cond(A,inf);

    errInf(j) = norm(x_es-x_num,inf);

end

subplot(2,1,1)
plot(alpha_vec,condA,'o-','LineWidth',2)
grid on
xlabel('\alpha')
ylabel('cond_\infty(A)')
title('Condizionamento')

subplot(2,1,2)
plot(alpha_vec,errInf,'o-','LineWidth',2)
grid on
xlabel('\alpha')
ylabel('Errore infinito')
title('Errore sulla soluzione')