%Ford_Fulkerson.m
n=8;C=[0	5	4	3	0	0	0	0
0	0	0	0	5	3	0	0
0	0	0	0	0	3	2	0
0	0	0	0	0	0	2	0
0	0	0	0	0	0	0	4
0	0	0	0	0	0	0	3
0	0	0	0	0	0	0	5
0	0	0	0	0	0	0	0];	%弧容量
for(i=1:n)for(j=1:n)f(i,j)=0;end;end	%取初始可行流f为零流
for(i=1:n)No(i)=0;d(i)=0;end	%No,d记录标号
while(1)
	No(1)=n+1;d(1)=Inf;	%给发点vs标号
	while(1)pd=1;	%标号过程
		for(i=1:n)if(No(i))	%选择一个已标号的点vi
			for(j=1:n)if(No(j)==0&f(i,j)<C(i,j))	%对于未给标号的点vj, 当vivj为非饱和弧时
					No(j)=i;d(j)=C(i,j)-f(i,j);pd=0;
					if(d(j)>d(i))d(j)=d(i);end
				elseif(No(j)==0&f(j,i)>0)	%对于未给标号的点vj, 当vjvi为非零流弧时
					No(j)=-i;d(j)=f(j,i);pd=0;
					if(d(j)>d(i))d(j)=d(i);end;end;end;end;end
		if(No(n)|pd)break;end;end	%若收点vt得到标号或者无法标号, 终止标号过程
	if(pd)break;end	%vt未得到标号, f已是最大流, 算法终止
	dvt=d(n);t=n;	%进入调整过程, dvt表示调整量
	while(1)
		if(No(t)>0)f(No(t),t)=f(No(t),t)+dvt;	%前向弧调整
		elseif(No(t)<0)f(No(t),t)=f(No(t),t)-dvt;end	%后向弧调整
		if(No(t)==1)for(i=1:n)No(i)=0;d(i)=0; end;break;end	%当t的标号为vs时, 终止调整过程
		t=No(t);end;end;	%继续调整前一段弧上的流f
wf=0;for(j=1:n)wf=wf+f(1,j);end	%计算最大流量
f	%显示最大流
wf	%显示最大流量
No	%显示标号, 由此可得最小割, 程序结束
