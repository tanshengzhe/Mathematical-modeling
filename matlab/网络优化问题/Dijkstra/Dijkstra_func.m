function [ d ] = Dijkstra_func( a,k )
%UNTITLED3 Summary of this function goes here
temp=k;
p=ones(1,length(a));
valn=0;
d(1:length(a))=inf;d(1)=0;
while sum(p)~=0
    pb=find(p);
    d(pb)=min(d(pb),valn+a(temp,pb));
    valn=min(d(pb));
    k=find(d(pb)==valn);
    temp=pb(k(1));
    p(temp)=0;
end
%   Detailed explanation goes here
% 应该没有什么大问题。。

end

