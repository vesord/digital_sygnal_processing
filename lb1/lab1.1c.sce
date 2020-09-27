// Task 1 - c
// Generate 
// c: експоненту (знакопостоянную убывающую, знакопеременную возрастающую)
// Построить графики используя функцию stem()

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

Fs = 4;
dt = 1 / Fs; 

x = -5:dt:10;
y = exp(-x);

subplot(2, 1, 1);
plot2d3(x, y);
xtitle('Constant-sign decreasing exponent', 'x', 'exp(-x)');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-2, -1; 4, 6];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;

y2 = sin(x) .* exp(x);

subplot(2, 1, 2);
plot2d3(x, y2);
xgrid();
xtitle('Sign-variable increasing exponent', 'x', 'sin(x) * exp(x)');
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-5, -10; 10, 20];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
