clc, clear
nodes = [0 1 2 2 4 4 4 1 8 8 10 10];
treeplot(nodes,'.b')
count = length(nodes);
[x,y] = treelayout(nodes)
name=cellstr(num2str((1:count)'))
text(x+0.008, y, name,'FontSize',8,'color','k')
