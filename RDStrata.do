ssc install estout, replace

cd "C:\Users\Usuario\Documents\MEMOIRE\Data\icfes\Resultados"


capture noisily mkdir "RegresionesStata2"



 foreach base in 2011 2015 2019{
 import delimited C:\Users\Usuario\Documents\MEMOIRE\Data\icfes\Estimar\Data_`base'.csv
 label variable distance1 "Distance to Str.1(m.)"
 label variable distance2 "Distance to Str.2(m.)"
 label variable distance3 "Distance to Str.3(m.)"
 label variable distance4 "Distance to Str.4(m.)"
 label variable distance5 "Distance to Str.5(m.)"
 label variable distance6 "Distance to Str.6(m.)"

 
tabulate upz,gen(u)

// BLOQUE A
   global covariates "dedupadre dedumadre drural dpublico djornada u1 u2	u3	u4	u5	u6	u7	u8	u9	u10	u11	u12	u13	u14	u15	u16	u17	u18	u19	u20	u21	u22	u23	u24	u25	u26	u27	u28	u29	u30	u31	u32	u33	u34	u35	u36	u37	u38	u39	u40	u41	u42	u43	u44	u45	u46	u47	u48	u49	u50	u51	u52	u53	u54	u55	u56	u57	u58	u59	u60	u61	u62	u63	u64	u65	u66	u67	u68	u69	u70	u71	u72	u73	u74	u75	u76	u77	u78	u79	u80	u81	u82	u83	u84	u85	u86	u87	u88	u89	u90	u91	u92	u93	u94	u95	u96	u97	u98	u99	u100	u101	u102	u103	u104	u105	u106	u107" 
 //  global covariates "dedupadre dedumadre drural dpublico djornada dedupadre dedumadre drural dpublico djornada destuestrato1 destuestrato2 destuestrato3 destuestrato4 destuestrato5 destuestrato6u1	u2	u3	u4	u5	u6	u7	u8	u9	u10	u11	u12	u13	u14	u15	u16	u17	u18	u19	u20	u21	u22	u23	u24	u25	u26	u27	u28	u29	u30	u31	u32	u33	u34	u35	u36	u37	u38	u39	u40	u41	u42	u43	u44	u45	u46	u47	u48	u49	u50	u51	u52	u53	u54	u55	u56	u57	u58	u59	u60	u61	u62	u63	u64	u65	u66	u67	u68	u69	u70	u71	u72	u73	u74	u75	u76	u77	u78	u79	u80	u81	u82	u83	u84	u85	u86	u87	u88	u89	u90	u91	u92	u93	u94	u95	u96	u97	u98	u99	u100	u101	u102	u103	u104	u105	u106	u107" 
   //UPZ	u108 Zona Norte left as reference and Sin Estrato as reference
   

 //distance1 distance2 distance3 distance4 distance5 distance6
	foreach Y of varlist aggregwithing{
				rdrobust `Y' distance2 if fami_estratovivienda== "Estrato 3", covs($covariates) c(1700) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) 
				estimates store m1`Y', title(500m)
				rdrobust `Y' distance2 if fami_estratovivienda== "Estrato 3", covs($covariates) c(1800) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) 
				estimates store m2`Y', title(1000m)
				rdrobust `Y' distance2 if fami_estratovivienda== "Estrato 3", covs($covariates) c(1900) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) 
				estimates store m3`Y', title(1500m)
				rdrobust `Y' distance2 if fami_estratovivienda== "Estrato 3", covs($covariates) c(2000) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) 
				estimates store m4`Y', title(2000m)			
							
	estout m1`Y' m2`Y' m3`Y' m4`Y' using 2011`Y'bloqueA.txt ,style(tex)cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons constant)stats(N_l N_r N_h_l N_h_r c p q h_l h_r b_l b_r N kernel bwselect vce_select covs, fmt(3 0 1) label( "Left Obs." "Right Obs."  "Eff. Left Obs." "Eff. Right Obs." Cutoff "Order est.(p)" "Order of bias (q)" "BW Left est. (h)" "BW Right est. (h)" "Bw Left bias(b)" "BW Right bias(b)" Obs. Kernel "BW type" "VCE method" )) title( Efect Distance to 2 over Strata 3)			
  			}
	
 
