clc, clear
d0=textread('data1024.txt'); d=mandist(d0');
[y,eigvals]=cmdscale(d) %求经典解，d可以为实对称矩阵或pdist函数的行向量输出
plot(y(:,1),y(:,2),'.','Color','k','LineWidth',1.3)   %画出点的坐标
pin={'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'}; %构造标注的字符串
for i=1:20
text(y(i,1)+rand*0.1,y(i,2)+rand*0.2,pin{i}) %对10个品牌对应的点进行标注
end
