data ex;/*已知类型训练样本*/
input g  x1-x3 @@;
cards;
1  76   99    5374  1  79.5   99    5359  1  78    99     5372 
1  72.1 95.9  5242  1  73.8  77.7   5370  2  71.2   93    4250  
2  75.3 94.9  3412  2  70    91.2   3390  2  72.8   99    2300  
2  62.9 80.6  3799
;
data ex1;
input x1-x3 @@;
cards;
68.5      79.3         1950
69.9      96.9         2840
77.6      93.8         5233
69.3      90.3          5158
;
proc discrim /*判别分析模块*/
data=ex testdata=ex1/*待判别集合*/
anova manova simple list testout=ex2;
class g;
proc print data=ex2;run;
