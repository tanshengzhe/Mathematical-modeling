clc, clear
dx=@(t,y,z) 2*z/(1+z^9.65)-y;
sol=dde23(dx,2,0.5,[0,200]);
t=linspace(2,100,1000); %在区间[2,100]上取1000个点
x=deval(sol,t); %计算对应于t的状态变量x的取值
xlag=deval(sol,t-2);
plot(x,xlag) %画出相位图，显示混沌现象
xlabel('x(t)'), ylabel('x(t-2)')
