// Task 1 - c
// Generate 
// c: експоненту (знакопостоянную убывающую, знакопеременную возрастающую)
// Построить графики используя функцию stem()

clear;

figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

Fs = 20;
dt = 1 / Fs; 

x = -5:dt:10;
y = 0.5^x;

subplot(2, 1, 1);
plot2d3(x, y);
xtitle('Constant-sign decreasing exponent', 'x', '0.5^x');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-3, -1; 3, 6];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;

y2 = (-1.5)^x;

subplot(2, 1, 2);
plot2d3(x, y2);
xgrid();
xtitle('Sign-variable increasing exponent', 'x', '(-1.5)^x');
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-1, -10; 5, 10];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;
