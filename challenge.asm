	830	reg0 = 32766 * 15
	834	reg1 = reg0 == 32738
	838	jf	reg1	label20
	841	jmp	label24
label24:
	845	reg0 = mem[843]
	848	reg1 = reg0 == 20000
	852	jf	reg1	label25
	855	reg2 = 843 + 1
	859	reg0 = mem[reg2]
	862	reg1 = reg0 == 10000
	866	jf	reg1	label25
	869	reg0 = 843
	872	mem[reg0] = 30000
	875	reg2 = mem[reg0]
	878	reg1 = reg2 == 30000
	882	jf	reg1	label26
	885	call	func1
	887	reg0 = mem[6068]
	890	reg1 = reg0 == 11
	894	jf	reg1	label25
	897	reg2 = 6068 + 1
	901	reg0 = mem[reg2]
	904	reg1 = reg0 == 116
	908	jf	reg1	label25
	911	mem[reg2] = 84
	914	reg0 = mem[reg2]
	917	reg1 = reg0 == 116
	921	jt	reg1	label26
	924	reg1 = reg0 == 84
	928	jf	reg1	label26
	931	mem[937] = 21
	934	mem[938] = 7
	937	jmp	label27
	939	out	"Òwmem opwrite fail\n"
	977	halt	
	978	reg1 = 10 + 6080
	982	reg1 = reg1 + 1
	986	reg2 = mem[6116]
	989	reg2 = reg2 + 6116
	993	reg0 = 6116
	996	reg0 = reg0 + 1
label29:
	1000	gt  	reg3	reg0	reg2	
	1004	jt	reg3	label28
	1007	reg4 = mem[reg0]
	1010	mem[reg1] = reg4
	1013	reg0 = reg0 + 1
	1017	reg1 = reg1 + 1
	1021	jmp	label29
label28:
	1023	reg0 = mem[6080]
	1026	reg1 = mem[6099]
	1029	reg0 = reg0 + reg1
	1033	reg0 = reg0 + 1
	1037	mem[6080] = reg0
	1040	mem[6099] = 44
	1043	reg0 = 6080
	1046	call	func2
	1048	push	reg0	
	1050	push	reg1	
	1052	push	reg2	
	1054	reg0 = 26851
	1057	reg1 = 1531
	1060	reg2 = 1078 + 17609
	1064	call	func3
	1066	pop 	reg2	
	1068	pop 	reg1	
	1070	pop 	reg0	
	1072	jmp	label30
label7:
	1074	out	"no jt/jf\n"
	1092	halt	
label10:
	1093	out	"nonzero reg\n"
	1117	halt	
label11:
	1118	out	"no set op\n"
	1138	halt	
label15:
	1139	out	"no gt op\n"
	1157	halt	
label14:
	1158	out	"no stack\n"
	1176	halt	
label16:
	1177	out	"no bitwise and\n"
	1207	halt	
label18:
	1208	out	"no bitwise not\n"
	1238	halt	
label25:
	1239	out	"no rmem op\n"
	1261	halt	
label26:
	1262	out	"no wmem op\n"
	1284	halt	
func0:
	1285	jmp	label31
	1287	jmp	label32
label19:
	1289	out	"no call op\n"
	1311	halt	
label20:
	1312	out	"no modulo math during add or mult\n"
	1380	halt	
label21:
	1381	out	"not hitchhiking\n"
	1413	halt	
label22:
	1414	out	"no mult op\n"
	1436	halt	
label23:
	1437	out	"no mod op\n"
	1457	halt	
func3:
	1458	push	reg0	
	1460	push	reg3	
	1462	push	reg4	
	1464	push	reg5	
	1466	push	reg6	
	1468	reg6 = reg0
	1471	reg5 = reg1
	1474	reg4 = mem[reg0]
	1477	reg1 = 0
label34:
	1480	reg3 = 1 + reg1
	1484	gt  	reg0	reg3	reg4	
	1488	jt	reg0	label33
	1491	reg3 = reg3 + reg6
	1495	reg0 = mem[reg3]
	1498	call	reg5
	1500	reg1 = reg1 + 1
	1504	jt	reg1	label34
label33:
	1507	pop 	reg6	
	1509	pop 	reg5	
	1511	pop 	reg4	
	1513	pop 	reg3	
	1515	pop 	reg0	
	1517	ret 	
func2:
	1518	push	reg1	
	1520	reg1 = 1528
	1523	call	func3
	1525	pop 	reg1	
	1527	ret 	
	1528	out	reg0
	1530	ret 	
	1531	push	reg1	
	1533	reg1 = reg2
	1536	call	func4
	1538	out	reg0
	1540	pop 	reg1	
	1542	ret 	
func5:
	1543	push	reg1	
	1545	push	reg3	
	1547	reg3 = mem[reg0]
	1550	jf	reg3	label35
	1553	call	func3
	1555	jt	reg1	label35
	1558	reg0 = reg2
	1561	jmp	label36
label35:
	1563	reg0 = 32767
label36:
	1566	pop 	reg3	
	1568	pop 	reg1	
	1570	ret 	
func9:
	1571	push	reg1	
	1573	push	reg2	
	1575	reg2 = reg1
	1578	reg1 = 1605
	1581	call	func5
	1583	pop 	reg2	
	1585	pop 	reg1	
	1587	ret 	
func10:
	1588	push	reg1	
	1590	push	reg2	
	1592	reg2 = reg1
	1595	reg1 = 1648
	1598	call	func5
	1600	pop 	reg2	
	1602	pop 	reg1	
	1604	ret 	
	1605	reg0 = reg0 == reg2
	1609	jf	reg0	label37
	1612	reg2 = reg1
	1615	reg1 = 32767
label37:
	1618	ret 	
	1619	push	reg3	
	1621	reg3 = reg2 + 1
	1625	reg3 = reg3 + reg1
	1629	reg3 = mem[reg3]
	1632	reg3 = reg0 == reg3
	1636	jt	reg3	label38
	1639	reg2 = reg1
	1642	reg1 = 32767
label38:
	1645	pop 	reg3	
	1647	ret 	
	1648	push	reg1	
	1650	reg1 = reg2
	1653	call	func6
	1655	pop 	reg1	
	1657	jf	reg0	label39
	1660	reg2 = reg1
	1663	reg1 = 32767
label39:
	1666	ret 	
func6:
	1667	push	reg1	
	1669	push	reg2	
	1671	push	reg3	
	1673	push	reg4	
	1675	reg3 = mem[reg0]
	1678	reg4 = mem[reg1]
	1681	reg2 = reg3 == reg4
	1685	jf	reg2	label40
	1688	reg2 = reg3 | reg4
	1692	jf	reg2	label41
	1695	reg2 = reg1
	1698	reg1 = 1619
	1701	call	func3
	1703	jf	reg1	label40
label41:
	1706	reg0 = 1
	1709	jmp	label42
label40:
	1711	reg0 = 0
label42:
	1714	pop 	reg4	
	1716	pop 	reg3	
	1718	pop 	reg2	
	1720	pop 	reg1	
	1722	ret 	
func1:
	1723	push	reg0	
	1725	push	reg1	
	1727	reg1 = 6068
