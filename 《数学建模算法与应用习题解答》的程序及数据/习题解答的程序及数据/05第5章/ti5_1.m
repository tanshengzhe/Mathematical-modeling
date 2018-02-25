clc, clear
x=-5:0.3:5; L=length(x);
a=[1 -6 5 3]; %定义多项式的系数向量
y=polyval(a,x); %计算多项式的值
plot(x,y,'.-')
no=randn(1,L); %产生噪声序列
hold on
plot(x,y+no,'*'); %画出噪声点
b1=polyfit(x,y+no,3); %受污染的数据拟合三次多项式
y1=polyval(b1,x); plot(x,y1,'>-')
b2=polyfit(x,y+no,2); %受污染的数据拟合二次多项式
y2=polyval(b2,x); plot(x,y2,'<-')
b3=polyfit(x,y+no,4); %受污染的数据拟合四次多项式
y3=polyval(b3,x); plot(x,y3,'rP-')
legend('原数据点','噪声污染的数据','三次拟合','二次拟合','四次拟合',0)
