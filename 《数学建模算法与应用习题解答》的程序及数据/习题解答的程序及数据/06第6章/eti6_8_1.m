clc, clear
dxfun2=@(t,x,dx) [dx(1)-x(2);dx(2)*sin(dx(3))+dx(3)+x(1)*x(3)
    x(1)*dx(3)+x(1)*cos(dx(3))-x(2)*x(3)];
x0=[0;1;0]; %初始值
xp0=[1;0;0]; %导数的初始值，第2,3分量是任意取的
[x0mod,xp0mod]=decic(dxfun2,0,x0,[1;1;1],xp0,[1;0;0])
[t,x]=ode15i(dxfun2,[0,10],x0mod,xp0mod);
plot(t,x(:,1),'-P'), hold on, plot(t,x(:,2),'-*'), plot(t,x(:,3),'-.') 
legend('x的数值解','x导数的数值解','y的数值解')
