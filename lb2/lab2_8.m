% Сгенерировать сигнал y1 согласно заданию. Вычислить АКФ (автокорреляционную
% функцию) и построить ее график.

Fs = 1024;
dt = 1 / Fs;
t = 0:dt:1;

y1 = sin( 2 * pi * 10 * t );

noise = 1.1 * randn(size(y1)) + 0.1;
acf_noise = xcorr(noise);
acf_sig_noised = xcorr(noise + y1);

figure();

subplot(2, 1, 1);
stem(acf_noise);
title('АКФ шума');
grid on;
xlim([200, 250]);
ylim([-80, 80]);

subplot(2, 1, 2);
stem(acf_sig_noised);
title('АКФ зашумленного сигнала');
xlim([250, 450]);
ylim([-250, 250]);
