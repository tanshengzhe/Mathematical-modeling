goptions vsize=25cm hsize=25cm;/*g表示图，options表示选择，vsize=25cm纵向高度为25*/
data a;                             /*a为数据名*/
input  sha@@;                      /*@@为自动换行*/
year=intnx('year','1jan1964'd,_n_-1);/*intnx间隔取时间变量*/
format year year4.;                /*年按四位数显示*/
cards;
97 130 156.5 135.2 137.7 180.5 205.2 190 188.6 196.7
180.3 210.8 196 223 238.2 263.5 292.6 317 335.4 327
321.9 353.5 397.8 436.8 465.7 476.7 462.6 460.8
501.8 501.5 489.5 542.3 512.2 559.8 542 567
;
run;
proc gplot;                            /*画图*/
plot sha*year;                        /*纵轴乘以横轴*/
symbol v=circle i=join c=blue;     /* v=circle表示用小圆圈来表示, i=join把点连接起来，c=blue 表示蓝色为蓝色*/
proc arima data=a;
identify var=sha nlag=22;           /*延迟阶数为22阶*/
run;