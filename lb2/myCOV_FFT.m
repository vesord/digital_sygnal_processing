function myCov = myCOV_FFT(A, B)

zerosToA = zeros([1, length(B) - 1]);
zerosToB = zeros([1, length(A) - 1]);

B = fliplr(B);

rowA = [A zerosToA];
rowB = [zerosToB B];

myCov = (1 / length(A)) .* ifft( fft( conj(rowA) ) .* fft(rowB) );

