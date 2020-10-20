% Ќаписать программу, вычисл€ющую ковариацию через ƒѕ‘, оформить ее в виде
% M-функции myCOV_FFT(A,B). —равнить результаты работы программы с функцией
% MATLAB xcorr(A,B,ТnoneТ).

a = 1:1:20;
b = 1:1:20;

cov_matlab = xcorr(a, b, 'none');
cov_my_FFT = myCOV_FFT(a, b);

figure();

subplot(2, 1, 1);
stem(cov_matlab);
title('MatLab conv');

subplot(2, 1, 2);
stem(cov_my_FFT);
title('My conv FFT');
