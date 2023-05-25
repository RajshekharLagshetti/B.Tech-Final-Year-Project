%% mD^2x(t)+cD^ax(t)+kx(t)=F(t)
clc
clear all
m=1;
c=0.2;
k=1;
wn=sqrt(k/m);
for a=0.1:0.1:1
    d=cos((pi*a)/2);
    for w=0:0.01:2
        r=w/wn;
        xe=(((1-(r^2))*d)/(2*(r^a)));
        daf(single((100*w)+1))=1./sqrt(((1-(r.^2)).^2)+(4*(1-(r.^2))*d*xe.*(r.^a))+((2*xe*(r.^a)).^2));
    end
    plot((0:0.01:2/wn),daf)
    hold on;
end