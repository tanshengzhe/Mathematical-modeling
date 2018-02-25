w=zeros(6);w(1,2)=2;w(1,3)=7;
w(2,3)=4;w(2,4)=6;w(2,5)=8;
w(3,4)=1;w(3,5)=3;w(4,5)=1;w(4,6)=6;
w(5,6)=3; 
w=w'; w=sparse(w); %构造Matlab工具箱需要的数据格式
a=graphallshortestpaths(w,'Directed',0)
su=max(a) %求各列的最大值
c=[50	40	60	20	70	90];
s=c*a

