// Task 1 - a
// Generate 
// a: единичный импульс (простой и задержанный)
// Построить графики используя функцию stem()

clear;

//figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

Fs = 5000;
dt = 1 / Fs; 

x = -1:dt:1;

y = ones(x)
delay = 0;
for i = 1:(length(x));
	if (~(x(i) <= delay && x(i + 1) > delay))
		y(i) = 0;
	end
end

subplot(2, 1, 1);
plot2d3(x, y);	// equivalent of "stem()" in Mathlab
xtitle('Impulse', 't, s', 'A');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-1, 0; 1, 1.5];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;

y = ones(x)
delay = 0.35;
for i = 1:(length(x));
	if (~(x(i) <= delay && x(i + 1) > delay))
		y(i) = 0;
	end
end

subplot(2, 1, 2);
plot2d3(x, y);
xgrid();
xtitle('Delayed impulse', 't, s', 'A');
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and ...
cur_axes.data_bounds = [-1, 0; 1, 1.5];	//	... ylim() in MathLab
cur_axes.x_label.font_size = 2;
cur_axes.y_label.font_size = 2;
cur_axes.title.font_size = 2;
cur_axes.font_size = 2;

