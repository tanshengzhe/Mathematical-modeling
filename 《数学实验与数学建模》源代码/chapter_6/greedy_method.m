function greedy_method
% 例如在命令窗口输入：
c=[220,208,198,192,180,180,165,162,160,158,155,130,125,122,120,118,115,110,105,101,100,100,98,96,95,90,88,82,80,77,75,73,72,70,69,66,65,63,60,58,56,50,30,20,15,10,8,5,3,1];
w=[80,82,85,70,72,70,66,50,55,25,50,55,40,48,50,32,22,60,30,32,40,38,35,32,25,28,30,22,50,30,45,30,60,50,20,65,20,25,30,10,20,25,15,10,10,10,4,4,2,1];
limitw=1000;n=50;
knapsack(n,limitw,w,c)
% 运行参数解释：
% 以上C表示大小,W表示价值，limitw表示w的极限，n表示物品个数。
end
%%
function [a1,b1]=sort1(n,a,b)%按单位价值排序
[m,n]=size(a);
d=zeros(m,n);
for k=1:n
   d(k)=a(k)/b(k);
end%单位价值
for h=1:n-1
  for j=1:n-h%向后排序
   if d(j)<d(j+1)
      t1=a(j);a(j)=a(j+1);a(j+1)=t1;
     t2=b(j);b(j)=b(j+1);b(j+1)=t2;
    t3=d(j);d(j)=d(j+1);d(j+1)=t3;%可省略
end
end
end
a1=a;b1=b;
end
%%
function knapsack(n,limitw,w,c)
totalc=0;totalw=0;
[m,n]=size(w); %m 是w 的行数n 是w 的列数
x=zeros(m,n);
t=w;%记录原数组 
k=c;y=x;
[p,c,w]=goodsinknapsack(n,limitw,c,w,x);%排序及计算装箱物品数
for j=1:p%装包的p件物品
  for i=1:n%原n件物品
   if (w(j)==t(i))&&(c(j)==k(i))%被选择的物品装箱
     y(i)=1;
  end
 end
end
 y
for i=1:n
  totalc=totalc+k(i)*y(i);%背包的总价值
 if y(i)==1
  totalw=totalw+t(i);%背包所装载总体积
 end
end
totalw,totalc
end
%%
function [p,c,w]=goodsinknapsack(n,limitw,c,w,x)%计算背包中物品数
cl=limitw;%cl为背包剩余可装载重量
p=0;[m,z]=size(c);x=zeros(m,z);
[v,t]=sort1(n,c,w);%物品按单位价值排序
c=v;w=t;
for i=1:n
  if w(i)>cl break;%待放入包的物品重量大于包的重量,跳出循环
   else 
      x(i)=1;%x(i)为1时,物品i在包中
     cl=cl-w(i);
p=p+1;%p记录放入背包物品的个数
 end
end
end
%%