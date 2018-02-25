function ti12_1
fun1=@(x) (x(1)-2)^2+(x(2)-1)^2;
[x,val]=ga(fun1,2,[],[],[],[],[],[],@fun2)
function [c,ceq]=fun2(x);
c=-x(1)^2/4+x(2)^2-1; ceq=[];