// BLOQUE B
   global covariates "dedupadre dedumadre drural dpublico djornada dedupadre dedumadre drural dpublico djornada destuestrato2 destuestrato3 destuestrato4 destuestrato5 destuestrato6 u1 u2	u3	u4	u5	u6	u7	u8	u9	u10	u11	u12	u13	u14	u15	u16	u17	u18	u19	u20	u21	u22	u23	u24	u25	u26	u27	u28	u29	u30	u31	u32	u33	u34	u35	u36	u37	u38	u39	u40	u41	u42	u43	u44	u45	u46	u47	u48	u49	u50	u51	u52	u53	u54	u55	u56	u57	u58	u59	u60	u61	u62	u63	u64	u65	u66	u67	u68	u69	u70	u71	u72	u73	u74	u75	u76	u77	u78	u79	u80	u81	u82	u83	u84	u85	u86	u87	u88	u89	u90	u91	u92	u93	u94	u95	u96	u97	u98	u99	u100	u101	u102	u103	u104	u105	u106	u107" 
 //  global covariates "dedupadre dedumadre drural dpublico djornada dedupadre dedumadre drural dpublico djornada destuestrato1 destuestrato2 destuestrato3 destuestrato4 destuestrato5 destuestrato6u1	u2	u3	u4	u5	u6	u7	u8	u9	u10	u11	u12	u13	u14	u15	u16	u17	u18	u19	u20	u21	u22	u23	u24	u25	u26	u27	u28	u29	u30	u31	u32	u33	u34	u35	u36	u37	u38	u39	u40	u41	u42	u43	u44	u45	u46	u47	u48	u49	u50	u51	u52	u53	u54	u55	u56	u57	u58	u59	u60	u61	u62	u63	u64	u65	u66	u67	u68	u69	u70	u71	u72	u73	u74	u75	u76	u77	u78	u79	u80	u81	u82	u83	u84	u85	u86	u87	u88	u89	u90	u91	u92	u93	u94	u95	u96	u97	u98	u99	u100	u101	u102	u103	u104	u105	u106	u107" 
   //UPZ	u108 Zona Norte left as reference and Sin Estrato as reference
   
 foreach X of varlist distance3 {
 //distance1 distance2 distance3 distance4 distance5 distance6
	foreach Y of varlist pondwithing aggregwithing { //pondnoing pondwithing{
				rdrobust `Y' `X' [if fami_estratovivienda== "Estrato 3"], covs($covariates) c(500) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) 
				estimates store m1, title(Model 500estrato1total)
				//rdrobust `Y' `X', covs($covariates) c(1000) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) if fami_estratovivienda== "Estrato 1"
				//estimates store m1, title(Model 1000estrato1total)
				//rdrobust `Y' `X', covs($covariates) c(1500) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) if fami_estratovivienda== "Estrato 1"
				//estimates store m1, title(Model 1500estrato1tota)
				//rdrobust `Y' `X', covs($covariates) c(2000) kernel(triangular) p(2) bwselect(mserd) scaleregul(1) if fami_estratovivienda== "Estrato 1"
				//stimates store m1, title(Model 1500estrato1total)
	estout m1`Y' m2`Y' m3`Y' m4`Y' using 2011`Y'bloqueA.txt ,style(tex)cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons constant)stats(N_l N_r N_h_l N_h_r c p q h_l h_r b_l b_r N kernel bwselect vce_select, fmt(3 0 1) label( "Left Obs." "Right Obs."  "Eff. Left Obs." "Eff. Right Obs." Cutoff "Order est.(p)" "Order of bias (q)" "BW Left est. (h)" "BW Right est. (h)" "Bw Left bias(b)" "BW Right bias(b)" Obs. Kernel "BW type" "VCE method" )) title( Efect Distance to 2 over Strata 3)			

				}
		}
 
 
 
 
 
 
 
 
 
 
//by Stata
 
 
 
   global covariates "dedupadre dedumadre drural dpublico djornada u1	u2	u3	u4	u5	u6	u7	u8	u9	u10	u11	u12	u13	u14	u15	u16	u17	u18	u19	u20	u21	u22	u23	u24	u25	u26	u27	u28	u29	u30	u31	u32	u33	u34	u35	u36	u37	u38	u39	u40	u41	u42	u43	u44	u45	u46	u47	u48	u49	u50	u51	u52	u53	u54	u55	u56	u57	u58	u59	u60	u61	u62	u63	u64	u65	u66	u67	u68	u69	u70	u71	u72	u73	u74	u75	u76	u77	u78	u79	u80	u81	u82	u83	u84	u85	u86	u87	u88	u89	u90	u91	u92	u93	u94	u95	u96	u97	u98	u99	u100	u101	u102	u103	u104	u105	u106	u107" 
   //UPZ	u108 Zona Norte left as reference
foreach X of varlist distance1  {
	foreach Y of  varlist aggregnoing aggregwithing {
				rdrobust `Y' `X', covs($covariates) c(500) kernel(triangular) p(2) bwselect(mserd)
				//rdrobust `Y' `X', covs($covariates) c(1000) kernel(triangular) p(1) bwselect(mserd)
				//rdrobust `Y' `X', covs($covariates) c(1500) kernel(triangular) p(1) bwselect(mserd)
				//rdrobust `Y' `X', covs($covariates) c(2000) kernel(triangular) p(1) bwselect(mserd)
			}
		}
		
		
		
		
		
	} 
 
 
 ///how many studentsstudies in the same strata they life in
clear all
import delimited C:\Users\Usuario\Documents\MEMOIRE\Data\icfes\Estimar\Data_2011.csv
tabulate  fami_estratovivienda estrato, row 
