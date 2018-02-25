clc, clear, T=20; %T为增强时的阈值
a=imread('fengmian.bmp');
h=[1 2 1; 2 4 2; 1 2 1]/16;
b=imfilter(a,h);
subplot(1,3,1), imshow(a),title('原图像')
subplot(1,3,2), imshow(b), title('滤波后的图像')
b=double(b); %必须转化为double类型才能做梯度运算
[bx,by]=gradient(b); dxy=(bx.^2+by.^2).^(1/2); 
dxy=uint8(dxy); c=uint8(b); %把double类型数据转化为uint8类型图像数据
c(dxy>T)=dxy(dxy>T); %进行增减变换
subplot(1,3,3), imshow(c), title('增强后的图像')
