clc, clear
I=imread('tu.bmp');   %读取图像
[m,n]=size(I)   %计算图像的大小
BW=im2bw(I);  %转化成二进制图像
%imshow(BW)
BW(:,200:512)=1; %盖住第2个圆
figure, imshow(BW)
ed=edge(BW); %提出边界
[y,x]=find(ed); %求边界点的坐标
x0=mean(x), y0=mean(y)  %计算圆心的坐标
r1=max(x)-min(x)+1,r2=max(y)-min(y)+1
r=(r1+r2)/2     %计算圆的直径
