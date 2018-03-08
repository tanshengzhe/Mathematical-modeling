function [l,t]=dijkstra(A,v)
%dijkstra最短路算法,某个顶点v到其余顶点的最短路
% 例：A=[0 2 8 1 inf inf inf inf
     %2 0 6 inf 1 inf inf inf
    % 8 6 0 7 5 1 2 inf
    % 1 inf 7 0 inf inf 9 inf
    % inf 1 5 inf 0 3 inf 8
   %  inf inf 1 inf 3 0 4 6
   %  inf inf 2 9 inf 4 0 3
    % inf inf inf inf 8 6 3 0];
n=length(A);%顶点个数
V=1:n;%顶点集合
s=v;%已经找到最短路的点集，初始为v
l=A(v,:);%当前v点到各个点的距离，初始为直接距离
t=v.*ones(1,n);%当前距离时点的父顶点，初始都为v
ss=setdiff(V,s);nn=length(ss);%还没有找到最短路的点集
for j=1:n-1%一共进行n-1次迭代
    k=ss(1);
    for i=1:nn%对还没有找到最短路的点
    if l(k)>l(ss(i))
        k=ss(i);
        l(k)=l(ss(i));%在当前一行距离中取最小值
    end
    end
    if l(k)==inf%如果当前行最小值是无穷大，则结束
       break;
    else%否则k点的最短路找到
        s=union(s,k);
        ss=setdiff(V,s);
        nn=length(ss);
    end
    if length(s)==n%全部点的最短路都找到
       break;
    else 
        for i=1:nn%以k为生长点，如果通过k点会更短，则更改当前最短距离
            if l(ss(i))>l(k)+A(k,ss(i))
               l(ss(i))=l(k)+A(k,ss(i));
               t(ss(i))=k;  
            end
        end
    end
end
%附：运行上面程序后，如果想更清楚的观看点v到点vv的最短距离与路径可用下面小程序：
% v=3;%v要与上面的v一致
% vv=4;k=vv;tt=vv;
% while(1)
% if k==v
%    tt %路径vv <--...<-- v
%    l(vv) %距离
%    break;
% else
%    k=t(k);
%    tt=[tt,k];
% end
%end
    