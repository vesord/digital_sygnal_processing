// Task 2 - e
// Generate 
// Harmonical sygnal with variable amplitude
// f = 2.5 * N
// A = 2 * |sin(2t)|

clear;

//figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

N = 1;
f = 2.5 * N;
Fs = f * 10;
dt = 1 / Fs;
t_max = 8;
t = 0:dt:t_max;

A = 2 * abs(sin(t));

sint_var_amp = A .* sin(2 * %pi * f * t);

plot(t, sint_var_amp);
xtitle('Harmonical sygnal with variable amplitude', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];
cur_axes.data_bounds = [0, max(A) * -1.2; t_max, max(A) * 1.2];
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