label43:
	1730	reg0 = mem[reg1]
	1733	push	reg1	
	1735	reg1 = reg1 * reg1
	1739	call	func4
	1741	reg1 = 16724
	1744	call	func4
	1746	pop 	reg1	
	1748	mem[reg1] = reg0
	1751	reg1 = reg1 + 1
	1755	reg0 = 30050 == reg1
	1759	jf	reg0	label43
	1762	pop 	reg1	
	1764	pop 	reg0	
	1766	ret 	
func8:
	1767	push	reg0	
	1769	push	reg2	
	1771	push	reg3	
	1773	push	reg4	
	1775	push	reg5	
	1777	reg2 = reg1 + reg0
	1781	reg0 = reg1
	1784	reg5 = 0
label45:
	1787	reg0 = reg0 + 1
	1791	gt  	reg3	reg0	reg2	
	1795	jt	reg3	label44
	1798	in  	reg4	
	1800	reg3 = reg4 == 10
	1804	jt	reg3	label44
	1807	mem[reg0] = reg4
	1810	reg5 = reg5 + 1
	1814	jmp	label45
label44:
	1816	mem[reg1] = reg5
label47:
	1819	reg3 = reg4 == 10
	1823	jt	reg3	label46
	1826	in  	reg4	
	1828	jmp	label47
label46:
	1830	pop 	reg5	
	1832	pop 	reg4	
	1834	pop 	reg3	
	1836	pop 	reg2	
	1838	pop 	reg0	
	1840	ret 	
func17:
	1841	push	reg3	
	1843	push	reg4	
	1845	push	reg5	
	1847	push	reg6	
	1849	reg6 = 1
label48:
	1852	reg4 = reg3 + reg6
	1856	reg4 = mem[reg4]
	1859	reg5 = 6125 + reg6
	1863	mem[reg5] = reg4
	1866	reg6 = reg6 + 1
	1870	reg5 = mem[6125]
	1873	gt  	reg4	reg6	reg5	
	1877	jf	reg4	label48
label51:
	1880	reg3 = 0
	1883	reg4 = 0
label50:
	1886	reg5 = mem[6125]
	1889	reg5 = reg4 % reg5
	1893	reg5 = reg5 + 6125
	1897	reg5 = reg5 + 1
	1901	reg6 = mem[reg5]
	1904	reg6 = reg6 * 5249
	1908	reg6 = reg6 + 12345
	1912	mem[reg5] = reg6
	1915	push	reg0	
	1917	push	reg1	
	1919	reg1 = reg6
	1922	call	func4
	1924	reg6 = reg0
	1927	pop 	reg1	
	1929	pop 	reg0	
	1931	reg5 = mem[reg1]
	1934	reg6 = reg6 % reg5
	1938	reg6 = reg6 + 1
	1942	gt  	reg5	reg6	reg2	
	1946	jt	reg5	label49
	1949	reg3 = 1
label49:
	1952	reg6 = reg6 + reg1
	1956	reg6 = mem[reg6]
	1959	reg4 = reg4 + 1
	1963	reg5 = reg4 + 6129
	1967	mem[reg5] = reg6
	1970	reg5 = mem[6129]
	1973	reg5 = reg4 == reg5
	1977	jf	reg5	label50
	1980	jf	reg3	label51
	1983	push	reg0	
	1985	reg0 = 6129
	1988	call	func2
	1990	pop 	reg0	
	1992	pop 	reg6	
	1994	pop 	reg5	
	1996	pop 	reg4	
	1998	pop 	reg3	
	2000	ret 	
func15:
	2001	push	reg0	
	2003	push	reg1	
	2005	push	reg2	
	2007	push	reg3	
	2009	push	reg4	
	2011	push	reg5	
	2013	reg2 = 1
	2016	reg5 = 0
label56:
	2019	jf	reg0	label52
	2022	reg4 = reg2 == 10000
	2026	reg3 = reg0
	2029	jt	reg4	label53
	2032	reg1 = reg2 * 10
	2036	reg3 = reg0 % reg1
label53:
	2040	reg4 = 0
	2043	reg2 = reg2 * 32767
label55:
	2047	jf	reg3	label54
	2050	reg4 = reg4 + 1
	2054	reg3 = reg3 + reg2
	2058	jmp	label55
label54:
	2060	reg2 = reg2 * 32767
	2064	reg3 = reg4 * reg2
	2068	reg3 = reg3 * 32767
	2072	reg0 = reg0 + reg3
	2076	reg4 = reg4 + 48
	2080	reg2 = reg2 * 10
	2084	reg5 = reg5 + 1
	2088	push	reg4	
	2090	jmp	label56
label52:
	2092	jt	reg5	label57
	2095	out	"0"
	2097	jmp	label58
label57:
	2099	jf	reg5	label58
	2102	pop 	reg0	
	2104	out	reg0
	2106	reg5 = reg5 + 32767
	2110	jmp	label57
label58:
	2112	pop 	reg5	
	2114	pop 	reg4	
	2116	pop 	reg3	
	2118	pop 	reg2	
	2120	pop 	reg1	
	2122	pop 	reg0	
	2124	ret 	
func4:
	2125	push	reg1	
	2127	push	reg2	
	2129	reg2 = reg0 & reg1
	2133	reg2 = ~reg2
	2136	reg0 = reg0 | reg1
	2140	reg0 = reg0 & reg2
	2144	pop 	reg2	
	2146	pop 	reg1	
	2148	ret 	
	2149	reg0 = reg0 + reg1
	2153	gt  	reg1	reg1	reg0	
	2157	ret 	
	2158	push	reg2	
	2160	gt  	reg2	reg1	reg0	
	2164	reg1 = reg1 * 32767
	2168	reg0 = reg0 + reg1
	2172	reg1 = reg2
	2175	pop 	reg2	
	2177	ret 	
	2178	jf	reg0	label59
	2181	jf	reg1	label59
	2184	push	reg2	
	2186	push	reg3	
	2188	gt  	reg2	reg1	reg0	
	2192	jt	reg2	label60
	2195	reg2 = reg0
	2198	reg0 = reg1
	2201	reg1 = reg2
label60:
	2204	reg2 = reg0
	2207	reg0 = 0
label62:
	2210	reg0 = reg0 + reg1
	2214	gt  	reg3	reg1	reg0	
	2218	jt	reg3	label61
	2221	reg2 = reg2 + 32767
	2225	jt	reg2	label62
	2228	reg1 = 0
	2231	jmp	label63
label61:
	2233	reg1 = 1
label63:
	2236	pop 	reg3	
	2238	pop 	reg2	
	2240	ret 	
label59:
	2241	reg0 = 0
	2244	reg1 = 0
	2247	ret 	
func25:
	2248	push	reg1	
	2250	push	reg2	
label65:
	2252	jf	reg1	label64
	2255	reg1 = reg1 + 32767
	2259	reg2 = reg0 & 16384
	2263	reg0 = reg0 * 2
	2267	jf	reg2	label65
	2270	reg0 = reg0 | 1
	2274	jmp	label65
label64:
	2276	pop 	reg2	
	2278	pop 	reg1	
	2280	ret 	
func24:
	2281	push	reg1	
	2283	gt  	reg1	reg0	14	
	2287	jt	reg1	label66
	2290	reg1 = reg0
	2293	reg0 = 1
label68:
	2296	jf	reg1	label67
	2299	reg1 = reg1 + 32767
	2303	reg0 = reg0 * 2
	2307	jmp	label68
label66:
	2309	reg0 = 32767
