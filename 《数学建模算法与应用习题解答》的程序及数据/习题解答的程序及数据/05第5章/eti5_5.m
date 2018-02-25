clc, clear
syms x
y=(x^2+2*x+3)*exp(-2*x);
dy=diff(y);
ezplot(dy,[0,1]), hold on
x0=0:0.1:1; y0=(x0.^2+2*x0+3).*exp(-2*x0);
pp=csape(x0,y0); %进行三次样条插值
ddy=fnder(pp); %求样条函数的导数函数，结果为pp数据结构
ddy0=ppval(ddy,x0); %计算样条函数的导数在离散点上的取值
plot(x0,ddy0,'-P') %画出数值导数对应的数据点
legend('理论值','数值解',0)
title('理论值与数值解的对照')
