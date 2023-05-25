clc
clear all
M=20;
K=30;
m=1;
k=1.5;
wn=sqrt(K/M);
wa=sqrt(k/m);
mu=m/M;
f=wa/wn;
% xe=0.1;
a=0.5;
% for a=0.1:0.1:1;
A=cos((a*pi)/2);
% c=0.32*2*m*wn;
% xe=c/2*m*wn;
for xe=0.01:0.01:0.1
    for g=0:0.001:2
        B=f^2-g^2;
        C=1-(g^2);
        D=2*xe*(g^a)*(wn^(a-1));
        X(single((1000*g)+1))=sqrt((((B^2)+(2*A*D*B)+(D^2))/((((C*B)-(mu*(f*g)^2))^2)+((D*(C-(mu*(g^2))))^2)+((2*A*D)*(C-(mu*(g^2)))*((C*B)-(mu*((f*g)^2)))))));
    end
g=0:0.001:2;
plot(g,X);
xlabel('g=w/wn');
ylabel('X1/Xst');
hold on;
end
% end
