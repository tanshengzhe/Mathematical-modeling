clc, clear
xt=@(cs,x) cs(1)*(exp(cs(2)*x(:,3))-cs(3)*exp(cs(2)*(x(:,3)-1))-...
    cs(4)*exp(cs(2)*(x(:,3)-2)))+cs(3)*x(:,1)+cs(4)*x(:,2);
cs0=[12.6385,0.0162,0.5451,0.2478]';
a=load('data85.txt');
a=a'; a=a(:); %把数据变成列向量
x=[a(2:end-1),a(1:end-2),[3:100]'];
cs=lsqcurvefit(xt,cs0,x,a(3:end))
res=a(3:end)-xt(cs,x);
Q=sum(res.^2) %计算残差平方和
autocorr(res) %画残差自相关图
xhat=a;
for j=101:108
    xhat(j)=cs(1)*(exp(cs(2)*j)-cs(3)*exp(cs(2)*(j-1))-...
        cs(4)*exp(cs(2)*(j-2)))+cs(3)*xhat(j-1)+cs(4)*xhat(j-2);
end
xhat101_108=xhat(101:108)
