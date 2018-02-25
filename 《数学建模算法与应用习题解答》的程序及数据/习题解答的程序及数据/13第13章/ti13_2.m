clc, clear
a=imread('fengmian_caise.tif');
b=imrotate(a,30); 
[m1,n1]=size(a), [m2,n2]=size(b)
subplot(1,2,1), imshow(a)
subplot(1,2,2), imshow(b)
