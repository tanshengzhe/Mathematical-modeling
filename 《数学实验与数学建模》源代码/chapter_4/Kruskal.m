n=8;A=[0 2 8 1 0 0 0 0; 2 0 6 0 1 0 0 0;8 6 0 7 5 1 2 0;1 0 7 0 0 0 9 0;
0 1 5 0 0 3 0 8;0 0 1 0 3 0 4 6;0 0 2 9 0 4 0 3;0 0 0 0 8 6 3 0];
k=1; %记录A中不同正数的个数
for(i=1:n-1)for(j=i+1:n) %此循环是查找A中所有不同的正数
if(A(i,j)>0)x(k)=A(i,j); %数组x 记录A中不同的正数
kk=1; %临时变量
for(s=1:k-1)if(x(k)==x(s))kk=0;break;end;end %排除相同的正数
k=k+kk;end;end;end
k=k-1 %显示A中所有不同正数的个数
for(i=1:k-1)for(j=i+1:k) %将x 中不同的正数从小到大排序
if(x(j)<x(i))xx=x(j);x(j)=x(i);x(i)=xx;end;end;end
T(n,n)=0; %将矩阵T 中所有的元素赋值为0
q=0; %记录加入到树T 中的边数
for(s=1:k)if(q==n)break;end %获得最小生成树T, 算法终止
for(i=1:n-1)for(j=i+1:n)if (A(i,j)==x(s))T(i,j)=x(s);T(j,i)=x(s); %加入边到树T 中
TT=T; %临时记录T
while(1)pd=1; %砍掉TT 中所有的树枝
for(y=1:n)kk=0;
for(z=1:n)if(TT(y,z)>0)kk=kk+1;zz=z;end;end %寻找TT 中的树枝
if(kk==1)TT(y,zz)=0;TT(zz,y)=0;pd=0;end;end %砍掉TT 中的树枝
if(pd)break;end;end %已砍掉了TT 中所有的树枝
pd=0; %判断TT 中是否有圈
for(y=1:n-1)for(z=y+1:n)if(TT(y,z)>0)pd=1;break;end;end;end
if(pd)T(i,j)=0;T(j,i)=0; %假如TT 中有圈
else q=q+1;end;end;end;end;end
T %显示近似最小生成树T, 程序结束
