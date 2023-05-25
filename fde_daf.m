%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
m=1;
k=2;
wn=sqrt(k/m);
a=0.5;
% c=0.05;
    warning('off','all');
    xe=c/(2*((k*m)^0.5));
    for a=0.5:0.1:1
        d=cos((pi/2)*a);
        for r=0:0.001:2
            daf(single((1000*r)+1))=1./sqrt(((1-(r.^2)).^2)+((4*(1-(r.^2))*d*xe.*(r.^a))/(wn^(1-a)))+(((2*xe*(r.^a))/(wn^(1-a))).^2));
        end
        [X(single(10*a)),x(single(10*a))]=findpeaks(daf,(0:0.001:2));
        figure(1);
        plot((0:0.001:2),daf);
        xlabel('r=w/wn');
        ylabel('DAF');
        hold on;
    end

%     figure(2);
%     a=0.1:0.1:1;
%     plot((a),(X),'-*');
%     grid on;
%     xlabel('fractional order');
%     ylabel('DAF max');
%     legend('daf1=1','daf1=2','daf1=3','daf1=4','daf1=5','daf1=6','daf1=7','daf1=8','daf1=9','daf1=10');
%     hold on;
%     figure(3);
%     plot(log(a),log(X),'-*');
%     grid on;
%     xlabel('ln(fractional order)');
%     ylabel('ln(DAF max)');
%     legend('daf1=1','daf1=2','daf1=3','daf1=4','daf1=5','daf1=6','daf1=7','daf1=8','daf1=9','daf1=10');
%     hold on;