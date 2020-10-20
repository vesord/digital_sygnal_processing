% Написать программу, вычисляющую циклическую свертку через ДПФ, оформить ее
% в виде M-функции myCONV_FFT(A,B). Сравнить результаты работы программы с
% функцией conv(A,B).

a = 1:1:20;
b = 1:3:61;

con_matlab = conv(a, b);
con_my_FFT = myCONV_FFT(a, b);
con_my_CIRC = myCONV_CIRC(a, b);

figure();

subplot(3, 1, 1);
stem(con_matlab);
title('MatLab conv');

subplot(3, 1, 2);
stem(con_my_FFT);
title('My conv FFT');

subplot(3, 1, 3);
stem(con_my_CIRC);
title('My conv CIRC');
