function zf=fun3_3(delta);
M=100000;
f=sum(delta.^2);
th0=[243 236 220.5 159 230 52]'; th=th0+delta;
x0=[150 85 150 145 130 0]';
y0=[140 85 155 50 150 0]';
k=1;
for i=1:5
    for j=i+1:6
        aij=4*(sind((th(i)-th(j))/2))^2;
        bij=2*((x0(i)-x0(j))*(cosd(th(i))-cosd(th(j)))+...
            (y0(i)-y0(j))*(sind(th(i))-sind(th(j))));
        cij=(x0(i)-x0(j))^2+(y0(i)-y0(j))^2-64;
        g(k)=bij^2-4*aij*cij;
        k=k+1;
    end
end
zf=f+M*max([g,0]);
