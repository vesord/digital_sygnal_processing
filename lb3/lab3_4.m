% ��� �������� ������� ������������� (�, ��) � ����� ����� ��� (B, �����) ����������
% ���������� ��� (��� ��� �� ������� df=Fs/N). A � � ����� �� ������� ����.
% ��������� ������� �������� � � D ��� ������� y = sin(2piCt) + sin(2piDt) ����� �������,
% ����� ���� ��������� �������� � ������ ��� (���� ������ df: 10df, 20df ��� ��.), �
% ������ �������� ����� ��������� (10.5 df). ��������� ����������� ������.

Fs = 512;
n = 64;
df = Fs/n;
dt = 1 / Fs; t = 0:dt:1;

C = 7 * df;
D = 2 * df + df/2;

y = sin(2 * pi * C * t) + sin(2 * pi * D * t);
spm = PSD(y, n);

figure();
plot(linspace(0, Fs, length(spm)), spm); xlim([0 Fs/2]);
title('y = sin(2 * pi * (7df) * t) + sin(2 * pi * (2df + df/2) * t)');


