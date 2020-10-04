// Task 2 - b
// Generate 
// Harmonical sygnal with 5 * N frequency, amplitude N + 1, and 
// normal noize \sigma = 0.1 * N + 1, \mu = (-1)^N * 0.2

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

N = 1;
A = N + 10;
f = N * 5;
Fs = f * 100;
dt = 1 / Fs; 
sigma = 0.1 * N + 1;
mu = (-1)^N * 0.2;

t = 0:dt:5;
sint = A * sin(2 * %pi * f * t);

rand("seed", 1);		//	Set seed for reproducible behavior
rand("normal");			//	configure rand() function
noise = sigma * rand(t) + mu;

sint_noise = sint + noise;

plot(t, sint_noise);
xtitle('Harmonical sygnal with noise', 't, s', 'Amplitude');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];
cur_axes.data_bounds = [0, A * -1.2 - 2; 3 / f, A * 1.2 + 2];
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
