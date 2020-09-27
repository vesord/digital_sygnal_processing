// Task 1
// Generate harmonical sygnal with f = 250 Hz and plot it.

clear;

/*
**		SERIES CREATION
*/

Fs = 5000; // Frequency
dt = 1 / Fs; // Step
t = 0:dt:1;
y = sin(2 * %pi * 250 * t);
y2 = cos(2 * %pi * 250 * t);


//figure;
scf(0);		//	select (or create) current figure
clf();		//	clear figure

/*
**		CREATE 1st PLOT
*/

disp("Im creating 1st plot!");

subplot(2,2,1);
plot(t, y, 'Color', 'r');
title('Sin');
xlabel('t, s');
ylabel('A');
xgrid();		//	equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and
cur_axes.data_bounds = [0, -1; 0.025, 1];	//	ylim() in MathLab


/*
**		CREATE 2nd PLOT
*/

disp("Im creating 2nd plot!");

subplot(2,2,2);
plot(t, y2, 'Color', 'b');
title('Cos');
xlabel('t, s');
ylabel('A');
xgrid(1, 1, 2);		// equivalent of "grid on;" in MathLab
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and
cur_axes.data_bounds = [0, -1; 0.025, 1];	//	ylim() in MathLab

/*
**		CREATE 3rd PLOT
*/

subplot(2,2,3);
plot2d3(t, y2);		//	equivalent of stem() in MathLab
xlabel("t, s");
ylabel("A");
title("plot2d3 (Cos)");
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and
cur_axes.data_bounds = [0, -1; 0.025, 1];	//	ylim() in MathLab

/*
**		CREATE 4th PLOT
*/

mean = 0.01;
variance = 0.1;
rand("normal");

//n = СРЕДНЕ_КВ_ОТКЛ * rand(size(y), "normal") + МАТ_ОЖИДАНИЕ; 
//n = variance * rand(size(y), "normal") + mean; 
n = variance * rand(y) + mean;

y = y + n;		//	ЗАШУМЛЕННЫЙ СИГНАЛ
subplot(2,2,4);
plot(t, y);
xlabel("t, s");
ylabel("A");
title("Sin with noise");
cur_axes = gca();
cur_axes.tight_limits = ["on", "on"];		//	equivalent of xlim() and
cur_axes.data_bounds = [0, -2; 0.02, 2];	//	ylim() in MathLab

subplot(2,2,4);
plot2d3(n);


// chirp - частотная модуляция
// для задания диапазона от 100Гц до 500Гц, линейная
// c = chirp(t, 100, 0.5, 500, 'logarithmic')  // бывают линейная, квадратичная, логарифмическая
// plot(t, c)

// f(t) = f0 + kt {t = 0, f = 100; t = 1, f = 500} 
// получить функцию скорости, проинтегрировать, получить нужную функцию расстояния, получить нужную модулюяцию, вместо chirp

//амплитудная модуляция
// y = sin(2 * pi * 100 * t).* 2 .* sin(pi * t);

//cоздаем вектор частот
// f = ones(size(t))
// i = round(length(f) / 2)
// f(1:i) = 100;
// f(i+1:end) = 700
// y = sin(2 * pi * f .* t)
