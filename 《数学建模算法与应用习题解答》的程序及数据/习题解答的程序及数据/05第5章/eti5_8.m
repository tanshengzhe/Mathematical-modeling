clc, clear
xy0=randint(5,2,[0,10]); %生成观测数据矩阵
F=@(s,xy)s(1)*xy(:,1)+s(2)*xy(:,1).*xy(:,2)+s(3)*xy(:,2)-3; %定义匿名函数
FF=@(s,xy)(s(1)*xy(:,1)+s(2)*xy(:,1).*xy(:,2)+s(3)*xy(:,2)-3).^2;
s0=rand(1,3); %拟合参数的初始值是任意取的
s1=nlinfit(xy0,zeros(length(xy0),1),FF,s0)
s2=lsqcurvefit(FF,s0,xy0,zeros(length(xy0),1))
plot(xy0(:,1),xy0(:,2),'o')
hold on
h=ezplot(@(x,y)F(s1,[x,y]),[0,10,0,10])
colormap([0,0,0]) %画黑色曲线
title('二次曲线拟合'), legend('样本点','拟合曲线',0)
