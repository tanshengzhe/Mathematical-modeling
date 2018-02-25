function ti8_1_2
clc, clear
[sigma1,yhat21]=yucefun(0.3) %求alpha=0.3时的预测标准差及预测值
[sigma2,yhat22]=yucefun(0.6) %求alpha=0.6时的预测标准差及预测值
function [sigma,yhat2]=yucefun(alpha);
yt=[80.8	94.0	88.4	101.5	110.3	121.5	134.7	142.7];
n=length(yt); st1(1)=mean(yt(1:3)); st2(1)=st1(1);
for i=2:n
    st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
at=2*st1-st2;
bt=alpha/(1-alpha)*(st1-st2);
yhat=at+bt;
sigma=sqrt(mean((yt(2:end)-yhat(1:end-1)).^2));
m=1:4;
yhat2=at(end)+bt(end)*m; %求1982年到1985年的预测值
