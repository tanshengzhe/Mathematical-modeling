clc, clear
format long g
x0=[4383	7625	10500	11316	17818
83	131	180	195	306
146	212	233	259	404];
[m,n]=size(x0);
x1_d=cumsum(x0,2)
x11=x1_d(1,:)
z11=0.5*(x11(1:end-1)+x11(2:end))
b=[-z11',x1_d(2,2:end)',x1_d(3,2:end)']
y=x0(1,2:end)'
u=b\y
x1=dsolve('Dx1+a*x1=b2*x2+b3*x3','x1(0)=x10')
x1=subs(x1,{'a','b2','b3','x10'},{u(1),u(2),u(3),x0(1,1)})
x1_s=vpa(x1,7), x1_s=simple(x1_s) %显示时间响应式
x20=[x0(2,:),400];
x30=[x0(3,:),500];
x21=cumsum(x20); x31=cumsum(x30);
x1=subs(x1,{'t','x2','x3'},{[0:n],x21,x31}) %计算预测值
x10hat=[x1(1),diff(x1)] %还原到原始数据
epsilon=x0(1,:)-x10hat(1:end-1) %计算残差
delta=abs(epsilon./x0(1,:)) %计算相对误差
xhat=x10hat(end)
