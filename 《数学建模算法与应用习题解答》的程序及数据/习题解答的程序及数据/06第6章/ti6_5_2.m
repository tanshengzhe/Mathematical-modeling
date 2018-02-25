clc, clear
yy=@(x)1-1/gamma(3)*x.^2+2/gamma(5)*x.^4-9/gamma(7)*x.^6+55/gamma(9)*x.^8;
x1=0:0.1:2;
y1=yy(x1) %求级数解前5项对应的函数值
plot(x1,y1,'P-'), hold on
dy=@(x,y)[y(2);-y(1)*cos(x)]; %定义微分方程右端项的匿名函数
[x2,y2]=ode45(dy,[0,2],[1;0]);
plot(x2,y2(:,1),'*-r')
legend('级数近似解','数值解',0)
