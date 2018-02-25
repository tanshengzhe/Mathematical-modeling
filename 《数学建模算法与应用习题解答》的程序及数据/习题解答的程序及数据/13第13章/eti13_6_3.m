clc, clear
I=imread('tu.bmp');
BW=im2bw(I,0.9);   %转化成二进制图像
BW(:,200:512)=1;    %盖住B圆
ed=edge(BW);%提出A圆的边界
stat1=regionprops(ed,'all')  %提出A圆所在图像的特征
center=stat1.Centroid   %提出A圆的圆心
xy=stat1.BoundingBox    %提出A圆所在的盒子
r=sum(xy(3:4))/4        %计算A圆的半径
