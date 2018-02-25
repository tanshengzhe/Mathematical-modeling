clc, clear
a=[1 1]; b=7;
c1=[3 1]'; c2=[1 2]';
lb=zeros(2,1); ub=[5 5]'; %定义线性规划的下界向量和上界向量
[x1,y1]=linprog(-c1,a,b,[],[],lb,ub) %求解第一个线性规划
[x2,y2]=linprog(-c2,a,b,[],[],lb,ub) %求解第二个线性规划
go=-[y1,y2]'; %Matlab工具箱线性规划是求解极小值
goalfun=@(x)[-3*x(1)-x(2);-x(1)-2*x(2)]; 
[x,fval]=fgoalattain(goalfun,rand(2,1),go,abs(go),a,b,[],[],lb,ub);
x, fval=-fval %恢复到原来的目标函数
