clc, clear
dyy=@(x,yy)[yy(2); sqrt(1+yy(2)^2)/5/(1-x)]; %定义微分方程右端项的匿名函数
yy0=[0,0]'; %初值条件
[x,yy]=ode45(dyy,[0,1-eps],yy0) %为避免奇异点x=1,右端点取为1-eps
plot(x,yy(:,1))  %画出轨迹曲线
yys=yy(end,1) %求击中时乙舰行驶的距离
