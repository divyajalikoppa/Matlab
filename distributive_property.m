clc;
clear all;
close all;
x=input('enter input sequence x(n)=');
y=input('enter input sequence y(n)=');
z=input('enter input sequence z(n)=');
Z1=y+z;
LHS=conv(x,z);
Z2=conv(x,y);
Z3=conv(x,z);
RHS=Z2+Z3;
subplot(2,1,2);
stem('RHS');
xlabel('n');
ylabel('amplitude');
title('sequence x(n)');
grid on;
 
 
if(LHS==RHS)
    disp('DISTRIBUTIVE property satisfied');
else
    disp('DISTRIBUTIVE property not satisfied');
end
