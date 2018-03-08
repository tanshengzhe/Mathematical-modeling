clear
t=zeros(1,21);    %每位顾客到达时间
T=zeros(1,21);     %每位顾客离去时间
w=zeros(1,21);      %顾客等待时间累加
ww=zeros(1,21);      %收款台空闲时间累加
r=exprnd(2,1,21);       %服从指数分布的随机数 
t2=normrnd(1,1/3,1,21);   %服从正态分布的随机数
for i=1:1:20
   t(i+1)=t(i)+r(i);
    if t(i+1)>=T(i);     %不需要排队，即第i+1个到来时候第i个已经服务完成
        w(i+1)=w(i); T(i+1)=t(i+1)+t2(i+1);    
         ww(i+1)=t(i+1)-T(i)+ww(i);
    else w(i+1)=T(i)-t(i+1)+w(i); 
         T(i+1)=T(i)+t2(i+1); ww(i+1)=ww(i);
    end;
end;
b=[t',T',w',ww'];
[brow,bcol]=size(b);       %求队伍长，brow表示行数，bcol表示列数
b=[b,zeros(brow,1)];       %zero生成brow行，1列的零矩阵
for j=2:brow
    l=0;             %队列长度
    if j-l-1>0
           while b(j,1)<=b(j-l-1,2)
                     l=l+1;
            end;
       b(j,bcol+1)=l;
   end;
end;   
b
g1=w(end)/20           %平均等待时间
g2=sum(T-t)/20            %平均逗留时间
g3=T(end)/20                %平均每分钟服务的顾客人数
