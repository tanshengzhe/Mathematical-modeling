clc, clear
w=zeros(5); %邻接矩阵初始化
w(1,2)=120; w(1,[3:5])=[150 120 80]; %逐个顶点输入邻接矩阵的取值
w(2,1)=100; w(2,[3:5])=[60 160 40];
w(3,[4 5])=[70,100];
w(4,[3 5])=[50 120];
w(5,[3 4])=[100,150];
w=sparse(w); %把邻接矩阵转化为稀疏矩阵
d=graphallshortestpaths(w)
NodeIDs={'甲','乙','A','B','C'};%节点标签，也就是h.Nodes(i).ID属性值
h=view(biograph(w,NodeIDs,'ShowWeights','on'))
set(h.Nodes,'shape','circle'); %顶点画成圆形
h.EdgeType='segmented'; %边的连接为线段
h.LayoutType='equilibrium';
dolayout(h) %刷新图形
h2=view(biograph(d,NodeIDs,'ShowWeights','on'))
h2.EdgeType='segmented'; %边的连接为线段
h2.LayoutType='equilibrium';
dolayout(h2)
