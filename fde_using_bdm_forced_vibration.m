%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
%% Values of m, c, k, alpha, t0, T
m=1;
c=0.2;
k=1;
wn=sqrt(k/m);
t0=0;
T=50;
n=500;
h=(T-t0)/n;
A=1;
% for W=0:0.1:4
    % Forcing function
    W=2;
    F=A*sin(W*(t0:h:T));
    % Initial Conditions
    y(1)=0;
    y(2)=y(1)+(0*h);
%     a=0.5;
    for a=0.5:0.1:1
        warning('off','all');
        for j=1:n
            w(j)=((-1)^j)*((gamma(a+1))/((gamma(j+1))*(gamma(a-j+1))));
        end
        for i=3:n+1
            B=0;
            for j=2:i
                B=B+(w(j-1)*y(i+1-j));
            end
            y(i)=(((h^2*(F(i)-k*y(i-1)))+(m*(2*y(i-1)-y(i-2)))-(c*h^(2-a)*B))/(m+(c*(h^(2-a)))));
        end
%     % finding daf
%     z=y(((7*n)/8):n);
%     zmax=max(abs(z));
%     daf(single((100*W)+1))=((k/A)*(zmax));
% figure(1);
% r=(0:0.01:5)/wn;
% plot(r,daf);
    figure(5);
    plot(t0:h:T,y);
    xlabel('Time (sec)');
    ylabel('Response');
    hold on
%% finding timeperiod
%     [X,t]=findpeaks(y,t0:h:T);
%     Td=diff(t);
%% fft
Fs=1/T;
L=size(y,2);
Y=fft(y);
P2 = abs(Y);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure(6);
f = 0:Fs:1/(2*h);
plot(f,P1); 
title('Single-Sided Amplitude Spectrum of y(t)');
xlabel('frequency (Hz)');
ylabel('|Amplitude|');
hold on;
% P1(16:18)=0;
% filtered_signal=ifft(P1);
% figure(5);
% plot(0:2*h:T,filtered_signal);
    end
leg=legend('a=0.5','a=0.6','a=0.7','a=0.8','a=0.9','a=1','refline');
set(leg,'fontsize',15);
%% Table preparation
% [X1,f1]=findpeaks(P1,f);
% fprintf(' %f  \n',f1(1));
% fprintf(' %f  \n',X1(2));
% fprintf(' %f  \n',X1(1)/X1(2));
% end
% figure(1);
% legend('a=0.5','a=0.6','a=0.7','a=0.8','0.9','a=1');
% figure(2);
% legend('a=0.5','a=0.6','a=0.7','a=0.8','0.9','a=1');


