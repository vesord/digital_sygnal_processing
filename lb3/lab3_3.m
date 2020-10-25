% Сгенерировать сигналы в соответствии с заданием (см. таблицу ниже). Частота
% дискретизации выбирается согласно теореме Котельникова. Получить СПМ сигналов
% при различных числах точек ДПФ N (второй параметр функции fft, по умолчанию N
% равен длине сигнала, вам необходимо рассмотреть случаи когда N равен длине
% сигнала, больше длины сигнала и меньше длины сигнала). Графики СПМ представить в
% одном графическом окне.

shift_less = .60;
shift_high = 7;

A = 2; B = 12; C = 5;

Fs = 100; dt = 1 / Fs; t = 0:dt:1;

y1 = sin(2 * pi * A * t);
y2 = sin(2 * pi * A * t) + sin(2 * pi * B * t);
y3 = sin(2 * pi * A * t) + sin(2 * pi * B * t) + sin(2 * pi * C * t);

spm_y1_equal = PSD(y1, length(y1));
spm_y2_equal = PSD(y2, length(y2));
spm_y3_equal = PSD(y3, length(y3));

spm_y1_less = PSD(y1, round(length(y1) - length(y1) .* shift_less));
spm_y2_less = PSD(y2, round(length(y2) - length(y2) .* shift_less));
spm_y3_less = PSD(y3, round(length(y3) - length(y3) .* shift_less));

spm_y1_high = PSD(y1, round(length(y1) + length(y1) .* shift_high));
spm_y2_high = PSD(y2, round(length(y2) + length(y2) .* shift_high));
spm_y3_high = PSD(y3, round(length(y3) + length(y3) .* shift_high));

figure();

% EQUAL
subplot(3, 3, 1); xlim([0 Fs/2]);
plot(linspace(0, Fs, length(spm_y1_equal)), spm_y1_equal, 'color', 'r');
xlim([0 Fs/2]); title('y1 = sin(2 * pi * A * t), n = length(y1)');

subplot(3, 3, 2); xlim([0 Fs/2]);
plot(linspace(0, Fs, length(spm_y2_equal)), spm_y2_equal, 'color', 'g');
xlim([0 Fs/2]); title('y2 = y1 + sin(2 * pi * B * t), n = length(y2)');

subplot(3, 3, 3);
plot(linspace(0, Fs, length(spm_y3_equal)), spm_y3_equal, 'color', 'b');
xlim([0 Fs/2]); title('y3 = y2 + sin(2 * pi * A * t), n = length(y3)'); 

% LESS
subplot(3, 3, 4); xlim([0 Fs/2]);
plot(linspace(0, Fs, length(spm_y1_less)), spm_y1_less, 'color', 'r');
xlim([0 Fs/2]); title(['y1, n = ',num2str(shift_less*100),'% less then length(y1)']);

subplot(3, 3, 5); xlim([0 Fs/2]);
plot(linspace(0, Fs, length(spm_y2_less)), spm_y2_less, 'color', 'g');
xlim([0 Fs/2]); title(['y2, n = ',num2str(shift_less*100),'% less then length(y2)']);

subplot(3, 3, 6);
plot(linspace(0, Fs, length(spm_y3_less)), spm_y3_less, 'color', 'b');
xlim([0 Fs/2]); title(['y3, n = ',num2str(shift_less*100),'% less then length(y3)']); 

% GREATHER
subplot(3, 3, 7); xlim([0 Fs/2]);
plot(linspace(0, Fs, length(spm_y1_high)), spm_y1_high, 'color', 'r');
xlim([0 Fs/2]); title(['y1, n = ',num2str(shift_high*100),'% high then length(y1)']);

subplot(3, 3, 8); xlim([0 Fs/2]);
plot(linspace(0, Fs, length(spm_y2_high)), spm_y2_high, 'color', 'g');
xlim([0 Fs/2]); title(['y2, n = ',num2str(shift_high*100),'% high then length(y2)']);

subplot(3, 3, 9);
plot(linspace(0, Fs, length(spm_y3_high)), spm_y3_high, 'color', 'b');
xlim([0 Fs/2]); title(['y3, n = ',num2str(shift_high*100),'% high then length(y3)']); 




