load sj.txt
fen=sj(:,1:2:20);p=sj(:,2:2:20);
fid1=fopen('fen.txt','w');
fid2=fopen('gai.txt','w');
for i=1:4
    for j=1:10
        for k=1:4
            fprintf(fid1,'%f\n',fen(4*(i-1)+k,j));
            fprintf(fid2,'%f\n',p(4*(i-1)+k,j));
        end
    end
end
fclose(fid1);fclose(fid2);
