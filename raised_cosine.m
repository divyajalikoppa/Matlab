clc;
clear all;
close all;
warning off;
x=linspace(-5,5);
y=sinc(x);
stem(x,y);
title('Raised cosine pulse signal');