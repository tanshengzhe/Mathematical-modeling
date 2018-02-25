clc,clear
ab0=load('data111.txt');   %原始数据存放在纯文本文件题data111.txt中
mu=mean(ab0);sig=std(ab0); %求均值和标准差
ab=zscore(ab0); %数据标准化
a=ab(:,[1:end-1]);b=ab(:,end);  %提出标准化后的自变量和因变量数据
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] =plsregress(a,b)
xw=a\XS  %求自变量的主成分系数，每列对应一个成分，这里xw等于stats.W
yw=b\YS  %求因变量的主成分系数
ncomp=input('请根据PCTVAR的值确定提出成分对的个数ncomp=');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2,stats2] =plsregress(a,b,ncomp)
n=size(a,2); %n是自变量的个数
beta3(1)=mu(end)-mu(1:n)./sig(1:n)*BETA2([2:end]).*sig(end); %原始数据回归方程的常数项
beta3([2:n+1])=(1./sig(1:n))'*sig(n+1:end).*BETA2([2:end]) 
bar(BETA2','k')   %画直方图
yhat=repmat(beta3(1),[size(a,1),1])+ab0(:,[1:n])*beta3([2:end])'  %求y的预测值
ymax=max([yhat;ab0(:,end)]); %求预测值和观测值的最大值
figure
plot(yhat(:,1),ab0(:,n+1),'*',[0:ymax],[0:ymax],'Color','k')
legend('原辛烷值预测图',2)
