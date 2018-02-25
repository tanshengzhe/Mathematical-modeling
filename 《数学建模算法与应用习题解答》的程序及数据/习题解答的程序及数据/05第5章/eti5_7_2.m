clc, clear
a=load('data54.txt');
x0=a(1:3:end,:); x0=x0'; x0=x0(:); %提取点的横坐标
y1=a(2:3:end,:); y1=y1'; y1=y1(:); %提出下边界的纵坐标
y2=a(3:3:end,:); y2=y2'; y2=y2(:); %提出上边界的纵坐标
pp1=csape(x0,y1); pp2=csape(x0,y2); %计算三次样条插值函数
dp1=fnder(pp1); dp2=fnder(pp2); %求三次样条插值函数的导数
L=quad(@(x)sqrt(1+fnval(dp1,x).^2)+sqrt(1+fnval(dp2,x).^2),x0(1),x0(end))
S=quad(@(x)fnval(pp2,x)-fnval(pp1,x),x0(1),x0(end))  %计算面积
