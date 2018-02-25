clc, clear
fid=fopen('str101.txt','r'); %把第一列的字符数据保存在str101.txt中
ss=textscan(fid,'%s') %读入省、自治区名称字符串
a=load('data101.txt'); %把数值数据保存在纯文本文件data101.txt中
b=zscore(a) %数据标准化
d=pdist(b) %计算两两之间的欧氏距离
z=linkage(d) %生成具有层次结构的聚类树
dendrogram(z,'label',ss{:}) %画聚类图
