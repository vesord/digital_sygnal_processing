function myConv = myCONV_FFT(A,B)

zerosToA = zeros([1, length(B) - 1]);
zerosToB = zeros([1, length(A) - 1]);

rowA = [A zerosToA];
rowB = [B zerosToB];

myConv = ifft(fft(rowA) .* fft(rowB));
