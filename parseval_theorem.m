clc;
clear all;
close all;
N=input('enter N-pt DFT= ');
x=input('enter the 1ST sequence = ');
y=input('enter the 2ND sequence = ');
LHS=sum(x.*conj(y));
X=fft(x,N);
Y=fft(y,N);
RHS=1/N.*sum(X.*conj(Y));
if(LHS==RHS)
disp('parsvels property is satisfied');
else
    disp('parsvels property is not satisfied');
end
