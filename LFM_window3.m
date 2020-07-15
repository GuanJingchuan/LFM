% ʱ��Ӵ�(������,�б�ѩ��)
clear all;
clc;
B=4e6;
T=16e-6;
K=B/T;
fs=6*B;
Ts=1/fs;
N=floor(T/Ts);
t=-T/2:T/(N-1):T/2;
s=exp(j*pi*K*t.^2);
y=conv(s,conj(s));
ya=abs(y);
l1=length(y);
t1=-T/2:T/(l1-1):T/2;
fham=conj(s).*hamming(N)';        %������Ȩ
yham=abs(conv(s,fham));
l2=length(yham);
t2=-T/2:T/(l2-1):T/2;
fche=conj(s).*chebwin(N)';        %�б�ѩ���Ȩ
yche=abs(conv(s,fche));
l3=length(yche);
t3=-T/2:T/(l3-1):T/2;
figure;plot(t1,20*log10(ya/max(ya)));grid on;xlabel('ʱ��(s)');ylabel('����(dB)');title('δ�Ӵ�ʱʱ����ѹ���');axis([-T/2 T/2 -90 0]);
figure;plot(t2,20*log10(yham/max(yham)));grid on;xlabel('ʱ��(s)');ylabel('����(dB)');title('�Ӵ�(������)�����ѹ���');axis([-T/2 T/2 -90 0]);
figure;plot(t3,20*log10(yche/max(yche)));grid on;xlabel('ʱ��(s)');ylabel('����(dB)');title('�Ӵ�(�б�ѩ��)�����ѹ���');axis([-T/2 T/2 -90 0]);