label67:
	2312	pop 	reg1	
	2314	ret 	
	2315	jmp	label30
	2321	halt	
	2326	halt	
	2331	halt	
	2336	halt	
	2341	halt	
	2346	halt	
	2351	halt	
	2356	halt	
	2361	halt	
	2366	halt	
	2371	halt	
	2376	halt	
	2421	halt	
	2451	halt	
	2456	halt	
	2461	halt	
	2462	halt	
	2472	halt	
	2477	halt	
	2482	halt	
	2487	halt	
	2492	halt	
	2497	halt	
	2502	halt	
	2507	halt	
	2512	halt	
	2517	halt	
	2522	halt	
	2527	halt	
	2532	halt	
	2537	halt	
	2542	halt	
	2547	halt	
	2552	halt	
	2557	halt	
	2652	halt	
	2657	halt	
	2662	halt	
	2675	halt	
	2715	halt	
	2719	halt	
	2727	halt	
	2731	halt	
	2733	halt	
label30:
	2734	push	reg0	
	2736	push	reg1	
	2738	push	reg2	
	2740	push	reg3	
label77:
	2742	reg1 = mem[2732]
	2745	reg0 = mem[2733]
	2748	reg0 = reg0 == reg1
	2752	jt	reg0	label69
	2755	reg0 = mem[2732]
	2758	reg0 = reg0 + 4
	2762	reg0 = mem[reg0]
	2765	jf	reg0	label69
	2768	call	reg0
label69:
	2770	reg1 = mem[2732]
	2773	reg0 = mem[2733]
	2776	reg0 = reg0 == reg1
	2780	jt	reg0	label70
	2783	reg0 = 25974
	2786	mem[reg0] = 0
	2789	call	func7
label70:
	2791	mem[2733] = reg1
	2794	push	reg0	
	2796	push	reg1	
	2798	push	reg2	
	2800	reg0 = 27414
	2803	reg1 = 1531
	2806	reg2 = 13294 + 1801
	2810	call	func3
	2812	pop 	reg2	
	2814	pop 	reg1	
	2816	pop 	reg0	
	2818	reg0 = 32
	2821	reg1 = 25974
	2824	call	func8
	2826	out	"\n"
	2828	out	"\n"
	2830	reg0 = 25974
	2833	reg1 = 32
	2836	call	func9
	2838	reg1 = reg0 == 32767
	2842	jf	reg1	label71
	2845	reg0 = mem[25974]
label71:
	2848	reg2 = reg0
	2851	reg1 = mem[25974]
	2854	push	reg1	
	2856	mem[25974] = reg2
	2859	reg0 = 27398
	2862	reg1 = 25974
	2865	call	func10
	2867	pop 	reg1	
	2869	mem[25974] = reg1
	2872	reg1 = reg0 == 32767
	2876	jf	reg1	label72
	2879	reg0 = 0
	2882	reg2 = 0
label72:
	2885	reg1 = 27406 + 1
	2889	reg1 = reg1 + reg0
	2893	reg1 = mem[reg1]
	2896	reg3 = mem[25974]
	2899	reg3 = reg3 == reg2
	2903	jt	reg3	label73
	2906	reg0 = reg2 * 32767
	2910	reg3 = mem[25974]
	2913	reg3 = reg0 + reg3
	2917	jf	reg2	label74
	2920	reg3 = reg3 + 32767
label74:
	2924	reg3 = reg3 % 32
	2928	reg0 = 25974 + reg2
	2932	jf	reg2	label75
	2935	reg0 = reg0 + 1
label75:
	2939	mem[reg0] = reg3
	2942	jmp	label76
label73:
	2944	reg0 = 25974
	2947	mem[reg0] = 0
label76:
	2950	call	reg1
	2952	jt	reg1	label77
	2955	pop 	reg3	
	2957	pop 	reg2	
	2959	pop 	reg1	
	2961	pop 	reg0	
	2963	ret 	
func7:
	2964	push	reg0	
	2966	push	reg1	
	2968	push	reg2	
	2970	reg1 = mem[reg0]
	2973	jf	reg1	label78
	2976	call	func11
	2978	jf	reg0	label79
	2981	push	reg0	
	2983	call	func12
	2985	reg1 = reg0
	2988	pop 	reg0	
	2990	jf	reg1	label79
	2993	reg1 = reg0 + 1
	2997	reg0 = mem[reg1]
	3000	call	func2
	3002	out	"\n"
	3004	jmp	label80
label79:
	3006	push	reg0	
	3008	push	reg1	
	3010	push	reg2	
	3012	reg0 = 27432
	3015	reg1 = 1531
	3018	reg2 = 2315 + 7775
	3022	call	func3
	3024	pop 	reg2	
	3026	pop 	reg1	
	3028	pop 	reg0	
	3030	jmp	label80
label78:
	3032	reg0 = mem[2732]
	3035	push	reg0	
	3037	out	"== "
	3043	reg0 = reg0 + 0
	3047	reg0 = mem[reg0]
	3050	call	func2
	3052	out	" ==\n"
	3060	pop 	reg0	
	3062	push	reg0	
	3064	reg0 = reg0 + 1
	3068	reg0 = mem[reg0]
	3071	reg1 = mem[reg0]
	3074	reg1 = reg1 == 2
	3078	jf	reg1	label81
	3081	push	reg0	
	3083	reg0 = 2680
	3086	call	func12
	3088	reg1 = reg0
	3091	pop 	reg0	
	3093	reg0 = reg0 + 1
	3097	reg0 = reg0 + reg1
	3101	reg0 = mem[reg0]
label81:
	3104	call	func2
	3106	out	"\n"
	3108	pop 	reg0	
	3110	push	reg0	
	3112	call	func13
	3114	jf	reg0	label82
	3117	push	reg0	
	3119	push	reg1	
	3121	push	reg2	
	3123	reg0 = 27455
	3126	reg1 = 1531
	3129	reg2 = 4163 + 5817
	3133	call	func3
	3135	pop 	reg2	
	3137	pop 	reg1	
	3139	pop 	reg0	
	3141	reg2 = mem[2732]
	3144	call	func14
label82:
	3146	pop 	reg0	
	3148	push	reg0	
	3150	reg0 = reg0 + 2
	3154	reg0 = mem[reg0]
	3157	reg0 = mem[reg0]
	3160	reg2 = reg0 == 1
	3164	out	"\n"
	3166	out	"There "
	3178	jt	reg2	label83
	3181	out	"are"
	3187	jmp	label84
label83:
	3189	out	"is "
	3195	call	func15
	3197	out	" exit"
	3207	reg2 = reg0 == 1
	3211	jt	reg2	label85
	3214	out	"s:\n"
	3220	pop 	reg0	
	3222	push	reg0	
	3224	reg0 = reg0 + 2
	3228	reg0 = mem[reg0]
	3231	reg1 = 5814
	3234	call	func3
	3236	pop 	reg0	
label80:
	3238	pop 	reg2	
	3240	pop 	reg1	
	3242	pop 	reg0	
	3244	ret 	
	3245	push	reg0	
	3247	push	reg1	
	3249	push	reg2	
	3251	reg1 = reg0
	3254	reg0 = mem[2732]
	3257	reg0 = reg0 + 2
	3261	reg0 = mem[reg0]
	3264	call	func10
	3266	reg2 = reg0 == 32767
	3270	jt	reg2	label86
	3273	reg2 = mem[2732]
	3276	reg2 = reg2 + 3
	3280	reg2 = mem[reg2]
	3283	reg2 = reg2 + 1
	3287	reg2 = reg2 + reg0
	3291	reg2 = mem[reg2]
	3294	mem[2732] = reg2
	3297	mem[2733] = 0
	3300	jmp	label87
