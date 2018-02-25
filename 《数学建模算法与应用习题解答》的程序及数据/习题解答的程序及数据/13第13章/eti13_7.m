clc, clear
x=rand(1,10); bar(x);
h=getframe(gcf); imwrite(h.cdata,'my.jpg')
