function [ dist,p ] = floyd( a,sb,db ) %a为邻接矩阵，sb为起点序号，db为重点序号。输出距离dist，路线l
n=size(a,1);
ay=a;
path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(k,j)
                a(i,j)=a(i,k)+a(k,j);
                path(i,j)=k;
            end
        end
    end
end
    dist=a(sb,db);
    p=db;
    k=db;
    while k~=sb
        for n=sb+1:(k-1)
            if ay(n,k)==a(sb,k)-a(sb,n)
                p=[n,p]
                k=n;
            end
        end
    end
    p=[sb,p];
    
%   是用floyd算法输出最短距离,可完美输出路程。




