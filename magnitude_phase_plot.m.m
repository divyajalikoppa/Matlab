clc;
clear all;
close all;
N=input('enter the N-point value=');
X=input('enter the sequence =');
L=length(X);
if(N<L)
    error('N must be greater than or equal to L');
end
X=[X,zeros(1,N-L)];
for n=0:1:N-1
    for K=0:1:N-1
    wn=exp(-j*2*pi*K*n/N);
    w(X+1,n+1)=wn;
    end
end
Xk=wn*X';
K=0:1:N-1;
subplot(2,1,1);
stem(K,abs(Xk));
xlabel('X');
ylabel('|X(k)|');
title('magnitude plot of X(k)');
y=angle(Xk);
ang=rad2deg(y);
subplot(2,1,2);
stem(K,ang);
xlabel('k');
ylabel('angle in degree');
title('phase plot of X(k)');

