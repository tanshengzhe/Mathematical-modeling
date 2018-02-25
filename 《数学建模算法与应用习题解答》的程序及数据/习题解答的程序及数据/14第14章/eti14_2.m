function eti14_2
a=[62.03	62.48	78.52	72.12	74.18	73.95	66.83
59.47	63.70	72.38	73.28	67.07	68.32	76.04
68.17	61.04	75.17	77.68	67.74	70.09	76.87
72.45	68.17	74.65	70.77	70.43	68.73	73.18];
jz=mean(a) %求各学院学生成绩的平均值
[m,n]=size(a); %求矩阵的行数和列数
amin=min(a,[],2); %计算每一行的最小值
amax=max(a,[],2); %计算每一列的最大值
b=(a-repmat(amin,[1,7]))./repmat(amax-amin,[1,7]) %进行极差标准化
xlswrite('bookex1.xls',b) %把数据保存到Excel文件中，便于做表使用
for i=1:n
    for j=1:n
        c(i,j)=sum(min([b(:,i)';b(:,j)']))/sum(max([b(:,i)';b(:,j)']));
    end
end
xlswrite('bookex1.xls',c,'Sheet2')
c %显示相似矩阵
c1=hecheng(c) %进行一次合成运算
c1=hecheng(c1)
c1=hecheng(c1)
xlswrite('bookex1.xls',c1,'Sheet3')
ur=union(c1(:),[]); %求等价矩阵中的所有不同元素
ur=sort(ur,'descend') %把等价矩阵中的元素按照从大到小排列
R2=(c1>=ur(2)) %求关于ur(2)的lamda截矩阵
R3=(c1>=ur(3))
R4=(c1>=ur(4)) 
R5=(c1>=ur(5))
R6=(c1>=ur(6))
c2=1-c1; c2=tril(c2);
c2=nonzeros(c2); c2=c2';%计算距离
S={'1-经管','2-汽车','3-信息','4-材化','5-计算机','6-土建','7-机械'};
z=linkage(c2); dendrogram(z,'label',S) %画聚类图
%************************************************************************
%以下是模糊矩阵合成的子函数
%************************************************************************
function rhat=hecheng(r); %定义矩阵合成的子函数
k=length(r);
for i=1:k
    for j=1:k
        rhat(i,j)=max(min([r(i,:);r(:,j)']));
end  

end
