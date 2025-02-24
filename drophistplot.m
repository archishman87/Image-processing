function [] = drophistplot(a1,b1,c1,x,v,color,fitcolor)
stairs(x,v,'LineWidth',2,'Color',color,'LineStyle','-')
xf = linspace(x(1),x(end),1000);
vf = a1*exp(-((xf-b1)/c1).^2);%+a2*exp(-((xf-b2)/c2).^2);
hold on
plot(xf,vf,'LineWidth',2,'Color',fitcolor)
end
