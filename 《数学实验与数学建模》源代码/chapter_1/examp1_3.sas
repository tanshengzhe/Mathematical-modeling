	data ex;input x1 x2 factory$@@;/*符号$：表示定义字符型变量*/
	cards;
	0	6   f1  0	5   f2  2	5   f3  2	3   f4    4	4   f5  4	3   f6
	5	1   f7  6	2   f8  6	1   f9  7   0   f10  -4	3   f11 -2	2   f12
	-3	2   f13 -3	0   f14 -5	2   f15 1	1   f16   0	-1  f17  0	-2  f18
	-1	-1  f19 -1	-3  f20  -3	-5  f21
	;
	proc cluster /*系统聚类*/
	data=ex method=ward ccc pseudo outtree=tree;/*ward法，要使用不同的聚类方法可换对应方法的关键词，CCC表示要求计算R2、半偏R2 和CCC统计量。PSEUDO选项要求计算伪F (PSF)和伪T2 (PST2)统计量 */
	id factory;
	run;
	proc tree data=tree horizontal; /*水平树*/
	id factory;;/*工厂为样本*/
	run;