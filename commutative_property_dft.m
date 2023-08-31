clc;
clear all;
close all;
x=input('enter input sequence x(n)=');
y=input('enter input sequence y(n)=');
y1=conv(x,y);
y2=conv(y,x);
subplot(2,2,1);
stem(x);
xlabel('k');
ylabel('amplitude');
title('sequence x(n)');
grid on;
 subplot(2,2,2);
stem(y);
xlabel('k');
ylabel('amplitude');
title('sequence x(n)');
subplot(2,2,3);
stem(y);
xlabel('k');
ylabel('amplitude');
title('x(n)*h(n)');
grid on;
subplot(2,2,4);
stem(y2);
xlabel('k');
ylabel('amplitude');
title('x(n)*h(n)');
grid on;
 if(y1==y2)
    disp('commutative property satisfied');
else
    disp('commutative property not satisfied');
end
