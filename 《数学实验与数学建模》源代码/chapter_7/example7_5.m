function example7_4()
%7.1.3.3传染病模型
%模型Ⅳ
%采用数值计算，使用数学软件来完成，其MATLAB程序如下
ts=0:50;
x0=[0.02,0.98];
[t,x]=ode45(@ill,ts,x0)                %调用ode45求解'ill'方程组
plot(t,x(:,1),t,x(:,2)),grid,              %画出健康者和病人的变化曲线
figure,plot(x(:,2),x(:,1)),grid           %画出相图
%%
function y=ill(t,x)                    %函数ill，表示模型IV
a=1;b=0.3;
y=[a*x(1)*x(2)-b*x(1),-a*x(1)*x(2)]';