label86:
	3302	push	reg0	
	3304	push	reg1	
	3306	push	reg2	
	3308	reg0 = 27482
	3311	reg1 = 1531
	3314	reg2 = 18663 + 10897
	3318	call	func3
	3320	pop 	reg2	
	3322	pop 	reg1	
	3324	pop 	reg0	
label87:
	3326	pop 	reg2	
	3328	pop 	reg1	
	3330	pop 	reg0	
	3332	ret 	
	3333	push	reg0	
	3335	push	reg0	
	3337	push	reg1	
	3339	push	reg2	
	3341	reg0 = 27532
	3344	reg1 = 1531
	3347	reg2 = 10707 + 662
	3351	call	func3
	3353	pop 	reg2	
	3355	pop 	reg1	
	3357	pop 	reg0	
	3359	pop 	reg0	
	3361	ret 	
	3362	push	reg0	
	3364	push	reg2	
	3366	push	reg0	
	3368	push	reg1	
	3370	push	reg2	
	3372	reg0 = 28037
	3375	reg1 = 1531
	3378	reg2 = 2450 + 9305
	3382	call	func3
	3384	pop 	reg2	
	3386	pop 	reg1	
	3388	pop 	reg0	
	3390	reg2 = 0
	3393	call	func14
	3395	pop 	reg2	
	3397	pop 	reg0	
	3399	ret 	
	3400	push	reg0	
	3402	push	reg1	
	3404	push	reg2	
	3406	call	func11
	3408	jf	reg0	label88
	3411	reg1 = reg0 + 2
	3415	reg0 = mem[reg1]
	3418	reg2 = mem[2732]
	3421	reg2 = reg0 == reg2
	3425	jf	reg2	label88
	3428	mem[reg1] = 0
	3431	push	reg0	
	3433	push	reg1	
	3435	push	reg2	
	3437	reg0 = 28054
	3440	reg1 = 1531
	3443	reg2 = 2753 + 311
	3447	call	func3
	3449	pop 	reg2	
	3451	pop 	reg1	
	3453	pop 	reg0	
	3455	jmp	label89
label88:
	3457	push	reg0	
	3459	push	reg1	
	3461	push	reg2	
	3463	reg0 = 28062
	3466	reg1 = 1531
	3469	reg2 = 428 + 4159
	3473	call	func3
	3475	pop 	reg2	
	3477	pop 	reg1	
	3479	pop 	reg0	
label89:
	3481	pop 	reg2	
	3483	pop 	reg1	
	3485	pop 	reg0	
	3487	ret 	
	3488	push	reg0	
	3490	push	reg1	
	3492	call	func11
	3494	jf	reg0	label90
	3497	reg1 = reg0 + 2
	3501	reg0 = mem[reg1]
	3504	jt	reg0	label90
	3507	reg0 = mem[2732]
	3510	mem[reg1] = reg0
	3513	push	reg0	
	3515	push	reg1	
	3517	push	reg2	
	3519	reg0 = 28090
	3522	reg1 = 1531
	3525	reg2 = 16466 + 16291
	3529	call	func3
	3531	pop 	reg2	
	3533	pop 	reg1	
	3535	pop 	reg0	
	3537	jmp	label91
label90:
	3539	push	reg0	
	3541	push	reg1	
	3543	push	reg2	
	3545	reg0 = 28100
	3548	reg1 = 1531
	3551	reg2 = 11842 + 4026
	3555	call	func3
	3557	pop 	reg2	
	3559	pop 	reg1	
	3561	pop 	reg0	
label91:
	3563	pop 	reg1	
	3565	pop 	reg0	
	3567	ret 	
	3568	push	reg0	
	3570	push	reg1	
	3572	call	func11
	3574	jf	reg0	label92
	3577	reg1 = reg0 + 2
	3581	reg1 = mem[reg1]
	3584	jt	reg1	label92
	3587	reg1 = reg0 + 3
	3591	reg1 = mem[reg1]
	3594	jf	reg1	label93
	3597	call	reg1
	3599	jmp	label94
label92:
	3601	push	reg0	
	3603	push	reg1	
	3605	push	reg2	
	3607	reg0 = 28135
	3610	reg1 = 1531
	3613	reg2 = 2830 + 228
	3617	call	func3
	3619	pop 	reg2	
	3621	pop 	reg1	
	3623	pop 	reg0	
	3625	jmp	label94
label93:
	3627	push	reg0	
	3629	push	reg1	
	3631	push	reg2	
	3633	reg0 = 28170
	3636	reg1 = 1531
	3639	reg2 = 4805 + 23076
	3643	call	func3
	3645	pop 	reg2	
	3647	pop 	reg1	
	3649	pop 	reg0	
label94:
	3651	pop 	reg1	
	3653	pop 	reg0	
	3655	ret 	
	3656	push	reg0	
	3658	push	reg1	
	3660	push	reg2	
	3662	reg0 = 2680
	3665	call	func12
	3667	jt	reg0	label95
	3670	reg0 = 2676 + 2
	3674	mem[reg0] = 32767
	3677	reg0 = 2680 + 2
	3681	mem[reg0] = 32767
	3684	reg0 = 2672 + 2
	3688	mem[reg0] = 32767
	3691	mem[2732] = 2648
label95:
	3694	pop 	reg2	
	3696	pop 	reg1	
	3698	pop 	reg0	
	3700	ret 	
	3701	push	reg0	
	3703	push	reg1	
	3705	push	reg2	
	3707	reg0 = 28204
	3710	reg1 = 1531
	3713	reg2 = 5018 + 465
	3717	call	func3
	3719	pop 	reg2	
	3721	pop 	reg1	
	3723	pop 	reg0	
	3725	halt	
	3726	halt	
