model:
sets:
var/1..3/:c,x,lb;
endsets
data:
c=58 54 50; !目标函数的一次项系数;
lb=40 0 0; !决策变量的下界向量;
enddata
min=0.2*@sum(var:x^2)+@sum(var:c*x)-560;
x(1)+x(2)>100;
@sum(var:x)=180;
@for(var:@bnd(lb,x,100));
end
