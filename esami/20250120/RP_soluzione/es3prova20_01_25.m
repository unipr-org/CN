clc
clear

f = @(x) cos(x) - 0.558;
a=0;
b=1;
toll= 10^5;
max=20;
rad = fzero(f,[a,b])
rad2 = bi(f,a,b,toll,max)