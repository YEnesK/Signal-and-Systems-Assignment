%clc; clear all; close all;

x = input('x fonksiyon degerlerini [] seklinde giriniz : ');
nx = input('x fonksiyon konumlarini [] seklinde giriniz : ');
h = input('h fonksiyon degerlerini [] seklinde giriniz : ');
nh = input('h fonksiyon konumlarini [] seklinde giriniz : ');

disp('x =');
disp(x);
disp(nx);

disp('h =');
disp(h);
disp(nh);
  
% x,nx,h,nh gonderilir -------> y,ny bulunur
[y, ny] = uzunlukbul(x, nx, h, nh);

z = conv(x,h);                                  % Hazir fonksiyon
nz = nx(1) + nh(1) : nx(length(nx)) + nh(length(nh));

figure(1);
stem(nx,x);
xlabel('Zaman');
ylabel('Deger');
title('x Ayrik Fonksiyonu');
hold on

figure(2);
stem(nh,h);
xlabel('Zaman');
ylabel('Deger');
title('h Ayrik Fonksiyonu');
hold on 

figure(3);
stem(ny, y);
xlabel('Zaman');
ylabel('Deger');
title('Ayrik Konvolusyon');
disp('y =');
disp(y);
disp(ny);
hold on

figure(4);
stem(nz,z);
xlabel('Zaman');
ylabel('Deger');
title('Hazir f. Sonucu');
disp('z(hazir fonksiyon) =');
disp(z);
disp(nz);
hold on
  
% Sonuc fonksiyonunun uzunlugu ve konumlari bulunur
function [y, ny] = uzunlukbul(x, nx, h, nh)
    nybegin = nx(1) + nh(1);                  %ilk carpimin konumu
    nyend = nx(length(nx)) + nh(length(nh));  %son carpimin konumu
    ny = nybegin : nyend;                     %y fonksiyonu konumu

    y = konv_hesapla(x, h);
end
  
% Carpimlar toplanir
function [y] = konv_hesapla(x, h)
    l1 = length(x);
    l2 = length(h);
    N = l1 + l2 - 1;                               % y fonksiyonunun eleman sayisi
    for n = 1 : 1 : N
        y(n) = 0;
        for k = 1 : 1 : l1
            if(n - k + 1 >= 1 & n - k + 1 <= l2)
                y(n) = y(n) + x(k) * h(n - k + 1);
            end
        end
    end
end