func16:
	3727	push	reg1	
	3729	reg1 = mem[3726]
	3732	reg1 = reg1 | reg0
	3736	mem[3726] = reg1
	3739	pop 	reg1	
	3741	ret 	
	3742	mem[3726] = 0
	3745	ret 	
	3746	push	reg0	
	3748	reg0 = 1
	3751	call	func16
	3753	pop 	reg0	
	3755	ret 	
	3756	push	reg0	
	3758	reg0 = 2
	3761	call	func16
	3763	pop 	reg0	
	3765	ret 	
	3766	push	reg0	
	3768	reg0 = 4
	3771	call	func16
	3773	pop 	reg0	
	3775	ret 	
	3776	push	reg0	
	3778	reg0 = 8
	3781	call	func16
	3783	pop 	reg0	
	3785	ret 	
	3786	push	reg0	
	3788	reg0 = 16
	3791	call	func16
	3793	pop 	reg0	
	3795	ret 	
	3796	push	reg0	
	3798	reg0 = 32
	3801	call	func16
	3803	pop 	reg0	
	3805	ret 	
	3806	push	reg0	
	3808	push	reg1	
	3810	push	reg2	
	3812	push	reg3	
	3814	reg0 = 64
	3817	call	func16
	3819	push	reg0	
	3821	push	reg1	
	3823	push	reg2	
	3825	reg0 = 28236
	3828	reg1 = 1531
	3831	reg2 = 4409 + 13115
	3835	call	func3
	3837	pop 	reg2	
	3839	pop 	reg1	
	3841	pop 	reg0	
	3843	reg0 = mem[3726]
	3846	reg1 = 25866
	3849	reg2 = 32767
	3852	reg3 = 28299
	3855	call	func17
	3857	push	reg0	
	3859	push	reg1	
	3861	push	reg2	
	3863	reg0 = 28303
	3866	reg1 = 1531
	3869	reg2 = 848 + 18064
	3873	call	func3
	3875	pop 	reg2	
	3877	pop 	reg1	
	3879	pop 	reg0	
	3881	mem[2732] = 2417
	3884	pop 	reg3	
	3886	pop 	reg2	
	3888	pop 	reg1	
	3890	pop 	reg0	
	3892	ret 	
	3893	push	reg0	
	3895	push	reg1	
	3897	reg0 = mem[2462]
	3900	reg1 = mem[27101]
	3903	reg0 = reg0 == reg1
	3907	jt	reg0	label96
	3910	push	reg0	
	3912	push	reg1	
	3914	push	reg2	
	3916	reg0 = 28347
	3919	reg1 = 1531
	3922	reg2 = 558 + 19258
	3926	call	func3
	3928	pop 	reg2	
	3930	pop 	reg1	
	3932	pop 	reg0	
	3934	mem[2732] = 2457
	3937	mem[2733] = 2457
label96:
	3940	pop 	reg1	
	3942	pop 	reg0	
	3944	ret 	
	3951	halt	
	3953	halt	
	3954	halt	
	3955	halt	
	3956	halt	
	3957	halt	
	3958	push	reg0	
	3960	push	reg1	
	3962	reg0 = 2
	3965	reg1 = 0
	3968	call	func18
	3970	pop 	reg1	
	3972	pop 	reg0	
	3974	ret 	
	3975	push	reg0	
	3977	push	reg1	
	3979	reg0 = 8
	3982	reg1 = 1
	3985	call	func19
	3987	pop 	reg1	
	3989	pop 	reg0	
	3991	ret 	
	3992	push	reg0	
	3994	push	reg1	
	3996	reg0 = 1
	3999	reg1 = 2
	4002	call	func18
	4004	pop 	reg1	
	4006	pop 	reg0	
	4008	ret 	
	4009	push	reg0	
	4011	push	reg1	
	4013	reg0 = 1
	4016	reg1 = 3
	4019	call	func19
	4021	call	func20
	4023	pop 	reg1	
	4025	pop 	reg0	
	4027	ret 	
	4028	push	reg0	
	4030	push	reg1	
	4032	reg0 = 4
	4035	reg1 = 4
	4038	call	func19
	4040	pop 	reg1	
	4042	pop 	reg0	
	4044	ret 	
	4045	push	reg0	
	4047	push	reg1	
	4049	reg0 = 2
	4052	reg1 = 5
	4055	call	func18
	4057	pop 	reg1	
	4059	pop 	reg0	
	4061	ret 	
	4062	push	reg0	
	4064	push	reg1	
	4066	reg0 = 11
	4069	reg1 = 6
	4072	call	func19
	4074	pop 	reg1	
	4076	pop 	reg0	
	4078	ret 	
	4079	push	reg0	
	4081	push	reg1	
	4083	reg0 = 2
	4086	reg1 = 7
	4089	call	func18
	4091	pop 	reg1	
	4093	pop 	reg0	
	4095	ret 	
	4096	push	reg0	
	4098	push	reg1	
	4100	reg0 = 0
	4103	reg1 = 8
	4106	call	func18
	4108	pop 	reg1	
	4110	pop 	reg0	
	4112	ret 	
	4113	push	reg0	
	4115	push	reg1	
	4117	reg0 = 4
	4120	reg1 = 9
	4123	call	func19
	4125	pop 	reg1	
	4127	pop 	reg0	
	4129	ret 	
	4130	push	reg0	
	4132	push	reg1	
	4134	reg0 = 1
	4137	reg1 = 10
	4140	call	func18
	4142	pop 	reg1	
	4144	pop 	reg0	
	4146	ret 	
	4147	push	reg0	
	4149	push	reg1	
	4151	reg0 = 18
	4154	reg1 = 11
	4157	call	func19
	4159	pop 	reg1	
	4161	pop 	reg0	
	4163	ret 	
	4164	call	func21
	4166	ret 	
	4167	push	reg0	
	4169	push	reg1	
	4171	reg0 = 1
	4174	reg1 = 12
	4177	call	func18
	4179	pop 	reg1	
	4181	pop 	reg0	
	4183	ret 	
	4184	push	reg0	
	4186	push	reg1	
	4188	reg0 = 9
	4191	reg1 = 13
	4194	call	func19
	4196	pop 	reg1	
	4198	pop 	reg0	
	4200	ret 	
	4201	push	reg0	
	4203	push	reg1	
	4205	reg0 = 2
	4208	reg1 = 14
	4211	call	func18
	4213	pop 	reg1	
	4215	pop 	reg0	
	4217	ret 	
func18:
	4218	push	reg0	
	4220	push	reg1	
	4222	push	reg2	
	4224	reg2 = 2716 + 2
	4228	reg2 = mem[reg2]
	4231	jt	reg2	label97
	4234	call	func22
	4236	mem[3951] = reg0
	4239	reg1 = reg0 + 3945
	4243	reg1 = mem[reg1]
	4246	reg0 = 26024
	4249	call	func2
	4251	reg0 = reg1
	4254	call	func2
	4256	reg0 = 26088
	4259	call	func2
	4261	reg0 = reg1
	4264	call	func2
	4266	out	".\n"
	4270	out	"\n"
label97:
	4272	pop 	reg2	
	4274	pop 	reg1	
	4276	pop 	reg0	
	4278	ret 	
func19:
	4279	push	reg0	
	4281	push	reg1	
	4283	push	reg2	
	4285	reg2 = 2716 + 2
	4289	reg2 = mem[reg2]
	4292	jt	reg2	label98
	4295	call	func22
	4297	push	reg0	
	4299	reg0 = mem[3951]
	4302	reg1 = reg0 + 3945
	4306	reg1 = mem[reg1]
	4309	reg0 = 26122
	4312	call	func2
	4314	reg0 = reg1
	4317	call	func2
	4319	reg0 = 26170
	4322	call	func2
	4324	pop 	reg0	
	4326	reg1 = reg0
	4329	reg0 = mem[3952]
	4332	reg2 = mem[3951]
	4335	reg2 = reg2 + 3948
	4339	reg2 = mem[reg2]
	4342	call	reg2
	4344	jt	reg1	label99
	4347	reg1 = mem[3952]
	4350	mem[3952] = reg0
	4353	gt  	reg2	reg0	reg1	
	4357	jf	reg2	label100
	4360	push	reg0	
	4362	reg0 = 26235
	4365	call	func2
	4367	pop 	reg0	
label100:
	4369	gt  	reg2	reg1	reg0	
	4373	jf	reg2	label101
	4376	push	reg0	
	4378	reg0 = 26267
	4381	call	func2
	4383	pop 	reg0	
