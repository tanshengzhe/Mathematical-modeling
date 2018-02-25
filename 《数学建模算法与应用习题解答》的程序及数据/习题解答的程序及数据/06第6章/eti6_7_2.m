clc, clear
dxfun=@(t,x,dx) [-dx(1)-4*x(1)+x(1)*x(2); -dx(2)+x(1)*x(2)-x(2)^2];
x0=[2;1]; %x0初始值
xp0=[-6;1];
[t,x]=ode15i(dxfun,[0,10],x0,xp0);
plot(t,x(:,1),'-P');hold on, plot(t,x(:,2),'-*')
legend('x1的数值解','x2的数值解')
