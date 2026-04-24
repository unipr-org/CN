close all
clear
clc
%%%%%%%%%% Es. 1
%%%%%%%%%%%%%%%%%%%%%%%%%turno 1
clear 
clc
coeff=[1 0 0 0 -1 3]; %x^5-x+3
radice=roots(coeff);
a=-2; b=0;
xx=linspace(a,b);
plot(xx,polyval(coeff,xx))
title('grafico funzione')
x0=a;
x1=b;
x=[];
toll=10^-8;
while abs(x1-x0)>toll %incremento
    x0=x1;
    x=[x; x0];
    x1=x0-polyval(coeff,x0)*(b-a)/...
        (polyval(coeff,b)-polyval(coeff,a));
end
figure
semilogy(1:length(x),abs(radice(1)-x))
title('grafico errore incremento')
xlabel('numero iterazioni')
% %%%%%%%%%%%%%%%%%%%%%%%%%turno 2
% clear 
% clc
% coeff=[1 0 0 0 -1 3];
% radice=roots(coeff);
% a=-2; b=0;
% xx=linspace(a,b);
% figure
% plot(xx,polyval(coeff,xx))
% title('grafico funzione')
% x0=a;
% x1=b;
% x=[];
% toll=10^-8;
% while abs(polyval(coeff,x1))>toll %residuo
%     x0=x1;
%     x=[x; x0];
%     x1=x0-polyval(coeff,x0)*(b-a)/(polyval(coeff,b)-polyval(coeff,a));
% end
% figure
% semilogy(1:length(x),abs(radice(1)-x))
% title('grafico errore residuo')
% xlabel('numero iterazioni')