label101:
	4385	out	"\n"
	4387	out	"\n"
	4389	jmp	label98
label99:
	4391	call	func23
	4393	reg0 = 26299
	4396	call	func2
label98:
	4398	pop 	reg2	
	4400	pop 	reg1	
	4402	pop 	reg0	
	4404	ret 	
func22:
	4405	push	reg0	
	4407	push	reg1	
	4409	push	reg2	
	4411	push	reg3	
	4413	push	reg4	
	4415	push	reg5	
	4417	reg5 = mem[3953]
	4420	gt  	reg3	reg5	29999	
	4424	jt	reg3	label102
	4427	reg5 = reg5 + 1
	4431	mem[3953] = reg5
label102:
	4434	reg3 = reg0
	4437	reg4 = reg1
	4440	reg0 = reg5 + 2
	4444	call	func24
	4446	reg1 = mem[3954]
	4449	reg0 = reg1 | reg0
	4453	reg1 = reg4
	4456	call	func25
	4458	mem[3954] = reg0
	4461	reg0 = 3955
	4464	reg1 = reg5 + 2
	4468	reg2 = reg4
	4471	call	func26
	4473	reg0 = 3956
	4476	reg1 = reg5 * reg5
	4480	reg2 = reg4 * reg4
	4484	call	func26
	4486	reg0 = 3957
	4489	reg1 = 13
	4492	reg2 = reg3 * 9
	4496	reg2 = reg2 * reg2
	4500	call	func26
	4502	pop 	reg5	
	4504	pop 	reg4	
	4506	pop 	reg3	
	4508	pop 	reg2	
	4510	pop 	reg1	
	4512	pop 	reg0	
	4514	ret 	
func26:
	4515	push	reg0	
	4517	reg0 = mem[reg0]
	4520	call	func25
	4522	reg1 = reg2
	4525	call	func4
	4527	pop 	reg1	
	4529	mem[reg1] = reg0
	4532	ret 	
func20:
	4533	push	reg0	
	4535	reg0 = 2716 + 2
	4539	reg0 = mem[reg0]
	4542	jt	reg0	label103
	4545	reg0 = 26321
	4548	call	func2
	4550	reg0 = mem[3952]
	4553	reg0 = reg0 == 30
	4557	jt	reg0	label104
	4560	reg0 = 26354
	4563	call	func2
label106:
	4565	reg0 = 26398
	4568	call	func2
	4570	call	func23
	4572	jmp	label103
label104:
	4574	reg0 = 26440
	4577	call	func2
	4579	reg0 = mem[3954]
	4582	reg0 = reg0 + 1
	4586	jt	reg0	label105
	4589	reg0 = 26484
	4592	call	func2
	4594	jmp	label106
label105:
	4596	reg0 = 26584
	4599	call	func2
	4601	reg0 = 2716 + 2
	4605	mem[reg0] = 32767
label103:
	4608	pop 	reg0	
	4610	ret 	
func21:
	4611	push	reg0	
	4613	reg0 = 2716 + 2
	4617	reg0 = mem[reg0]
	4620	jt	reg0	label107
	4623	reg0 = 26717
	4626	call	func2
	4628	reg0 = mem[2732]
	4631	reg0 = reg0 == 2623
	4635	jt	reg0	label108
	4638	reg0 = 26725
	4641	call	func2
	4643	jmp	label109
label108:
	4645	reg0 = 26731
	4648	call	func2
label109:
	4650	reg0 = 26737
	4653	call	func2
	4655	call	func23
label107:
	4657	pop 	reg0	
	4659	ret 	
func23:
	4660	push	reg0	
	4662	mem[3952] = 22
	4665	mem[3953] = 0
	4668	mem[3954] = 0
	4671	mem[3955] = 0
	4674	mem[3956] = 0
	4677	mem[3957] = 0
	4680	reg0 = 2716 + 2
	4684	mem[reg0] = 2623
	4687	pop 	reg0	
	4689	ret 	
	4690	push	reg0	
	4692	reg0 = 2716 + 2
	4696	reg0 = mem[reg0]
	4699	reg0 = reg0 == 32767
	4703	jt	reg0	label110
	4706	reg0 = 26824
	4709	call	func2
	4711	mem[2732] = 2578
	4714	mem[2733] = 2578
label110:
	4717	pop 	reg0	
	4719	ret 	
	4720	push	reg0	
	4722	push	reg1	
	4724	push	reg2	
	4726	push	reg3	
	4728	push	reg0	
	4730	push	reg1	
	4732	push	reg2	
	4734	reg0 = 28369
	4737	reg1 = 1531
	4740	reg2 = 409 + 7634
	4744	call	func3
	4746	pop 	reg2	
	4748	pop 	reg1	
	4750	pop 	reg0	
	4752	reg0 = 4242
	4755	reg1 = 25866
	4758	reg2 = 32767
	4761	reg3 = 28397
	4764	call	func17
	4766	push	reg0	
	4768	push	reg1	
	4770	push	reg2	
	4772	reg0 = 28401
	4775	reg1 = 1531
	4778	reg2 = 1696 + 21721
	4782	call	func3
	4784	pop 	reg2	
	4786	pop 	reg1	
	4788	pop 	reg0	
	4790	pop 	reg3	
	4792	pop 	reg2	
	4794	pop 	reg1	
	4796	pop 	reg0	
	4798	ret 	
	4799	push	reg0	
	4801	reg0 = 2672 + 2
	4805	reg0 = mem[reg0]
	4808	jt	reg0	label111
	4811	reg0 = 2684 + 2
	4815	mem[reg0] = 32767
	4818	reg0 = 2672 + 2
	4822	mem[reg0] = 32767
	4825	reg0 = 2676 + 2
	4829	mem[reg0] = 0
	4832	push	reg0	
	4834	push	reg1	
	4836	push	reg2	
	4838	reg0 = 28453
	4841	reg1 = 1531
	4844	reg2 = 9150 + 12707
	4848	call	func3
	4850	pop 	reg2	
	4852	pop 	reg1	
	4854	pop 	reg0	
	4856	jmp	label112
label111:
	4858	push	reg0	
	4860	push	reg1	
	4862	push	reg2	
	4864	reg0 = 28510
	4867	reg1 = 1531
	4870	reg2 = 2633 + 3380
	4874	call	func3
	4876	pop 	reg2	
	4878	pop 	reg1	
	4880	pop 	reg0	
label112:
	4882	pop 	reg0	
	4884	ret 	
	4885	push	reg0	
	4887	reg0 = 2676 + 2
	4891	mem[reg0] = 32767
	4894	reg0 = 2680 + 2
	4898	mem[reg0] = 0
	4901	push	reg0	
	4903	push	reg1	
	4905	push	reg2	
	4907	reg0 = 28569
	4910	reg1 = 1531
	4913	reg2 = 3003 + 6201
	4917	call	func3
	4919	pop 	reg2	
	4921	pop 	reg1	
	4923	pop 	reg0	
	4925	mem[2733] = 0
	4928	pop 	reg0	
	4930	ret 	
	4931	push	reg0	
	4933	reg0 = 2676 + 2
	4937	mem[reg0] = 0
	4940	reg0 = 2680 + 2
	4944	mem[reg0] = 32767
	4947	push	reg0	
	4949	push	reg1	
	4951	push	reg2	
	4953	reg0 = 28595
	4956	reg1 = 1531
	4959	reg2 = 14351 + 1495
	4963	call	func3
	4965	pop 	reg2	
	4967	pop 	reg1	
	4969	pop 	reg0	
	4971	mem[2733] = 0
	4974	pop 	reg0	
	4976	ret 	
