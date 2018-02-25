clc,clear
ab0=load('data112.txt');   %原始数据存放在纯文本文件data112.txt中
mu=mean(ab0);sig=std(ab0); %求均值和标准差
ab=zscore(ab0); %数据标准化
a=ab(:,[1:7]);b=ab(:,[8:12]);  %提出标准化后的自变量和因变量数据
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] =plsregress(a,b)
%XL的每一行是标准化自变量对相应主成分的回归系数
%BETA各列是标准化因变量对标准化自变量的回归系数
%PCTVAR的第一行是自变量组主成分的贡献率
xw=a\XS  %求自变量的主成分系数，每列对应一个成分，这里xw等于stats.W
yw=b\YS  %求因变量的主成分系数
ncomp=input('请根据PCTVAR的值确定提出成分对的个数ncomp=');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2,stats2] =plsregress(a,b,ncomp)
n=size(a,2); m=size(b,2);%n是自变量的个数,m是因变量的个数
beta3(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA2([2:end],:).*sig(n+1:end); %原始数据回归方程的常数项
beta3([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA2([2:end],:) %计算原始变量x1,...,xn的系数，每一列是一个回归方程
bar(BETA2','k')   %画直方图
yhat=repmat(beta3(1,:),[size(a,1),1])+ab0(:,[1:n])*beta3([2:end],:)  %求y1,..,y5的预测值
ymax=max([yhat;ab0(:,[n+1:end])]); %求预测值和观测值的最大值
%下面画y1,y2,y3,y4,y5的预测图，并画直线y=x
figure, subplot(2,3,1), 
plot(yhat(:,1),ab0(:,n+1),'*',[0:ymax(1)],[0:ymax(1)],'Color','k')
legend('y1',2)
subplot(2,3,2)
plot(yhat(:,2),ab0(:,n+2),'O',[0:ymax(2)],[0:ymax(2)],'Color','k')
legend('y2',2)
subplot(2,3,3)
plot(yhat(:,3),ab0(:,n+3),'H',[0:ymax(3)],[0:ymax(3)],'Color','k')
legend('y3',2)
subplot(2,3,4)
plot(yhat(:,4),ab0(:,n+4),'H',[0:ymax(4)],[0:ymax(4)],'Color','k')
legend('y4',2)
subplot(2,3,5)
plot(yhat(:,5),ab0(:,end),'H',[0:ymax(5)],[0:ymax(5)],'Color','k')
legend('y5',2)
