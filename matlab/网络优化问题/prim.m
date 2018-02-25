function [ path ] = prim( a ) %输入邻接矩阵
k=size(a,1);
s=2:k;
p=[1];
path=[];
while s
l=a(p,s);
temp=min(l(:));
[x,y]=find(a(p,s)==temp,1);%这是返回a(p,s)新矩阵的位置
x=p(x);y=s(y);             %所以需要这一步来得到原来的位置
n=[x;y];
path=[path,n];
p=[p,y];
s(s==y)=[];
end
%   Detailed explanation goes here


end

