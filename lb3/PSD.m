function myPSD = PSD(A, n)

ft = fft(A, n);
myPSD = abs(ft).^2;