
A=xlsread('附件2.1.xlsx','Example3','B3:E20');
x=pinjun_data(:,3:7);
y=pinjun_data(:,1);
inmodel=1:5;         %inmodel是一个长度与X的列数相等的逻辑向量
stepwise(x,y,inmodel);