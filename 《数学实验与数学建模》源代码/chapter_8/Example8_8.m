function Example8_8
A=[1 0.4 0.8 0.5 0.5;
0.4 1 0.4 0.4 0.4;
0.8 0.4 1 0.5 0.5;
0.5 0.4 0.5 1 0.6;
0.5 0.4 0.5 0.6 1];
    fuzzy_lamdjjz(A)
end
%%
function[Alamd]=fuzzy_lamdjjz(A)          %求矩阵的lamd截矩阵并输出聚类结果
[m,n]=size(A);
p=m*n;%矩阵A中总的元素个数
C=A(1:p);%把矩阵变成一个行向量
D=sort(C);%把向量C中的元素从小到大排序
for(i=1:p)
    for(j=i+1:p)
        if(D(i)==D(j))
            D(j)=0;%把向量C中相同元素只保留一个其他的变为零
        end
    end
end
E=sort(D);%将D按从小到大进行排序
x=0;
for(i=1:p)
    if(E(i)==0)
        x=x+1;%统计E中零的个数
    end
end
F=E(p:(-1):(x+1));%从E中挑出非零元素并按从大到小的顺序排列
s=length(F);
for(i=1:s)
    disp('-------------------');
    lamd=F(i)%顺次从F中从大到小取lamd
    disp('所对应的截矩阵是');
    Alamd=A>=F(i)%得到lamd截矩阵
    [C]=fuzzy_jl(Alamd)%得到聚类结果
end
end
%%
function [C]=fuzzy_jl(A)%聚类结果
B=[];
[m1,n1]=size(A);
for(i=1:m1)
     x=0;
    for(j=1:n1)
        if(A(i,j)==1)%找到每一行的元素1
            x=x+1;
            B(i,x)=j;%把每一行找到的元素1的列下标顺次储存在矩阵的每一行中
        end
    end
end
B;
[m2,n2]=size(B);
for(i=1:m2)
    for(j=2:n2)
        if(B(i,j)~=0)
            B(B(i,j),:)=0;%将相同行只保留一个其他变为零行
        end
    end
end
B;
C=[];
y=0;
for(i=1:m2)
    if(sum(B(i,:))~=0)%找到非零行
        y=y+1;
        C(y,:)=B(i,:);%用非零行构成矩阵C,得到聚类结果
    end
end
end
%%