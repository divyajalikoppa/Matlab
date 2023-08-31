clc;
clear all;
close all;
x=input('enter the first sequence=');
h=input('enter the second sequence=');
subplot(3,1,1);
stem(x);
subplot(3,1,2);
stem(h);
N1=length(x);
N2=length(h);
N=max(N1,N2)
cir_conv=cconv(x,h);
subplot(3,1,3);
stem(cir_conv);
