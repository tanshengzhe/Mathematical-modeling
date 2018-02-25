clc, clear
a=rand(10); a=tril(a); %截取下三角元素
a(1:11:end)=0; %对角线元素置0；
randnum=randint(10,10,[1,10])
wx=(a>=0.4).*randnum; %生成赋权图的邻接矩阵
wx=sparse(wx); %生成邻接矩阵下三角元素的稀疏矩阵
h=view(biograph(wx,[],'ShowArrows','off','ShowWeights','on')) %画出该图
[st,pred]=graphminspantree(wx,'Method','Kruskal') %求最小生成树
view(biograph(st,[],'ShowArrows','off','ShowWeights','on')) %画出最小生成树
[d,path,pred]=graphshortestpath(wx,1,10,'directed',false) %求顶点1到10的最短路
set(h.Nodes(path),'Color',[1 0.4 0.4])  
fowEdges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
revEdges = getedgesbynodeid(h,get(h.Nodes(fliplr(path)),'ID'));
edges = [fowEdges;revEdges];
set(edges,'LineColor',[1 0 0])
set(edges,'LineWidth',1.5)
d2=graphallshortestpaths(wx,'directed',false)
