clc;
clear all;
close all;
N=input('enter N-pt DFT= ');
x=input('enter the sequence = ');
m=input('enter the value of m = ');
y=circshift(x,m);
LHS=fft(y,N);
X=fft(x,N);
wN=exp(-j*2*pi/N);
K=0:1:N-1;
RHS=wN.^(m*K).*X;
LHS1=abs(LHS).^2;
RHS1=abs(RHS).^2;
 
 
if(LHS==RHS)
disp('circular time shift property is satisfied');
else
    disp('circular time shift property is not satisfied');
end

