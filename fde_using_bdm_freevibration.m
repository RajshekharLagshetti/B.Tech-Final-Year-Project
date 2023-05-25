%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
%% Values of m, c, k, alpha, t0, T
m=1;
c=0.2;
k=1;
t0=0;
T=20;
n=100;
h=(T-t0)/n;
%% Forcing function
F=zeros(n+1,1);
%% Initial Conditions
y(1)=0;
y(2)=y(1)+(1*h);
Td=[];
% for c=0.05:0.05:0.3
% a=0.5;
for a=0.5:0.1:1
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
    figure(1);
    plot(t0:h:T,y);
    hold on;
    xlabel('Time (sec)');
    ylabel('Response');
%     %% Curve fitting X=At^C
%     [X,t]=findpeaks(y,t0:h:T);
%     Td=[Td;diff(t)];
%     del=(log(X(1)/X(length(X))))/((length(X))-1);
%     Xeta=del/(2*pi);
%     cf=(sqrt(4*k*m)*Xeta);
%     a1=log(X');
%     a2=log(t');
%     a3=length(a2);
%     a4=[ones(a3,1),a2];
%     phi=inv(a4'*a4)*a4'*a1;
%     A(((10*a)-4))=exp(phi(1));
%     C(((10*a)-4))=phi(2);
%     refline(0,0);
%     plot(log(t0:h:T),log(y));
%     plot(t0:h:T,((0.2/sqrt(pi))*((t0:h:T).^-a)));
%     hold on;
%     plot(t0:h:T,((0.1/sqrt(pi))*((t0:h:T).^-(a+1))));
%     plot(t0:h:T,A*((t0:h:T).^C));
end
refline(0,0);
leg=legend('a=0.5','a=0.6','a=0.7','a=0.8','a=0.9','a=1','refline');
% set(leg,'position',[0 0 0.2 0.2]);
set(leg,'fontsize',15);
% end
% legend('c=0.05','c=0.1','c=0.15','c=0.2','0.25','0.3');
% legend('c=1','c=10','c=100');
%% fft
% Fs=1/T;
% L=size(y,2);
% Y=fft(y);
% P2 = abs(Y);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% figure;
% f = 0:Fs:(1)/(2*h);
% plot(f,P1); 
% title('Single-Sided Amplitude Spectrum of y(t)');
% xlabel('f (Hz)');
% ylabel('|A(f)|');

%% Viscous Damping
% tspan=t0:h:T;
% xe=c/(sqrt(2*k*m));
% B=0;
% wn=sqrt(k/m);
% wd=wn*(sqrt(1-(xe^2)));
% D=((1+(xe*wn*B))/wd);
% x=((exp(-(xe*wn*tspan))).*((B*cos(wd*tspan))+(D*sin(wd*tspan))));
% figure(1);
% plot(t0:h:T,x,'b');
% xlabel('Time (t)');
% ylabel('y(t)');
% legend('a=0.5 (Using BDM)','viscous damping');