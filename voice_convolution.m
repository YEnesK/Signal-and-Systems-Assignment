%clc; clear all; close all;
%load ses1

Fs = fs;
y = data;
h = y;
t2 = 0 : 0.5/Fs : (length(y)-1)/Fs;

h(400) = 0.4*h(400);
h(800) = 0.4*h(800);

for i=1 : 40000                                 % durtu fonksiyonu elde edilir
    if i==1 
        i=i+1;
    elseif i==400
        i=i+1;
    elseif i==800
        i=i+1;
    else
        h(i) = 0;
    end
   
end

z = conv(h,y);

figure(1); stem(t2,z'); grid
ylabel('z[n]'); xlabel('n')

sound(10000*z,8000)       % ses cok dusuk olduğundan artirilmistir

