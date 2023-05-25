%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
% Only for a=0.5
clc
clear all
m=1;
c=0.2;
k=1;
t=0:0.1:30;
p=[m,0,0,c,k];
r=(roots(p))';
diffp=[4*m,0,0,c];
dp=polyval(diffp,r);
y=0;
for i=1:4
    y=y+(((r(i))/dp(i))*(exp((r(i)^2)*t)).*(1+erf(sym((r(i))*((t).^(0.5))))));
end
plot(t,y);
y=double(y);
[Yp,tp]=findpeaks(y,t);
Td=diff(tp);
%% curve fitting X=At^C
 a1=log(Yp');
 a2=log(tp');
 a3=length(a2);
 a4=[ones(a3,1),a2];
 phi=inv(a4'*a4)*a4'*a1;
 A=exp(phi(1));
 C=phi(2);

% %% fft
% Fs=1/30;
% L=size(y,2);
% Yf=fft(y);
% P2 = abs(Yf);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% figure;
% f = 0:Fs:1/(2*0.1);
% plot(f,P1); 
% title('Single-Sided Amplitude Spectrum of y(t)');
% xlabel('f (Hz)');
% ylabel('|A(f)|');
legend('a=0.5 (Using BDM)','a=0.5 (Laplace Transform)');
        
