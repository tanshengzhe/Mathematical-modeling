function welsh(n,e)
totalcolor=0;%e为邻接矩阵
temp=zeros(1,n);%临时矩阵 
for (i=1:n)  temp=e(i,:);t(i)=sum(temp);temp=0;q(i)=i;c(i)=i;end%t记录vi的度－邻接矩阵行和，q记录顶点标号,c：颜色集
[t,q]=sortd(n,t,q);%按度排序
[m,n]=size(e);
bepaint=zeros(m,n);%初始化着色矩阵
for i=1:n bepaint(:,i)=c(i); end 
i=1;
    for j=1:n%顶点－行
      pcivj=min(bepaint(j,:));bepaint(j,i)=pcivj;%求行最小值
        for k=j+1:n
            if (e(j,k)==1) bepaint(k,i)=bepaint(k,i)+inf;end
        end
         pcivj=0;i=i+1;
    end
bepaint;
A=[];
for i=1:n
    A=[A ,min(bepaint(i,:))];
end
A
