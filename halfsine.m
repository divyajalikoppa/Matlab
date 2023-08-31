% half sine wave

clc;
clear all;
close all;
warning off;

a=5;
f=1;
t=0:0.01:2;
x=a*sin(2*pi*f*t);
subplot(2,1,1);
plot(t,x,'r');
title('sine wave');

x(x<0)=0;
subplot(2,1,2);
plot(t,x,'b');
title('half sine wave');