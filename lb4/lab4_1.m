
N = 1;
A = 0.75 * N;
B = 1.7 * N;
C = 2.3 * N;

Fs = N * 100;
t = 0:1/Fs:(200 / min([A, B, C]));
y = C * sin(2 * pi * A * t) + C * sin(2 * pi * B * t);

var_y = var(y);
SNR_1 = 1.1;
SNR_5 = 5;
var_n_1 = var_y / SNR_1;
var_n_5 = var_y / SNR_5;
n_1 = randn(size(t)) * var_n_1^0.5;
n_5 = randn(size(t)) * var_n_5^0.5;
y_n_1 = y + n_1;
y_n_5 = y + n_5;

figure(2);
w_bartlett = bartlett(length(y_n_5));
yw_bartlett = y_n_5.*w_bartlett';
sp_sig = abs(fft(y_n_5)).^2;
sp_bartlett = abs(fft(yw_bartlett)).^2;
fr = linspace(0,Fs,length(y_n_5));
subplot(2,2,1); plot(t,y_n_5); xlim([0,270]); title("signal, 200 periods");
subplot(2,2,2); plot(t,yw_bartlett); xlim([0,270]); title("signal * bartlett");
subplot(2,2,3); plot(fr,sp_sig); xlim([0,Fs/2]); title("SP signal");
subplot(2,2,4); plot(fr,sp_bartlett); xlim([0,Fs/2]); title("SP signal * bartlett");

figure(3);
w_rectangle = boxcar(length(y_n_5));
yw_rectangle = y_n_5.*w_rectangle';
sp_sig = abs(fft(y_n_5)).^2;
sp_rectangle = abs(fft(yw_rectangle)).^2;
fr = linspace(0,Fs,length(y_n_5));
subplot(2,2,1); plot(t,y_n_5); xlim([0,270]); title("signal, 200 periods");
subplot(2,2,2); plot(t,yw_rectangle); xlim([0,270]); title("signal * boxcar");
subplot(2,2,3); plot(fr,sp_sig); xlim([0,Fs/2]); title("SP signal");
subplot(2,2,4); plot(fr,sp_rectangle); xlim([0,Fs/2]); title("SP signal * boxcar");

figure(4);
w_chebyshev = chebwin(length(y_n_5));
yw_chebyshev = y_n_5.*w_chebyshev';
sp_sig = abs(fft(y_n_5)).^2;
sp_chebyshev = abs(fft(yw_chebyshev)).^2;
fr = linspace(0,Fs,length(y_n_5));
subplot(2,2,1); plot(t,y_n_5); xlim([0,270]); title("signal, 200 periods");
subplot(2,2,2); plot(t,yw_chebyshev); xlim([0,270]); title("signal * chebyshev");
subplot(2,2,3); plot(fr,sp_sig); xlim([0,Fs/2]); title("SP signal");
subplot(2,2,4); plot(fr,sp_chebyshev); xlim([0,Fs/2]); title("SP signal * chebyshev");


