// Task 2 - d
// Generate 
// Harmonical sygnal with variable frequency
// at t = 0		f = 2 * N
// at t = 0.75	f =  120 - N
// linear and loarithmic laws

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

N = 1;
A = 1;

// Okay, calculations again:


// ---LINEAR LAW---
//
// f = K * t + B
// B = 2 * N
//
// 120 - N = 3/4 * K + 2 * N
// K = (4 * N - 480 + 8 * N) / 3
// K = 4 * N + 160
// 
// f = (4 * N + 160) * t + 2 * N
//
// Because function is lineary increasing we need to set max time of emulation

t_max = 5;

// By t_max we can get f_max

f_max = (4 * N + 160) * t_max + 2 * N;

// As phase is an integral of frequency we found:
// \fi = integrate((4 * N + 160) * t + 2 * N)dt)
// \fi = (2 * N + 80) * t^2 + 2 * N * t 

Fs = f_max * 10;
dt = 1 / Fs;
t = 0:dt:t_max;

f = (4 * N + 160) * t + 2 * N;
fi = (2 .* N + 80) .* t^2 + 2 .* N .* t;


sint_varf_lin = A * sin(2 .* %pi .* fi);

subplot(2,1,1);
plot(t, sint_varf_lin);
xtitle('Harmonical sygnal with variable frequency, linear change', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [0, A * -1.2; 0.20, A * 1.2];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;


// ---LOGARITHMIC LAW---
//
// f = K * ln(t) + B
//
// Let's take e << 1/Fs, e = 0.00001
//
// 2 * N = K * ln(0 + e) + B
// 120 - N = K * ln(0.75 + e) + B 
//
// Thx WolframAlpha for solving...:
// f = (10.6902 - 0.2672 * N) * ln(t) + 123.075 - 1.0769 * N

// As phase is an integral of frequency we found:
// \fi = integrate(((10.6902 - 0.2672 * N) * ln(t) + 123.075 - 1.0769 * N)dt)
// \fi = (10.6902 - 0.2672 * N) * (t * ln(t) - t) + 123.075 * t + 1.0769 * N * t

// Because function is increasing we need to set max time of emulation

t_max = 5;

// By t_max we can get f_max

f_max = (10.6902 - 0.2672 * N) * log(5) + 123.075 - 1.0769 * N;
Fs = f_max * 10;
dt = 1 / Fs;
t = dt:dt:t_max;

f = (10.6902 - 0.2672 * N) * log(t) + 123.075 - 1.0769 * N;
fi = (10.6902 - 0.2672 .* N) .* (t .* log(t) - t) + 123.075 .* t + 1.0769 .* N .* t

sint_varf_log = A * sin(2 .* %pi .* fi);

subplot(2,1,2);
plot(t, sint_varf_log);
xtitle('Harmonical sygnal with variable frequency, logarithmic change', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [0, A * -1.2; 0.4, A * 1.2];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
