clc, clear
a=textread('data84.txt'); %把原始数据保存到纯文本文件data84.txt
a=a'; a=nonzeros(a); n=length(a);
plot(a,'.-')
for i=11:n
    b(i-10)=a(i)-a(i-10); %进行季节差分变换
end
b=b'; figure,plot(b,'.-')
figure, subplot(121), autocorr(b)
subplot(122), parcorr(b)
cs=armax(b,[1,10]) %拟合模型
figure, myres=resid(cs,b); %计算残差向量并画出残差的自相关函数图
[h1,p1,st1]=lbqtest(myres,'lags',6) %进行LBQ检验
[h2,p2,st2]=lbqtest(myres,'lags',12)
[h3,p3,st3]=lbqtest(myres,'lags',18)
bhat1=predict(cs,[b;0]); 
bhat(1)=bhat1{:}(end); %求差分序列第一个预测值
bhat2=predict(cs,[b;bhat(1);0]);
bhat(2)=bhat2{:}(end); %求差分序列的第二个预测值
ahat(1)=a(end-9)+bhat(1); %求原始序列的预测值
ahat(2)=a(end-8)+bhat(2)
