// Task 2 - e
// Generate 
// Harmonical sygnal with variable frequency, jumping change
// f1 = 100
// f2 = 20 * N
// f3 = 10 * N
// f4 = 20 + N^2

clear;

//figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

N = 1;
A = 1;

f1 = 100;
f2 = 20 * N;
f3 = 10 * N;
f4 = 20 + N^2;

f_max = max([f1, f2, f3, f4]);
Fs = f_max * 10;
dt = 1 / Fs;
t_max = 0.202;
t = 0:dt:t_max;

len = length(t);

f(1: len / 4) = f1;
f(len / 4: len / 2) = f2;
f(len / 2: len / 4 * 3) = f3;
f(len / 4 * 3: len + 1) = f4;

sint_varf_jump = A * sin(2 .* %pi .* f' .* t);

plot(t, sint_varf_jump);
xtitle('Harmonical sygnal with variable frequency, jumping', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [0, A * -1.2; t_max, A * 1.2];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
