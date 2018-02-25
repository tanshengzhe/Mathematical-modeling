clc, clear
h=[1 2 1; 2 4 2; 1 2 1]/16;
a=imread('tiaozhuang.jpg');
b=imfilter(a,h);
subplot(1,2,1), imshow(a),title('Ô­Í¼Ïñ')
subplot(1,2,2), imshow(b), title('ÂË²¨ºóµÄÍ¼Ïñ')
