function example7_3()
%7.1.3.3传染病模型
%用Matlab软件求解为:
y=dsolve('Dy=0.1*y*(1-y)','y(0)=0.09','x')    %求解此微分方程
ezplot(y,[0,60])                          %画出微分方程的图像
ezplot('0.1*y*(1-y)',[0,1])                 %画出y的导数的图像
