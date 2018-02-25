clc,clear all
a=zeros(6);
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;               
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a'                                                  
a(find(a==0))=inf %将a=0的数全部替换为无强大               
pb(1:length(a))=0;pb(1)=1;  %当一个点已经求出到原点的最短距离时，其下标i对应的pb(i)赋1
index1=1; %存放存入S集合的顺序
cindex2=ones(1,length(a)); %存放始点到第i点最短通路中第i顶点前一顶点的序号
d(1:length(a))=inf;d(1)=0;  %存放由始点到第i点最短通路的值
temp=1;  %temp表示c1,算c1到其它点的最短路。
while sum(pb)<length(a)  %看是否所有的点都标记为P标号
tb=find(pb==0); %找到标号为0的所有点,即找到还没有存入S的点
d(tb)=min(d(tb),d(temp)+a(temp,tb));%计算标号为0的点的最短路，或者是从原点直接到这个点，又或者是原点经过r1,间接到达这个点
tmpb=find(d(tb)==min(d(tb)));  %求d[tb]序列最小值的下标？？？
temp=tb(tmpb(1));%可能有多条路径同时到达最小值，却其中一个，temp也从原点变为下一个点
pb(temp)=1;%找到最小路径的表对应的pb(i)=1
index1=[index1,temp];  %存放存入S集合的顺序
temp2=find(d(index1)==d(temp)-a(temp,index1));
index2(temp)=index1(temp2(1)); %记录标号索引
end
d, index1, index2