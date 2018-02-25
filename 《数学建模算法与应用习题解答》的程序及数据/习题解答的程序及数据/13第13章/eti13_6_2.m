clc, clear
I=imread('tu.bmp');   %读取图像
BW=im2bw(I);  %转化成二进制图像
BW(:,1:200)=1; %盖住A圆
imshow(BW)
ed=edge(BW); %提出边界
[y,x]=find(ed); %求边界点的坐标
x0=mean(x), y0=mean(y)  %计算圆心的坐标
r1=max(x)-min(x),r2=max(y)-min(y)
r=(r1+r2)/4     %计算圆的半径
