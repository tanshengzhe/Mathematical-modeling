clc,clear
y=[3.78,4.19,4.83,5.46,6.71,7.99,8.60,9.24,9.67,9.87,10.49,10.92,10.93,12.39,12.59];
yt=log(y); n=length(yt);m=n/3;
s1=sum(yt(1:m)), s2=sum(yt(m+1:2*m)), s3=sum(yt(2*m+1:end))
b=((s3-s2)/(s2-s1))^(1/m)
a2=(s2-s1)*(b-1)/(b*(b^m-1)^2)
k2=(s1-a2*b*(b^m-1)/(b-1))/m
a=exp(a2), k=exp(k2)  %原始模型中的参数取值
yuce=@(t) k*a.^(b.^t); %定义预测的匿名函数
yhat=yuce(1:n) %计算观测数据的预测值
bzcha=sqrt(mean((y-yhat).^2)) %计算模型的预测标准差
ythat=yuce([n+2,n+7]) %求1985年和1990年的预测值
