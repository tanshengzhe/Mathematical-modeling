clc, clear
dx=@(t,y,z)[-y(1)*z(2,1)+z(2,2)
    y(1)*z(2,1)-y(2)
    y(2)-z(2,2)];
his=@(t)[5; 0.1; 1];
sol=dde23(dx,[1,10],his,[0,40])
plot(sol.x,sol.y(1,:),'-o',sol.x,sol.y(2,:),'-^',sol.x,sol.y(3,:),'-P')
legend('x_1','x_2','x_3'), xlabel('t'), ylabel('x')
