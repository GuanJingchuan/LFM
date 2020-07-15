%���Ե�Ƶ�źŵ�ʵ�����鲿��ʱ����ѹ���
clear all;
clc;
T=16e-6;
B=5e6;
K=B/T;
fs=6*B;
Ts=1/fs;
N=T/Ts;
t=-T/2:T/(N-1):T/2;
s=exp(j*pi*K*t.^2);

y=conv(s,conj(s));
len=length(y);
t1=-T/2:T/(len-1):T/2;
figure;plot(t,real(s));grid on;axis([-1.2e-5 1.2e-5 -1 1]);xlabel('ʱ��(s)');ylabel('����');title('LFM�źŵ�I·');
figure;plot(t,imag(s));grid on; axis([-1.2e-5 1.2e-5 -1 1]);xlabel('ʱ��(s)');ylabel('����');title('LFM�źŵ�Q·');
figure;plot(t1,20*log10(abs(y)/max(abs(y))));grid on;axis([-1.2e-5 1.2e-5 -90 0]);xlabel('ʱ��(s)');ylabel('����(dB)');title('ʱ����ѹ��Ĳ���(δ��Ȩ)');
subplot(311);plot(t,real(s));grid on;xlabel('time(s)');ylabel('amplitude(dB)');title('real part of LFM:T=16us,B=4MHz');axis([-T/2 T/2 -1 1]);
subplot(312);plot(t,imag(s));grid on;xlabel('time(s)');ylabel('amplitude(dB)');title('image part of LFM:T=16us,B=4MHz');axis([-T/2 T/2 -1 1]);
subplot(313);plot(t1,20*log10(abs(y)/max(abs(y))));grid on;axis([-1.2e-5 1.2e-5 -90 0]);xlabel('ʱ��(s)');ylabel('����(dB)');title('ʱ����ѹ��Ĳ���(δ��Ȩ)');