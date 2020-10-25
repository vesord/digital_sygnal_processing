% С помощью PSD вычислить спектральные плотности мощности сигналов,
% сгенерированных во 2 задании ЛР №1. Построить графики зависимости спектра от
% частоты (f, Гц) на основной полосе частот ([0, 0.5Fs]). Объяснить полученные
% результаты.

figure();


% SIGNAL 1
f = 2.5;
Fs = f * 10; dt = 1 / Fs; t = 0:dt:5;
sig_1 = sin(2 * pi * f * t);

spm = PSD(sig_1, length(sig_1));
subplot(3, 2, 1); 
plot(linspace(0, Fs, length(spm)), spm); xlim([0, Fs / 2]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('freq = 2.5');

% SIGNAL 2
A = 11;
f = 5;
Fs = f * 20; dt = 1 / Fs; t = 0:dt:0.5;
sig_2 = A * sin(2 * pi * f * t) + (2.7 * randn(size(t)) - 1.2);

spm = PSD(sig_2, length(sig_2));
subplot(3, 2, 2); 
plot(linspace(0, Fs, length(spm)), spm); xlim([0, Fs / 2]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('freq = 5, noised');

% SIGNAL 3
f_max = 4;
t_max = sqrt(8);
Fs = f_max * 100; dt = 1 / Fs; t = 0:dt:t_max;
f = -1/2 .* t .* t + 4;
fi = -1/2 .* t.^3 / 3 + 4 .* t;
sig_3 = sin(2 .* pi .* fi);

spm = PSD(sig_3, length(sig_3));
subplot(3, 2, 3); 
plot(linspace(0, Fs, length(spm)), spm); xlim([0, Fs / 20]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('decreasing freq, fi = -1/2 * t^3 / 3 + 4 * t');

% SIGNAL 4
t_max = 5;
f_max = 164 * t_max + 2;
Fs = f_max * 10; dt = 1 / Fs; t = 0:dt:t_max;
f = 164 * t + 2;
fi = 82 .* t.^2 + 2 .* t;
sig_4 = sin(2 .* pi .* fi);

spm = PSD(sig_4, length(sig_4));
subplot(3, 2, 4); 
plot(linspace(0, Fs, length(spm)), spm); xlim([0, Fs / 2]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('increasing freq, f = 82 * t^2 + 2 * t');

% SIGNAL 5
f1 = 100; f2 = 20; f3 = 10; f4 = 21;
f_max = max([f1, f2, f3, f4]);
Fs = f_max * 10;
dt = 1 / Fs; t_max = 0.202; t = 0:dt:t_max;
len = length(t);
f = zeros(size(t));
f(1:len/4) = f1;
f(len/4:len/2) = f2;
f(len/2:len/4*3) = f3;
f(len/4*3:len+1) = f4;
sig_5 = sin(2 .* pi .* f .* t);

spm = PSD(sig_5, length(sig_5));
subplot(3, 2, 5);
plot(linspace(0, Fs, length(spm)), spm); xlim([0, Fs / 2]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('jumping freq, f1 = 100, f2 = 20, f3 = 10, f4 = 21');

% SIGNAL 6
f = 2.5;
Fs = f * 10; dt = 1 / Fs; t_max = 8; t = 0:dt:t_max;
A = 2 * abs(sin(t));
sig_6 = A .* sin(2 * pi * f * t);

spm = PSD(sig_6, length(sig_6));
subplot(3, 2, 6);
plot(linspace(0, Fs, length(spm)), spm); xlim([0, Fs / 2]);
xlabel('f, Hz'); ylabel('|X(f)|^2'); title('variable amplitude, freq = 2.5');


