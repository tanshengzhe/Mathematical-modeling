clc, clear
c=1:4; c=[c,c]';
aeq=[1 -1 -1 1; 1 -1 1 -3; 1 -1 -2 3];
beq=[0 1 -1/2];
aeq=[aeq,-aeq];
[uv,val]=linprog(c,[],[],aeq,beq,zeros(8,1))
x=uv(1:4)-uv(5:end)