func27:
	4977	push	reg2	
	4979	push	reg3	
	4981	reg2 = mem[2732]
	4984	reg2 = reg2 == 2457
	4988	jt	reg2	label113
	4991	push	reg0	
	4993	push	reg1	
	4995	push	reg2	
	4997	reg0 = 28621
	5000	reg1 = 1531
	5003	reg2 = 5146 + 1253
	5007	call	func3
	5009	pop 	reg2	
	5011	pop 	reg1	
	5013	pop 	reg0	
	5015	jmp	label114
label113:
	5017	reg2 = reg0 + 2
	5021	mem[reg2] = 32767
	5024	reg2 = mem[2462]
	5027	reg2 = reg2 + 27095
	5031	reg2 = reg2 + 1
	5035	reg2 = mem[reg2]
	5038	reg3 = 2457 + 1
	5042	reg3 = mem[reg3]
	5045	reg3 = reg3 + reg2
	5049	reg2 = reg1 + 48
	5053	mem[reg3] = reg2
	5056	reg2 = mem[2462]
	5059	reg2 = reg2 + 27101
	5063	reg2 = reg2 + 1
	5067	mem[reg2] = reg1
	5070	push	reg0	
	5072	push	reg0	
	5074	push	reg1	
	5076	push	reg2	
	5078	reg0 = 28664
	5081	reg1 = 1531
	5084	reg2 = 2790 + 27905
	5088	call	func3
	5090	pop 	reg2	
	5092	pop 	reg1	
	5094	pop 	reg0	
	5096	pop 	reg0	
	5098	push	reg0	
	5100	reg2 = reg0 + 0
	5104	reg0 = mem[reg2]
	5107	call	func2
	5109	pop 	reg0	
	5111	push	reg0	
	5113	push	reg0	
	5115	push	reg1	
	5117	push	reg2	
	5119	reg0 = 28679
	5122	reg1 = 1531
	5125	reg2 = 20555 + 2340
	5129	call	func3
	5131	pop 	reg2	
	5133	pop 	reg1	
	5135	pop 	reg0	
	5137	pop 	reg0	
	5139	reg2 = mem[2462]
	5142	reg2 = reg2 + 1
	5146	mem[2462] = reg2
	5149	reg3 = mem[27101]
	5152	reg3 = reg2 == reg3
	5156	jf	reg3	label114
	5159	reg0 = 0
	5162	reg1 = 27101 + 1
	5166	reg1 = mem[reg1]
	5169	reg0 = reg0 + reg1
	5173	reg1 = 27101 + 2
	5177	reg1 = mem[reg1]
	5180	reg2 = 27101 + 3
	5184	reg2 = mem[reg2]
	5187	reg2 = reg2 * reg2
	5191	reg1 = reg1 * reg2
	5195	reg0 = reg0 + reg1
	5199	reg1 = 27101 + 4
	5203	reg1 = mem[reg1]
	5206	reg2 = reg1 * reg1
	5210	reg2 = reg2 * reg1
	5214	reg0 = reg0 + reg2
	5218	reg1 = 27101 + 5
	5222	reg1 = mem[reg1]
	5225	reg1 = reg1 * 32767
	5229	reg0 = reg0 + reg1
	5233	reg1 = reg0 == 399
	5237	jt	reg1	label115
	5240	reg2 = 2688 + 2
	5244	mem[reg2] = 2457
	5247	reg2 = 2692 + 2
	5251	mem[reg2] = 2457
	5254	reg2 = 2696 + 2
	5258	mem[reg2] = 2457
	5261	reg2 = 2700 + 2
	5265	mem[reg2] = 2457
	5268	reg2 = 2704 + 2
	5272	mem[reg2] = 2457
	5275	mem[2462] = 0
	5278	reg0 = 27095
	5281	reg1 = 5341
	5284	call	func3
	5286	push	reg0	
	5288	push	reg1	
	5290	push	reg2	
	5292	reg0 = 28710
	5295	reg1 = 1531
	5298	reg2 = 20882 + 95
	5302	call	func3
	5304	pop 	reg2	
	5306	pop 	reg1	
	5308	pop 	reg0	
	5310	jmp	label114
label115:
	5312	push	reg0	
	5314	push	reg1	
	5316	push	reg2	
	5318	reg0 = 28777
	5321	reg1 = 1531
	5324	reg2 = 5705 + 15654
	5328	call	func3
	5330	pop 	reg2	
	5332	pop 	reg1	
	5334	pop 	reg0	
label114:
	5336	pop 	reg3	
	5338	pop 	reg2	
	5340	ret 	
	5341	push	reg2	
	5343	reg2 = 2457 + 1
	5347	reg2 = mem[reg2]
	5350	reg2 = reg2 + reg0
	5354	mem[reg2] = 95
	5357	pop 	reg2	
	5359	ret 	
	5360	push	reg0	
	5362	push	reg1	
	5364	reg0 = 2688
	5367	reg1 = 2
	5370	call	func27
	5372	pop 	reg1	
	5374	pop 	reg0	
	5376	ret 	
	5377	push	reg0	
	5379	push	reg1	
	5381	reg0 = 2692
	5384	reg1 = 3
	5387	call	func27
	5389	pop 	reg1	
	5391	pop 	reg0	
	5393	ret 	
	5394	push	reg0	
	5396	push	reg1	
	5398	reg0 = 2696
	5401	reg1 = 5
	5404	call	func27
	5406	pop 	reg1	
	5408	pop 	reg0	
	5410	ret 	
	5411	push	reg0	
	5413	push	reg1	
	5415	reg0 = 2700
	5418	reg1 = 7
	5421	call	func27
	5423	pop 	reg1	
	5425	pop 	reg0	
	5427	ret 	
	5428	push	reg0	
	5430	push	reg1	
	5432	reg0 = 2704
	5435	reg1 = 9
	5438	call	func27
	5440	pop 	reg1	
	5442	pop 	reg0	
	5444	ret 	
	5445	push	reg0	
	5447	push	reg1	
	5449	push	reg2	
	5451	jf	reg7	label116
	5454	push	reg0	
	5456	push	reg1	
	5458	push	reg2	
	5460	reg0 = 28844
	5463	reg1 = 1531
	5466	reg2 = 7822 + 354
	5470	call	func3
	5472	pop 	reg2	
	5474	pop 	reg1	
	5476	pop 	reg0	
	5478	noop	
	5479	noop	
	5480	noop	
	5481	noop	
	5482	noop	
	5483	reg0 = 4
	5486	reg1 = 1
	5489	call	func28
	5491	reg1 = reg0 == 6
	5495	jf	reg1	label117
	5498	push	reg0	
	5500	push	reg1	
	5502	push	reg2	
	5504	reg0 = 29014
	5507	reg1 = 1531
	5510	reg2 = 15559 + 545
	5514	call	func3
	5516	pop 	reg2	
	5518	pop 	reg1	
	5520	pop 	reg0	
	5522	reg0 = reg7
	5525	reg1 = 25866
	5528	reg2 = 32767
	5531	push	reg3	
	5533	reg3 = 29241
	5536	call	func17
	5538	pop 	reg3	
	5540	push	reg0	
	5542	push	reg1	
	5544	push	reg2	
	5546	reg0 = 29245
	5549	reg1 = 1531
	5552	reg2 = 22446 + 3764
	5556	call	func3
	5558	pop 	reg2	
	5560	pop 	reg1	
	5562	pop 	reg0	
	5564	mem[2732] = 2498
	5567	mem[2733] = 0
	5570	reg1 = 2708 + 2
	5574	mem[reg1] = 32767
	5577	jmp	label118
