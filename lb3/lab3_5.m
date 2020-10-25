% Сгенерировать гармонический сигнал y = sin(2piCt) + sin(2piDt), частота дискретизации
% А Гц. A, C, D брать из таблицы ниже. При фиксированном C начать приближать частоту
% D к C до тех пор, пока частоты не перестанут четко различаться. Объяснить полученный
% эффект. Выбрать число точек ДПФ N так, чтобы улучшить спектр ДПФ. Объяснить свой
% выбор.

A = 512; B = 64; C = 125; D = 63;

Fs = A; dt = 1 / Fs; t = 0:dt:1;

y_ref = sin(2 * pi * C * t) + sin(2 * pi * D * t);
spm_ref = PSD(y_ref, length(y_ref));

figure();

subplot(3, 1, 1);
plot(linspace(0, Fs, length(spm_ref)), spm_ref); xlim([0 Fs/2]);
title('y reference, C = 125, D = 63, n = length(y)');

D = 124;
y = sin(2 * pi * C * t) + sin(2 * pi * D * t);
spm = PSD(y, length(y));

subplot(3, 1, 2);
plot(linspace(0, Fs, length(spm)), spm); xlim([0 Fs/2]);
title('y, C = 125, D = 124, n = length(y)');

subplot(3, 1, 3);
len_scaler = C * D;
spm_acc = PSD(y, len_scaler);
plot(linspace(0, Fs, length(spm_acc)), spm_acc); xlim([0 Fs/2]);
title(['y, C = 125, D = 124, n = C * D']);
