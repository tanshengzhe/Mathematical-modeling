data ex17;  /*例1.7(用proc score 过程输出样品因子分)*/
input objects$ pop school employ services house@@;
cards;
A   5700 12.8 2500 270 25000  B   1000 10.9 600  10  10000
C  3400 8.8  1000 10  9000      D    3800 13.6 1700 140 25000
E  4000 12.8 1600 140 25000   F     8200 8.3  2600 60  12000
G  1200 11.4 400  10  16000    H    9100 11.5 3300 60  14000
I  9900 12.5 3400 180 18000    J    9600 13.7 3600 390 25000
K  9600 9.6  3300 80  12000     L  9400 11.4 4000 100 13000
;
/*用proc score 过程输出样品因子得分*/
proc factor data=ex17 method=principal rotate=varimax  
 percent=0.8   
score  outstat=ex1;
var  pop school employ services house;
run;
proc score data=ex17 score=ex1 out=ex2;
var pop school employ services house;
run;
proc print data=ex1;
proc print data=ex2;
run;