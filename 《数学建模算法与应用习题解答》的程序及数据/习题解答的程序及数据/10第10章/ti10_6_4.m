clc,clear
a=load('data1017.txt');   %把原始数据保存在纯文本文件data1017.txt中
var0=cov(a); %计算样本的协方差阵
for j=1:15
    for i=j+1:16
        d(i,j)=sqrt((a(i,:)-a(j,:))*inv(var0)*(a(i,:)-a(j,:))');
    end
end
b=nonzeros(d);%去掉d中的零元素
b=b';  %化成行向量
z=linkage(b); %按最长距离法聚类  
h=dendrogram(z); %画聚类图
set(h,'Color','k','LineWidth',1.3)  %把聚类图线的颜色改成黑色，线宽加粗
