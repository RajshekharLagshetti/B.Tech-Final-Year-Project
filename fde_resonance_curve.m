%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
m=1;
k=2;
wn=sqrt(k/m);
% a=0.5;
c=0.1;
% for c=0.1:0.1:0.5
    warning('off','all');
    xe=c/(2*((k*m)^0.5));
    for a=0.5:0.1:1
        d=cos((pi*a)/2);
        for r=0:0.001:2
            daf(single((1000*r)+1))=(sqrt(1+(4*d*xe*(wn^(a-1))*(r^a))+(4*(xe^2)*(wn^(2*(a-1)))*(r^(2*a))))./sqrt(((1-(r.^2)).^2)+((4*(1-(r.^2))*d*xe.*(r.^a))/(wn^(1-a)))+(((2*xe*(r.^a))/(wn^(1-a))).^2)));
        end
        [X(single(10*a)),x(single(10*a))]=findpeaks(daf,(0:0.001:2));
        figure(1);
        plot((0:0.001:2),daf);
        xlabel('r=w/wn');
        ylabel('transmissibility');
        hold on;
    end
    
%     figure(2);
%     a=0.1:0.1:1;
%     plot((a),(X),'-*');
%     grid on;
%     xlabel('fractional order');
%     ylabel('DAF max');
%     legend('c=0.1','c=0.2','c=0.3','c=0.4','c=0.5');
%     hold on;
%     figure(3);
%     plot(log(a),log(X),'-*');
%     grid on;
%     xlabel('ln(fractional order)');
%     ylabel('ln(DAF max)');
%     legend('c=0.1','c=0.2','c=0.3','c=0.4','c=0.5');
%     hold on;
% end
refline(0,1);
leg=legend('a=0.5','a=0.6','a=0.7','a=0.8','a=0.9','a=1','refline');
set(leg,'fontsize',15);       