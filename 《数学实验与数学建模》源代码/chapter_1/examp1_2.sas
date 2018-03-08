	data ex;
	input y x1-x4@@;
	y1=log(y);z1=log(x1);z2=log(x2);z3=log(x3);z4=log(x4);/*对数据做变化，取对数后再做回归分析*/
	cards;
	16.8453	5.6092	7.4436	6.3735	3.7925
	21.383	6.6329	10.0585	8.7584	4.6916
	23.1716	6.5819	11.1424	9.6623	5.4473
	25.7289	7.0974	12.3181	10.6641	6.3134
	28.6247	7.7973	13.5101	11.288	7.3173
	32.3103	9.1952	14.6343	12.0864	8.4808
	36.4037	10.0688	16.1664	12.9822	10.1685
	45.0774	12.0844	19.7301	15.5838	13.2629
	51.4749	13.1395	22.252	17.4528	16.0834
	63.4135	17.4543	27.5363	21.4193	21.1229
	82.3484	19.4304	35.6294	28.8678	27.2886
	92.7143	21.2031	39.3832	33.0194	32.128
	101.4633	24.3772	40.5796	34.3378	36.5065
	117.4178	24.1941	48.4759	41.0114	44.7478
	147.5213	26.6151	62.6834	52.2893	58.2219
	188.8958	30.1613	82.3853	67.8921	76.3492
	253.0577	35.8777	111.324	91.4335	105.856
	320.4072	45.578	137.4362	102.6372	137.393
	397.5701	58.3757	167.9238	130.2389	171.2706
	475.8691	68.732	197.5005	157.0486	209.6366
	534.5969	70.7519	222.8439	174.1697	241.0011
	580.036	71.3285	238.4684	187.0766	270.2391
	656.4098	74.1104	268.3988	206.0297	313.9006
	728.0774	78.3636	297.0933	217.9077	352.6205
	812.8469	79.1826	328.0378	229.521	405.6265
	929.4858	83.2886	393.6734	268.2806	452.5238
	1133.8828	103.3327	504.571	341.5303	525.9791
	1519.90 	112.59	655.27	469.28	752.04
	1790.66	123.25	774.66	584.41	892.75
	;
	proc reg;/*reg调用回归模块*/
	model y1=z1 z2 z4/cli;/*表示以z1 z2 z4为自变量，y1为应变量建立回归模型，/cli表示要求预测区间。加入/selection=stepwise时，表示逐步回归分析*/
	proc corr;var z1-z4;/*求相关系数矩阵*/
	run;