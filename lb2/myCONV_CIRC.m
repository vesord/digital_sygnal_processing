function myConv = myCONV_CIRC(A,B)

zerosToA = zeros([1, length(B) - 1]);
zerosToB = zeros([1, length(A) - 1]);

rowA = [A zerosToA];
rowB = [B zerosToB];
rowB = fliplr(rowB);

tmpMyConv = zeros([1, length(rowA)]);

len = length(rowA);

for i = 1:len
    rowB = circshift(rowB, 1);
    tmpMyConv(i) = sum(rowA .* rowB);
end

myConv = tmpMyConv;