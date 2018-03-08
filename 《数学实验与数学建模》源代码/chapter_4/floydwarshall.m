%floyd.m
function [D,R]= floydwarshall(A)
% %采用floyd算法计算图中任意两点之间最短路程，可以有负权。
%参数D为连通图的权矩阵
%R是路由矩阵
D=A; n=length(D);	%赋初值
for(i=1:n)for(j=1:n)R(i,j)=j;end;end	%赋路径初值
for(k=1:n)
for(i=1:n)
for(j=1:n)
if(D(i,k)+D(k,j)<D(i,j))D(i,j)=D(i,k)+D(k,j); 	%更新dij，说明通过k的路程更短
	R(i,j)=k;end;end;end		%更新rij，需要通过k
	k;  	%显示迭代步数
	D;	%显示每步迭代后的路长
	R;	%显示每步迭代后的路径
	pd=0;for i=1:n	%含有负权时
		if(D(i,i)<0)pd=1;break;end;end	%跳出内层的for循环 存在一条含有顶点vi的负回路
	if(pd==1)  fprintf('有负回路');break;end		%存在一条负回路, 跳出最外层循环 终止程序
end	%程序结束

