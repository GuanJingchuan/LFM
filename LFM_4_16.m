% B=4M  T=16us  1�������� 12λ���� 
clear all;
clc;
B=4e6;
T=16e-6;
K=B/T;
fs=B;
Ts=1/fs;
N=round(T/Ts);
t=-T/2:1/fs:T/2-1/fs;
s=exp(j*pi*K*t.^2);
f=conj(s);                                  %���Ե�Ƶ�źŵ�ƥ���˲���
fham=f.*hamming(N)';                  %�Ӻ��������ƥ���˲���
%%%%%%%%%%%%%%%%%%%%%%%%���㵽����ת��%%%%%%%%%%%%%%%%%
s_real=real(s);
s_image=imag(s);
S_I=[zeros(1,96),s_real,zeros(1,96)];
S_Q=[zeros(1,96),s_image,zeros(1,96)];
maxv=max(max(S_I),max(S_Q));
S_I=fix((2.^11-1)*(S_I/maxv));
S_Q=fix((2.^11-1)*(S_Q/maxv));
s_d=S_I+j*S_Q;                   %��������Ե�Ƶ�ź�
%%%%%%%%%%%%%%%%%%%%%%%����mif�ļ�%%%%%%%%%%%%%%%%%%%%%%%
% S_I_bd=y2b(S_I,12);
% miffile('E:\mydesigns\lfm_match_64\mif\lfm_i.mif',S_I_bd,12,256);
% S_Q_bd=y2b(S_Q,12);
% miffile('E:\mydesigns\lfm_match_64\mif\lfm_q.mif',S_Q_bd,12,256);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%************************match_filter*****************
f_real=real(f);
f_image=imag(f);
maxf=max(max(f_real),max(f_image));
f_real_d=fix((2^11-1)*(f_real/maxf));
% fid=fopen('E:\mydesigns\lfm_match_64\coef\fir_i_64.dat','w');
% fprintf(fid,'%d\n',f_real_d);
% fclose(fid);
f_image_d=fix((2^11-1)*(f_image/maxf));
% fid=fopen('E:\mydesigns\lfm_match_64\coef\fir_q_64.dat','w');
% fprintf(fid,'%d\n',f_image_d);
% fclose(fid);
f_d=f_real_d+j*f_image_d;                   %�����ƥ���˲���
%*************************match_filter_ham*****************
fham_real=real(fham);
fham_image=imag(fham);
maxfham=max(max(fham_real),max(fham_image));
fham_real_d=fix((2.^11-1)*(fham_real/maxfham));
% fid=fopen('E:\mydesigns\lfm_match_64\coef\fir_ham_i_64.dat','w');
% fprintf(fid,'%d\n',fham_real_d);
% fclose(fid);
fham_image_d=fix((2.^11-1)*(fham_image/maxfham));
% fid=fopen('E:\mydesigns\lfm_match_64\coef\fir_ham_q_64.dat','w');
% fprintf(fid,'%d\n',fham_image_d);
% fclose(fid);
fham_d=fham_real_d+j*fham_image_d;          %����ļӺ��������ƥ���˲���

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



ya=fix(abs(conv(s_d,f_d)));
yham=fix(abs(conv(s_d,fham_d))/2.^12);

l1=length(ya);
t1=-T/2:T/(l1-1):T/2;
l2=length(yham);
t2=-T/2:T/(l2-1):T/2;

figure;
subplot(211);plot(t1,20*log10(ya/max(ya)));grid on;xlabel('ʱ��(s)');ylabel('����(dB)');title('δ�Ӵ�ʱʱ����ѹ���');%axis([-T/2 T/2 -90 0]);
subplot(212);plot(t2,20*log10(yham/max(yham)));grid on;xlabel('ʱ��(s)');ylabel('����(dB)');title('�Ӵ�(������)�����ѹ���');%axis([-T/2 T/2 -90 0]);
%*************************************