label117:
	5579	push	reg0	
	5581	push	reg1	
	5583	push	reg2	
	5585	reg0 = 29400
	5588	reg1 = 1531
	5591	reg2 = 15548 + 7591
	5595	call	func3
	5597	pop 	reg2	
	5599	pop 	reg1	
	5601	pop 	reg0	
	5603	jmp	label118
label116:
	5605	push	reg0	
	5607	push	reg1	
	5609	push	reg2	
	5611	reg0 = 29545
	5614	reg1 = 1531
	5617	reg2 = 5295 + 7097
	5621	call	func3
	5623	pop 	reg2	
	5625	pop 	reg1	
	5627	pop 	reg0	
	5629	reg0 = 0
	5632	reg2 = 1 + 27101
label119:
	5636	reg1 = mem[reg2]
	5639	reg0 = reg0 + reg1
	5643	reg0 = reg0 * 31660
	5647	call	func4
	5649	reg1 = mem[27101]
	5652	reg1 = reg1 + 27101
	5656	reg2 = reg2 + 1
	5660	gt  	reg1	reg2	reg1	
	5664	jf	reg1	label119
	5667	reg1 = 25866
	5670	reg2 = 32767
	5673	push	reg3	
	5675	reg3 = 29663
	5678	call	func17
	5680	pop 	reg3	
	5682	push	reg0	
	5684	push	reg1	
	5686	push	reg2	
	5688	reg0 = 29667
	5691	reg1 = 1531
	5694	reg2 = 9778 + 1728
	5698	call	func3
	5700	pop 	reg2	
	5702	pop 	reg1	
	5704	pop 	reg0	
	5706	mem[2732] = 2488
	5709	mem[2733] = 0
	5712	jmp	label118
label118:
	5714	pop 	reg2	
	5716	pop 	reg1	
	5718	pop 	reg0	
	5720	ret 	
	5721	push	reg0	
	5723	push	reg1	
	5725	push	reg2	
	5727	push	reg3	
	5729	push	reg0	
	5731	push	reg1	
	5733	push	reg2	
	5735	reg0 = 29757
	5738	reg1 = 1531
	5741	reg2 = 9926 + 9504
	5745	call	func3
	5747	pop 	reg2	
	5749	pop 	reg1	
	5751	pop 	reg0	
	5753	reg0 = mem[3955]
	5756	reg1 = mem[3956]
	5759	call	func4
	5761	reg1 = mem[3957]
	5764	call	func4
	5766	reg1 = 25919
	5769	reg2 = 4
	5772	push	reg3	
	5774	reg3 = 29942
	5777	call	func17
	5779	pop 	reg3	
	5781	push	reg0	
	5783	push	reg1	
	5785	push	reg2	
	5787	reg0 = 29946
	5790	reg1 = 1531
	5793	reg2 = 18512 + 3232
	5797	call	func3
	5799	pop 	reg2	
	5801	pop 	reg1	
	5803	pop 	reg0	
	5805	pop 	reg3	
	5807	pop 	reg2	
	5809	pop 	reg1	
	5811	pop 	reg0	
	5813	ret 	
func29:
	5814	out	"- "
	5818	call	func2
	5820	out	"\n"
	5822	ret 	
func13:
	5823	push	reg1	
	5825	push	reg2	
	5827	reg0 = 27381
	5830	reg1 = 5846
	5833	reg2 = 0
	5836	call	func3
	5838	reg0 = reg2
	5841	pop 	reg2	
	5843	pop 	reg1	
	5845	ret 	
	5846	push	reg3	
	5848	push	reg4	
	5850	reg3 = mem[2732]
	5853	reg4 = reg0 + 2
	5857	reg4 = mem[reg4]
	5860	reg3 = reg3 == reg4
	5864	jf	reg3	label120
	5867	reg2 = reg2 + 1
label120:
	5871	pop 	reg4	
	5873	pop 	reg3	
	5875	ret 	
func14:
	5876	push	reg0	
	5878	push	reg1	
	5880	reg0 = 27381
	5883	reg1 = 5893
	5886	call	func3
	5888	pop 	reg1	
	5890	pop 	reg0	
	5892	ret 	
	5893	push	reg3	
	5895	reg3 = reg0 + 2
	5899	reg3 = mem[reg3]
	5902	reg3 = reg2 == reg3
	5906	jf	reg3	label121
	5909	reg0 = reg0 + 0
	5913	reg0 = mem[reg0]
	5916	call	func29
label121:
	5918	pop 	reg3	
	5920	ret 	
func11:
	5921	push	reg1	
	5923	push	reg2	
	5925	reg2 = reg0
	5928	reg0 = 27381
	5931	reg1 = 5964
	5934	call	func5
	5936	reg1 = reg0 == 32767
	5940	jt	reg1	label122
	5943	reg1 = 27381 + reg0
	5947	reg1 = reg1 + 1
	5951	reg0 = mem[reg1]
	5954	jmp	label123
label122:
	5956	reg0 = 0
label123:
	5959	pop 	reg2	
	5961	pop 	reg1	
	5963	ret 	
	5964	push	reg1	
	5966	reg1 = reg2
	5969	reg0 = reg0 + 0
	5973	reg0 = mem[reg0]
	5976	call	func6
	5978	pop 	reg1	
	5980	jf	reg0	label124
	5983	reg2 = reg1
	5986	reg1 = 32767
label124:
	5989	ret 	
func12:
	5990	push	reg1	
	5992	push	reg2	
	5994	reg0 = reg0 + 2
	5998	reg0 = mem[reg0]
	6001	jf	reg0	label125
	6004	reg1 = mem[2732]
	6007	reg1 = reg0 == reg1
	6011	jt	reg1	label125
	6014	reg0 = 0
	6017	jmp	label126
label125:
	6019	reg0 = 1
label126:
	6022	pop 	reg2	
	6024	pop 	reg1	
	6026	ret 	
func28:
	6027	jt	reg0	label127
	6030	reg0 = reg1 + 1
	6034	ret 	
label127:
	6035	jt	reg1	label128
	6038	reg0 = reg0 + 32767
	6042	reg1 = reg7
	6045	call	func28
	6047	ret 	
label128:
	6048	push	reg0	
	6050	reg1 = reg1 + 32767
	6054	call	func28
	6056	reg1 = reg0
	6059	pop 	reg0	
	6061	reg0 = reg0 + 32767
	6065	call	func28
	6067	ret 	
	8175	in  	16435	
	10453	push	21392	
	10573	21237 = mem[10070]
	11893	24401 = 14955 | 6512
	20166	call	func30
	20298	mem[7897] = 16300
	20794	call	func31
	21607	gt  	11120	21024	31428	
	22195	12193 = mem[23244]
	26837	push	21442	
	28419	25197 = 19537 == 11899
	28843	jf	12909	label129
