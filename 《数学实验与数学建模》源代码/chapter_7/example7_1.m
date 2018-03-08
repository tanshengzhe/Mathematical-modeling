function example7_1()
%zhui.m
[x,y]=ode23(@zhuiji,[500,1],[0,0]);        
%调用ode23求解器求解方程组
plot(x, y(:,1))       
%画出图形
%%
function f=zhuiji(x,y)             
%zhuiji.m
%建立微分方程组函数，函数名为'zhuiji'
f=[y(2);0.75*sqrt(1-y(2)^2)/x];


