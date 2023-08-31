clc;
clear all;
close all;
warning off;

n=input('enter the input sequence');
for i=1:length(n)
    if n(i)==1
        m(i)=5;
    else
        m(i)=-5;
    end
end

%pulse shaping 

i=1;
t=0:0.01:length(n);
for j=1:length(t)
    if t(j)<=i
        y(j)=m(i);
    else
        i=i+1;
    end
end
plot(t,y);
axis([0 length(n) -5 5]);
grid on;

