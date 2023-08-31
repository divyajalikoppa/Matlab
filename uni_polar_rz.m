clc;
clear all;
close all;
warning off;

n=input('enter the input sequence');
for i=1:length(n)
    if n(i)==1
        m(i)=5;
    else m(i)=-5;
    end
end

a=0;
b=0.5;
i=1;
t=0:0.01:length(n);
for j=1:length(t)
    if t(j)>=a&&t(j)<=b
         y(j)=m(i);
    elseif t(j)>b&&t(j)==i
         y(j)=0;
    else
         i=i+1;
         a=a+1;
         b=b+1;
    end
    
 end

 plot(t,y);
 axis([0 length(n) -5 5]);
 grid on;
