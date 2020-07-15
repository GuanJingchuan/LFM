% 时域加窗(海明窗,切比雪夫窗)
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
fham=conj(s).*hamming(N)';        %海明加权
yham=abs(conv(s,fham));
l2=length(yham);
t2=-T/2:T/(l2-1):T/2;
fche=conj(s).*chebwin(N)';        %切比雪夫加权
yche=abs(conv(s,fche));
l3=length(yche);
t3=-T/2:T/(l3-1):T/2;
figure;plot(t1,20*log10(ya/max(ya)));grid on;xlabel('时间(s)');ylabel('幅度(dB)');title('未加窗时时域脉压输出');axis([-T/2 T/2 -90 0]);
figure;plot(t2,20*log10(yham/max(yham)));grid on;xlabel('时间(s)');ylabel('幅度(dB)');title('加窗(海明窗)后的脉压输出');axis([-T/2 T/2 -90 0]);
figure;plot(t3,20*log10(yche/max(yche)));grid on;xlabel('时间(s)');ylabel('幅度(dB)');title('加窗(切比雪夫窗)后的脉压输出');axis([-T/2 T/2 -90 0]);