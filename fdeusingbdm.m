%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
%% Values of m, c, k, alpha, t0, T
m=1;
c=0.2;
k=1;
t0=0;
T=30;
n=300;
h=(T-t0)/n;
%% Forcing function
F=zeros(n+1,1);
%% Initial Conditions
y(1)=0;
y(2)=y(1)+(1*h);
% a=1;
for a=0.5:0.1:1
    for j=1:n
        w(j)=((-1)^j)*((gamma(a+1))/((gamma(j+1))*(gamma(a-j+1))));
    end
    for i=3:n+1
        B=0;
        for j=2:i
            B=B+(w(j-1)*y(i+1-j));
        end
        y(i)=(((h^2*(F(i)))+(m*(2*y(i-1)-y(i-2)))-(c*h^(2-a)*B))/(m+(k*(h^(2-a)))+k*(h^2)));
    end

    plot(t0:h:T,y);
    hold on;
    xlabel('Time (t)');
    ylabel('y(t)')
    %% Curve fitting X=At^C
    [X,t]=findpeaks(y,t0:h:T);
%     Td=diff(t);
    a1=log(X');
    a2=log(t');
    a3=length(a2);
    a4=[ones(a3,1),a2];
    phi=inv(a4'*a4)*a4'*a1;
    A(((10*a)-4))=exp(phi(1));
    C(((10*a)-4))=phi(2);
end
% legend('a=0.5','a=0.6','a=0.7','a=0.8','a=0.9','a=1');.

