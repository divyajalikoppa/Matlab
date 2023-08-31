clc;
clear all;
close all;
N=input('enter N-pt DFT= ');
x1=input('enter the 1st sequence = ');
x2=input('enter the 2nd sequence = ');
a=input('enter the value = ');
b=input('enter the value = ');
Y=(a*x1)+(b*x2);
LHS=fft(Y,N);
X1=fft(x1,N);
X2=fft(x2,N);
RHS=a*X1+b*X2;
if(LHS==RHS)
disp('it is linear');
else
    disp('it is nonlinear');
end
