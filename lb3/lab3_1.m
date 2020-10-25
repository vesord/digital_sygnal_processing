% Написать M-функцию, вычисляющую спектральную плотность мощности (СПМ) сигнала
% (квадрат амплитудной частотной характеристики сигнала |F(_omega)|^2. 
% Назвать функцию PSD.

Fs = 10000;
dt = 1 / Fs;
t = 0:dt:0.02;

noise = 1.3 * randn(size(t)) + 0.1;

y = sin(2 * pi * 4000 * t) + 0.5 * sin(2 * pi * 500 * t) + noise;

spm = PSD(y, length(y));

freq = linspace(0, Fs, length(spm));

figure();

subplot(2, 1, 1); plot(t,y); xlim([0 0.01]);
title('y = sin(2 * pi * 4000 * t) + 0.5 * sin(2 * pi * 500 * t) + noise; (mu = 0.1, sigma = 1.3)');
ylabel('A'); xlabel('t, s');

subplot(2, 1, 2); plot(freq,spm); xlim([0 Fs/2]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('PSD');