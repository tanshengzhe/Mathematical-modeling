clc, clear
syms x
y=(x^2+2*x+3)*exp(-2*x);
I1=int(y,0,1) %符号函数积分，求精确的积分值
I2=double(I1) %转化成数值类型数据
x0=0:0.1:1; y0=(x0.^2+2*x0+3).*exp(-2*x0); %取数据点
pp=csape(x0,y0); %进行三次样条插值
sy=fnint(pp); %求样条函数的积分函数，结果为pp数据结构
I3=ppval(sy,1)-ppval(sy,0) %求样条函数积分的值
