clc;
clear all;
close all;
fcut=input('cutoff freq=');
fs=input('sampling freq=');
N=input('order of filter =');
wc=2*fcut/fs;
L=N+1;
w=rectwin(l);
h=fir1(N,wc,'low',w);
figure(1);
freqz(h);
title('frequency response');
n=0:1:N;
figure(2);
stem(n,h);
title('impulse response')