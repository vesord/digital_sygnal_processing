// Task 2 - c
// Generate 
// Harmonical sygnal with variable frequency 
// f = E * t^2 + F 
// at t = 0, f = 4 * N;
// at t = 2, f = 2 * N;

// SciLab does not support function chirp() and doesn't have its equivalent.
// Probably Scilab has, but I don't understand how to use it. (czt() function
// does z-transfom whatever it is. Thats all I found for chirp in scilab).
//
// So we need to do some calculations :D

// Calculations:
// f = E * t^2 + F;
// 4 * N = F
// 2 * N = E * 4 + F
// 
// F = N * 4
//
// 2 * N = E * 4 + 4 * N
// E = -1/2 * N
//
// f = -1/2 * N * t^2 + 4 * N
//
// As function is lineary decreasing then max(f) would be at t = 0.
// f_max = 4 * N
//
// As frequency can't be bellow 0 then t_max is 
// 0 = -1/2 * N * t^2 + 4 * N
// t_max = sqrt(8)

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

N = 1;
A = 1;

f_max = 4 * N;
t_max = sqrt(8);
	
Fs = f_max * 10;
dt = 1 / Fs;
t = 0:dt:t_max;

f = -1/2 .* N .* t .* t + 4 .* N;

sint_varf = A * sin(2 .* %pi .* f .* t);

plot(t, sint_varf);
xtitle('Harmonical sygnal with variable frequency', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];
cur_axes.data_bounds = [0, A * -1.2; t_max, A * 1.2];
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
