% ��������� ������� ������� A ����� N �������� � ������������ �������� B
% (���������� ����� �������) ����� N ��������. ��������� ������ �������
% ������� �� N. �������� ��������� � ����������� A � B 
% (������������ ��������� biased). ��������� ���������.
%
% A � B � ����� ������� ������ 20 ��������.

rng(1);     % rand() seed
a = rand([1, 20]);
b = rand([1, 20]);
% a = 0:1:19;
% b = 0:3:57;
%a = 0:1:19;
%b = 60:3:117;
%a = 0:1:19;
%b = 0:-1:-19;

b_rev = fliplr(b);

c = conv(a, b_rev);
c_div = c / 20;

cor = xcorr(a, b, 'biased');

figure();

subplot(2, 1, 1);
stem(c_div);
hold on;
title('convolution / N');
xlabel('t, ticks');
ylabel('value');
grid on;

subplot(2, 1, 2);
stem(cor);
hold on;
title('xcorr');
xlabel('t, ticks');
ylabel('value');
grid on;


