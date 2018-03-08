function [T,c]=tree_prim(a,n)
T=[];c=0;v=1;H=2:n;
for j=2:n
    b(1,j-1)=1;
    b(2,j-1)=j;
    b(3,j-1)=a(1,j);
end

while size(T,2)<n-1
    i=min(b(3,:));
    i=find(b(3,:)==i)
    T=[T b(:,i)];
    c=c+b(3,i);
    v=b(2,i);
    temp=find(H==b(2,i));
    H(temp)=[];b(:,i)=[];
    for j=1:length(H)
        d=a(v,H(j));
        if d<b(3,j)
            b(1,j)=v;b(3,j)=d;
        end
    end
end
