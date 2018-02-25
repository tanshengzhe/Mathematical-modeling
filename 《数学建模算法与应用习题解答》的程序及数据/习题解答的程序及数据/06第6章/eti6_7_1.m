clc, clear
dx=@(t,x) [-4*x(1)+x(1)*x(2); x(1)*x(2)-x(2)^2]; %定义微分方程组右端项
x0=[2;1]; %初始值
[t,x]=ode23(dx,[0,10],x0);
plot(t,x(:,1),'-P');hold on, plot(t,x(:,2),'-*')
legend('x1的数值解','x2的数值解')
