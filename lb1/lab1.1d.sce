// Task 1 - d
// Generate 
// d: синусоида и косинусоиду
// Построить графики используя функцию stem()

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

Fs = 4;
dt = 1 / Fs; 

x = -5:dt:5;
sinx = sin(x);

subplot(2, 1, 1);
plot2d3(x, sinx);
xtitle('sin(x)', 'x', 'sin(x)');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-5, -1.5; 5, 1.5];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;

cosx = cos(x);

subplot(2, 1, 2);
plot2d3(x, cosx);
xgrid();
xtitle('cos(x)', 'x', 'cos(x)');
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-5, -1.5; 5, 1.5];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
