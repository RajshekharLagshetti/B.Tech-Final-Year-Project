% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
% Values of m, c, k, alpha, t0, T
m=1;
c=0.2;
k=4;
wn=sqrt(k/m);
t0=0;
T=200;
n=10000;
h=(T-t0)/n;
t=t0:h:T;
% Forcing function
A=1;
% W=wn;
for W=0:0.001:5
    F=A*sin(W*(t0:h:T));
    % Initial Conditions
    y(1)=0;
    y(2)=y(1)+(0*h);
    a=0.5;
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
%         figure(1);
%         plot(t,y);
%         hold on;
    sum1=0.0; sum2=0.0;
    for i=8001:10001
        sum1=sum1+y(i)*cos(W*t(i));
        sum2=sum2+y(i)*sin(W*t(i));
    end
    a1=(2/2000)*sum1;
    b1=(2/2000)*sum2;
    x(single((1000*W)+1))=((k/A)*sqrt((a1^2)+(b1^2)));
%     x=((k/A)*sqrt((a1^2)+(b1^2)))
end
r=((0:0.001:5)/wn);
figure(1);
plot(r,x);
hold on;