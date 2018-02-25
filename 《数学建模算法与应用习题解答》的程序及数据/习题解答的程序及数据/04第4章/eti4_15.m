clc, clear
x=[0.9501 0.2311 0.6068 0.4860 0.8913 0.7621 0.4565 0.0185 0.8214 0.4447];
y=[0.9528 0.7041 0.9539 0.5982 0.8407 0.4428 0.8368 0.5187 0.0222 0.3759];
[vx,vy]=voronoi(x,y);
plot(x,y,'r*',vx,vy,'ko-');
xlim([0 1]), ylim([0 1])
hold on
tri = delaunay(x,y);
h=triplot(tri,x,y,'b:');
legend('delaunayÈý½ÇÐÎ','voronoiÍ¼',2)
