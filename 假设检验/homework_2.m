
clc
x=A(:,1:4);
y=A(:,5);
y=log(y);
inmodel=1:4;         %inmodel是一个长度与X的列数相等的逻辑向量
stepwise(x,y,inmodel);