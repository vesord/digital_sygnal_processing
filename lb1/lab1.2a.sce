// Task 2 - a
// Generate 
// Harmonical sygnal with 2.5 * N frequency and amplitude 1

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

N = 1;
A = 1;
f = N * 2.5;
Fs = f * 10;
dt = 1 / Fs; 

t = 0:dt:5;
sint = A * sin(2 * %pi * f * t);

plot(t, sint);
xtitle('Harmonical sygnal, y(t) = 1 * sin(2 * pi * f * t)', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [0, -1.2; 1.3, 1.2];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
