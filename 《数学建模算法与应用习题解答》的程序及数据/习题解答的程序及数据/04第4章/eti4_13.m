clc, clear
B=zeros(6);
B(1,2)=1; B(2,[3,4])=1;
B(3,[4:6])=1; B(4,1)=1;
B(5,6)=1; B(6,1)=1;
nodes={'1.alpha','2.beta','3.gamma','4.delta','5.rho','6.sigma'};
h=view(biograph(B,nodes,'ShowWeights','off','ShowArrows','on'))
h.EdgeType='segmented'; %边的连接为线段
h.LayoutType='equilibrium';
dolayout(h) %刷新图形
r=sum(B,2); n=length(B);
for i=1:n
    for j=1:n
        A(i,j)=0.15/n+0.85*B(i,j)/r(i);  %构造状态转移矩阵
    end
end
A %显示状态转移矩阵
[x,y]=eigs(A',1); %求最大特征值对应的特征向量
x=x/sum(x) %特征向量归一化
bar(x) %画PageRank值的直方图
