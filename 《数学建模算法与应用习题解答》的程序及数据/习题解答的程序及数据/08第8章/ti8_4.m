clc, clear
a=textread('data83.txt');
xt=a(:,[2:2:end]); xt=nonzeros(xt); %把原始数据按照时间先后次序展成列向量
yt=diff(xt); %对原始数据进行差分变换
m=armax(yt,[2,1]) %拟合arma模型
yd=yt;
for i=1:10
    tt1=predict(m,[yd;0]); %计算一步预测值
    tt2=tt1{:}(end); %提出最后的一个预测值
    ythat(i)=tt2; %保存第i个预测值
    yd=[yd;tt2]; %构造下一步预测的数据
end
ythat %显示差分数据的预测值
xthat=xt(end)+cumsum(ythat) %计算原始数据的预测值
