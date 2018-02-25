clc, clear
a=load('data85.txt'); %把原始所有四个季度的数据保存到纯文本文件
a=a'; a=a(:); %把数据变成列向量
n=length(a);
t0=[46:1/4:71-1/4]';
t=[1:100]';
xishu=[ones(n,1),t];
cs=xishu\log(a);
cs(1)=exp(cs(1))
ahat=cs(1)*exp(cs(2)*t);
cha=a-ahat;
res=sum(cha.^2)
subplot(121), plot(t0,a,'*-')
subplot(122), plot(t0,cha,'.-')
figure, subplot(121), autocorr(cha)
subplot(122), parcorr(cha)
for i=1:10
    cs2{i}=ar(cha,i); %拟合模型
    cha2=resid(cs2{i},cha); %计算残差向量
    myvar(i)=sum(cha2.^2)/(100-i); %计算残差方差 
end
figure, plot(myvar,'*-')
