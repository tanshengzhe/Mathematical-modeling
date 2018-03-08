function [P,Q,f]=equ_mat(A)
%Equivalence Matrix（等价矩阵）方法求最佳匹配
% A=[3 6 2 3
% 4 5 3 2
% 1 3 5 1
% 4 2 1 4];
% [P,Q,f]=equ_mat(A)
%请输入方阵，如果不是方阵或完备的，用添加虚拟顶点和虚拟边
%的方法变成方阵，虚拟边权数设为0
n=length(A);
B=[];C=ones([1,n]);MM=[];
for i=1:n 
    B(i)=max(A(i,:));%取每一行的最大值
    M=B(i).*C;%构造行向量
    MM=[MM;M];%构造最大值矩阵
end
E=A-MM;% 减同行的最大值得到等价分配矩阵
while(1)
num=zeros(1,n);E1=E;  H=[]; L=[];
for i=1:n
    for j=1:n
        if E1(i,j)==0
            num(i)=num(i)+1;%记录每行零元个数
        end
    end
    if num(i)==1%对率先找到的行单个零元的列进行处理
       H=[H,i];%记录只有一个零元的行(划掉零元后可能出现新的单个零元行？？)
         for j=1:n
             if E1(i,j)==0
                 L=[L,j];%记录这个零元的列
                  for k=1:n% 对这个零元所在的j列
                      if E1(k,j)==0&k~=i%划掉这一列的其它零元
                          E1(k,j)=inf;
                      end
                  end
              end
          end
      end
end
num=zeros(1,n);
for j=1:n
    for i=1:n
        if E1(i,j)==0
            num(j)=num(j)+1;%记录每列零元个数
        end
    end
    if num(j)==1&~(ismember(L,j))%对率先找到的列单个零元(非L列中的)的行进行处理
      L=[L,j];%记录只有一个零元的列
         for i=1:n
             if E1(i,j)==0
                  H=[H,i];%记录这个零元的行
                  for k=1:n% 对这个零元所在的i行
                      if E1(i,k)==0&k~=j%划掉这一行的其它零元
                          E1(i,k)=inf;
                      end
                  end
              end
          end
      end
end
for i=1:n
    for j=1:n
        if (~(ismember(L,j)|ismember(L,j))& E1(i,j)==0)|length(H)==0
            %对同行同列都有零元的零元,H=[]时不能使用集合函数
            H=[H,i]; L=[L,j];%任取一个作为独立零元
            for k=1:n% 对这个零元所在的j列
                if E1(k,j)==0&k~=i%划掉这一列的其它零元
                   E1(k,j)=inf;
                end
            end
            for k=1:n% 对这个零元所在的i行
                if E1(i,k)==0&k~=j%划掉这一行的其它零元
                  E1(i,k)=inf;
               end
           end
       end
   end
end
if length(H)==n%得到最优分配
    P=[];Q=[];
    for i=1:n
       P(H(i),L(i))=A(H(i),L(i));%给出分配矩阵
       Q=[Q;H(i),L(i)];
       f=sum(sum(P));%最优分配值的总和
    end
    break;%找到最优分配，退出
else
    a=[];b=[];
    for i=1:n
        if ~(ismember(H,i))%不是选中的零元所在的行
            a=[a,i];
            for j=1:n
                if E(i,j)==0%找到非选中零元所在的列
                    b=[b,j];
                    for k=1:n
                        if (E(k,j)==0)&(ismember(k,H))%找到此列的被选中零元
                            a=[a,k];
                        end
                    end
                end
            end
        end
    end
    E2=E;
    E2(:,b)=[];
    m=max(max(E2(a,:)));%去掉列以后的被选中行
     E(a,:)=E(a,:)-m;%用上述方法选中的行加上|m|
     E(:,b)=E(:,b)+m; %用上述方法选中的列减去|m|   
end
end
