clc, clear
a=-ones(1,4); b=2*ones(1,3);
Q=diag(a)+diag(b,1)+diag(b,-1) %构造三对角线矩阵Q
dlmwrite('ex37.txt',Q) %把数据矩阵Q保存到纯文本文件，供Lingo软件调用
