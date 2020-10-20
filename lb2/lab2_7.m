% ��� �������� ����� ������� � ������������ � ��������. ���������� �����������
% ����������. ����� �������� ������� �������������� ������� ���������?

A = [1,1,1,1,1];
B = [1,2,3,0,0,0];
C = [2,1,0.5];
D = [1,2,3,4,5];
E = [5,4,5,3,1,0];

f1 = conv(A, A);
f2 = conv(B, C);
f3 = conv(C, B);
f4 = conv( conv(D, E), B );
f5 = conv( D, conv(E, B) );
f6 = conv( D, (E + B) );
f7 = conv(D, E) + conv(D, B);

figure();

subplot(4, 2, 1);
stem(f1);
title('C������� 1 �*�');

subplot(4, 2, 3);
stem(f2);
title('��������������� �*�');

subplot(4, 2, 4);
stem(f3);
title('��������������� �*�');

subplot(4, 2, 5);
stem(f4);
title('��������������� (D*E)*B');

subplot(4, 2, 6);
stem(f5);
title('��������������� D*(E*B)');

subplot(4, 2, 7);
stem(f6);
title('���������������� D*(E+B)');

subplot(4, 2, 8);
stem(f7);
title('���������������� D*E+D*B');


