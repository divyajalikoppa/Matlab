clc;
clear all;
close all;
A=1;
f=10;
t=0:0.001:1;
y=A*cos(2*pi*f*t);
subplot(2,2,1);
plot(t,y);
xlabel('time in sec');
ylabel('x(t)');
title('continuous signal x(t)');
% under sampling
fs1=10;
n=0:1/fs1:1;
y1=A*cos(2*pi*f*n);
subplot(2,2,2);
stem(n,y1);
hold on;
plot(t,y);
xlabel('n');
ylabel('x(n)');
title('discrete signal x(n) for fs<2fm');


%critical sampling
fs2=20;
n=0:1/fs2:1;
y2=A*cos(2*pi*f*n);
subplot(2,2,3);
stem(n,y2);
hold on;
plot(t,y);
xlabel('n');
ylabel('x(n)');
title('discrete signal x(n) for fs=2fm');


% over sampling
fs3=50;
n=0:1/fs3:1;
y3=A*cos(2*pi*f*n);
subplot(2,2,4);
stem(n,y3);
hold on;
plot(t,y);
xlabel('n');
ylabel('x(n)');
title('discrete signal x(n) for fs>2fm');



