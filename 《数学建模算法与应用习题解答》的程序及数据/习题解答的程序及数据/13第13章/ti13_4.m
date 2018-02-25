clc, clear
a=imread('fengmian.bmp');
imwrite(a,'fengmian.jpg')
subplot(1,2,1), imshow(a)
subplot(1,2,2), imshow('fengmian.jpg')
