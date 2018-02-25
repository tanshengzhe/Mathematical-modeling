clc,clear
a=load('data1017.txt')   %把原始数据保存在纯文本文件data1017.txt中
sy=zscore(a); %数据标准化
r=corrcoef(sy);  %求相关系数矩阵
[vec1,val,con]=pcacov(r)  %进行主成分分析的相关计算
cumrate=cumsum(con) %计算累积贡献率
f1=repmat(sign(sum(vec1)),size(vec1,1),1);
vec2=vec1.*f1;     %特征向量正负号转换
f2=repmat(sqrt(val)',size(vec2,1),1); 
a=vec2.*f2   %求初等载荷矩阵
contr1=sum(a.^2)  %计算因子贡献
num=input('请选择主因子的个数：');  %交互式选择主因子的个数
am=a(:,[1:num]);  %提出num个主因子的载荷矩阵
[b,t]=rotatefactors(am,'method', 'varimax') %旋转变换,b为旋转后的载荷阵
bt=[b,a(:,[num+1:end])];   %旋转后全部因子的载荷矩阵
degree=sum(b.^2,2)     %计算共同度
contr2=sum(bt.^2)       %计算因子贡献
rate=contr2(1:num)/sum(contr2) %计算因子贡献率
coef=inv(r)*b          %计算得分函数的系数
xlswrite('tt1.xls',a(:,[1:num])); %这里是准备做表格的数据
xlswrite('tt1.xls',contr1(1:num),'Sheet1','A7');
xlswrite('tt1.xls',b,'Sheet1','D1');
xlswrite('tt1.xls',contr2(1:num),'Sheet1','D7');
xlswrite('tt1.xls',degree,'Sheet1','G1');
