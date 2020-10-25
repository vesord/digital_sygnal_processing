% Сгенерировать сигналы согласно таблице ниже. Частота дискретизации Fs Гц. Получить
% наблюдаемые СПМ. Соответствуют ли они реальным сигналам? Если нет, объясните,
% почему.  

N = 1;
Fs = N; dt = 1 / Fs; t = 1:dt:100;
A = 0.75 * N; B = 1.7 * N; C = 6.3 * N;

figure(1);

y1 = sin(2 * pi * B * t);
y2 = sin(2 * pi * B * t) + sin(2 * pi * C * t);
y3 = sin(2 * pi * C * t);

y1_spm = PSD(y1, length(y1));
y2_spm = PSD(y2, length(y2));
y3_spm = PSD(y3, length(y3));

subplot(3, 1, 1);
plot(linspace(0, Fs, length(y1_spm)), y1_spm); xlim([0 Fs/2]);
title('y1 = sin(2 * pi * 1.7 * t), Fs = 1');

subplot(3, 1, 2);
plot(linspace(0, Fs, length(y2_spm)), y2_spm); xlim([0 Fs/2]);
title('y2 = y1 + sin(2 * pi * 6.3 * t), Fs = 1');

subplot(3, 1, 3);
plot(linspace(0, Fs, length(y3_spm)), y3_spm); xlim([0 Fs/2]);
title('y3 = sin(2 * pi * 6.3 * t), Fs = 1');


% Рассчитать аналитически наблюдаемые частоты

freq_visible_b = rem(B, (Fs / 2));
if rem( fix(B / (Fs / 2)), 2) == 1
    freq_visible_b = Fs/2 - freq_visible_b;
end

freq_visible_c = rem(C, (Fs / 2));
if rem( fix(C / (Fs / 2)), 2) == 1
    freq_visible_c = Fs/2 - freq_visible_c;
end

disp(['Наблюдаемая частота B: ',num2str(freq_visible_b)]);
disp(['Наблюдаемая частота C: ',num2str(freq_visible_c)]);


% Определите частоту дискретизации соответствующую теореме Котельникова и
% постройте «корректные» спектры.

Fs = max([C, B]) * 10; dt = 1 / Fs; t = 0:dt:100;

figure(2);

y1 = sin(2 * pi * B * t);
y2 = sin(2 * pi * B * t) + sin(2 * pi * C * t);
y3 = sin(2 * pi * C * t);

y1_spm = PSD(y1, length(y1));
y2_spm = PSD(y2, length(y2));
y3_spm = PSD(y3, length(y3));

subplot(3, 1, 1);
plot(linspace(0, Fs, length(y1_spm)), y1_spm); xlim([0 Fs/2]);
title(['y3 = sin(2 * pi * 1.7 * t), Fs = ',num2str(Fs)]);

subplot(3, 1, 2);
plot(linspace(0, Fs, length(y2_spm)), y2_spm); xlim([0 Fs/2]);
title(['y3 = y1 + sin(2 * pi * 6.3 * t), Fs = ',num2str(Fs)]);

subplot(3, 1, 3);
plot(linspace(0, Fs, length(y3_spm)), y3_spm); xlim([0 Fs/2]);
title(['y3 = sin(2 * pi * 6.3 * t), Fs = ',num2str(Fs)]);
