clc, clear
d=textread('data1023.txt');
d=nonzeros(d)';
[y,eigvals]=cmdscale(d) %求经典解，d可以为实对称矩阵或pdist函数的行向量输出
plot(y(:,1),y(:,2),'o','Color','k','LineWidth',1.3)   %画出点的坐标
pin={'1','2','3','4','5','6','7','8','9','10'}; %构造标注的字符串
text(y(:,1),y(:,2)+3,pin) %对10个品牌对应的点进行标注
