function [X,c,error1,error2]=example9_11()
%利用MATLAB编程预测2003年中国蔬菜产量，
%并对预测结果做残差检验和后验差检验，程序如下：
X0=[19519,19578,19637,19695,16602,25723,30379,34473,38485,40514,42400,48337];
k=1;
[X,c,error1,error2]=GM11(X0,k)
plot(1991:2002,X0,'g*-')
hold on 
plot(1991:2003,X)
%%
function [X,c,error1,error2]=GM11(X0,k)
% 建立函数[X,c,error1,error2]=example9_3_2_3(X0,k)
% 其中X0为输入序列，k为预测长度，
% X为预测输出序列，c为后验差检验数，error1为残差，error2为相对误差
format long;
n=length(X0);
X1=[];
X1(1)=X0(1);
for i=2:n
    X1(i)=X1(i-1)+X0(i);             %计算累加生成序列
end
for i=1:n-1
B(i,1)=-0.5*(X1(i)+X1(i+1));   %计算B，Yn
    B(i,2)=1;
    Y(i)=X0(i+1);
end
alpha=(B'*B)^(-1)*B'*Y';            %做最小二乘估计
a=alpha(1,1);
b=alpha(2,1);
d=b/a;                                  %计算时间响应函数参数
c=X1(1)-d;
X2(1)=X0(1);
X(1)=X0(1);
for i=1:n-1
    X2(i+1)=c*exp(-a*i)+d;
    X(i+1)=X2(i+1)-X2(i);           %计算预测序列
end
for i=(n+1):(n+k)
    X2(i)=c*exp(-a*(i-1))+d;       %计算预测序列
    X(i)=X2(i)-X2(i-1);
end
for i=1:n
    error(i)=X(i)-X0(i);
    error1(i)=abs(error(i));       %计算残差
    error2(i)=error1(i)/X0(i);     %计算相对误差
end
c=std(error1)/std(X0);             %计算后验差检验数


