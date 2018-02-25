clc, clear
fid1=fopen('fengmian_heibai.tif','r');
fid2=fopen('fengmian_huidu.tif','r');
b1=fread(fid1,2,'uint16'), b2=fread(fid2,2,'uint16')
c1=fread(fid1,1,'uint32'), c2=fread(fid2,1,'uint32') 
