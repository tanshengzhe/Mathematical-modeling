clc, clear
x0=0:400:5600; y0=4800:-400:0;
z0=load('data51.txt');
pp=csape({x0,y0},z0'); %进行二维样条插值
x=0:50:5600; y=4800:-50:0;
z=fnval(pp,{x,y}); %求插值后的高程值
subplot(1,2,1),c=contourf(x,y,z',10);clabel(c)  %画等高线
subplot(1,2,2),surf(x,y,z') %画三维表面图
