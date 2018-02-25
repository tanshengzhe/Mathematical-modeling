clc, clear
a=zeros(6); %邻接矩阵初始化
a(1,[2:6])=[56	35	21	51	60]; %输入邻接矩阵的上三角元素
a(2,[3:6])=[21	57	78	70];
a(3,[4:6])=[36	68	68];
a(4,[5 6])=[51	61]; a(5,6)=13;
a=a'; a=sparse(a); %变换成下三角矩阵，并转化成工具箱所需要的稀疏矩阵
[ST,pred] = graphminspantree(a,'method','Kruskal') %调用工具箱求最小生成树
view(biograph(ST,[],'ShowArrows','off','ShowWeights','on'))
