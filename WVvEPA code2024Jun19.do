**#Table 1
use "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
winsor2   $control  GHGscope1_intensity ln_GHGscope1_intensity ,replace cuts(1 99)
asdoc     tabstat  $control GHGscope1_intensity ln_GHGscope1_intensity , stat(count mean p50 sd  p25 p75  ) dec(3)save (summary.doc) 
egen GHGscope1_intensityP50=pctile(GHGscope1_intensity) if !missing(GHGscope1_intensity),p(50)
gen highintens=(GHGscope1_intensity>=GHGscope1_intensityP50) if !missing(GHGscope1_intensity)
foreach v of varlist GHGscope1_intensity  market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize      {
ttest `v', by(highintens) unequal
}
 


**#Table 2
use "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   ,r
est store m1
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   ,r
est store m2
reg CAR_fm5_M10  ln_GHGscope1_intensity       $control   ,r
est store m3
reg CAR_fm5_M11  ln_GHGscope1_intensity       $control   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

**#Table 3
use "E:\West Virginia\stata\Placebo15Jun2022.dta"  ,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_GHGscope1_intensity      $control  ,r
est store m1
esttab m1   using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

use "E:\West Virginia\stata\Placebo31Mar2022.dta" ,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_GHGscope1_intensity      $control  ,r
est store m1
esttab m1   using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

use "E:\West Virginia\stata\Placebo30Jun2021.dta" ,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_GHGscope1_intensity      $control  ,r
est store m1
esttab m1   using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

use "E:\West Virginia\stata\Placebo29Apr2021.dta" ,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_GHGscope1_intensity      $control  ,r
est store m1
esttab m1   using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

**#Table 4
use "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  coef_mkt_intensity       $control   ,r
est store m1
reg CAR_fm5_M31  coef_mkt_intensity       $control   ,r
est store m2
reg CAR_fm5_M10  coef_mkt_intensity       $control   ,r
est store m3
reg CAR_fm5_M11  coef_mkt_intensity       $control   ,r
est store m4
esttab  m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

use "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  tran_risk_w_std       $control   ,r
est store m1
reg CAR_fm5_M31  tran_risk_w_std       $control   ,r
est store m2
reg CAR_fm5_M10  tran_risk_w_std       $control   ,r
est store m3
reg CAR_fm5_M11  tran_risk_w_std       $control   ,r
est store m4
esttab  m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

**#Table 5
use  "E:\West Virginia\stata\NotBasedOnTrucostSample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_penalty_num       $control   ,r
est store m1
reg CAR_fm5_M31  ln_penalty_num       $control   ,r
est store m2
reg CAR_fm5_M10  ln_penalty_num       $control   ,r
est store m3
reg CAR_fm5_M11  ln_penalty_num       $control   ,r
est store m4
esttab  m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

reg CAR_fm5_M30  ln_penalty_SUM        $control   ,r
est store m1
reg CAR_fm5_M31  ln_penalty_SUM        $control   ,r
est store m2
reg CAR_fm5_M10  ln_penalty_SUM        $control   ,r
est store m3
reg CAR_fm5_M11  ln_penalty_SUM        $control   ,r
est store m4
esttab  m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

**#Table 6
use "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
gen high3=(env_net_num>0)
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control  if high3==0 ,r
est store m1
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   if high3==1,r
est store m2
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control  if high3==0 ,r
est store m3
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   if high3==1 ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)
bdiff, group(high3) model(reg CAR_fm5_M30  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail
bdiff, group(high3) model(reg CAR_fm5_M31  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail

**#Table 7
use "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
egen p50=pctile(NUMEST) if !missing(NUMEST),p(50)
gen high_coverage=(NUMEST>=p50)  if !missing(NUMEST)
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control  if high_coverage==0 ,r
est store m1
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   if high_coverage==1,r
est store m2
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control  if high_coverage==0 ,r
est store m3
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   if high_coverage==1 ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)
bdiff, group(high_coverage) model(reg CAR_fm5_M30  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail
bdiff, group(high_coverage) model(reg CAR_fm5_M31  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail


**#Table 8
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
egen p50=pctile(pro_env1) if !missing(pro_env1),p(50)
gen highpro_env1=(pro_env1>=p50)  if !missing(pro_env1)
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control  if highpro_env1==0 ,r
est store m1
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   if highpro_env1==1,r
est store m2
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control  if highpro_env1==0 ,r
est store m3
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   if highpro_env1==1 ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)
bdiff, group(highpro_env1) model(reg CAR_fm5_M30  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail
bdiff, group(highpro_env1) model(reg CAR_fm5_M31  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail

**#Table 9
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
egen che_atP50=pctile(che_at) if !missing(che_at),p(50)
gen lo_che_at=(che_at<=che_atP50) if !missing(che_at)
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control  if lo_che_at==1 ,r
est store m1
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   if lo_che_at==0,r
est store m2
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control  if lo_che_at==1 ,r
est store m3
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   if lo_che_at==0 ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)
bdiff, group(lo_che_at) model(reg CAR_fm5_M30  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail
bdiff, group(lo_che_at) model(reg CAR_fm5_M31  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail


**#Table 10
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
gen Top_oil_producing=1  if inlist(state,"TX","NM","ND","AK","CO","OK","CA","WY","UT")
replace Top_oil_producing=1 if inlist(state,"LA")
replace Top_oil_producing=1 if inlist(state,"KS","MT","OH","WV","MS")
replace Top_oil_producing=1 if inlist(state,"IL","PA","MI")
replace Top_oil_producing=1 if inlist(state,"AL","AR")
replace Top_oil_producing=0 if !missing(state) & missing(Top_oil_producing)
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control  if Top_oil_producing==1 ,r
est store m1
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   if Top_oil_producing==0,r
est store m2
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control  if Top_oil_producing==1 ,r
est store m3
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   if Top_oil_producing==0 ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)
bdiff, group(Top_oil_producing) model(reg CAR_fm5_M30  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail
bdiff, group(Top_oil_producing) model(reg CAR_fm5_M31  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail


gen Top_coal_producing=1  if inlist(state,"WY","WV","PA","IL","KY","MT","IN","ND","TX")
replace Top_coal_producing=1 if inlist(state,"AL","CO","UT","VA","NM","OH","AZ","MI","LA")
replace Top_coal_producing=1 if inlist(state,"MD","AK")
replace Top_coal_producing=0 if !missing(state) & missing(Top_coal_producing)
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control  if Top_coal_producing==1 ,r
est store m1
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control   if Top_coal_producing==0,r
est store m2
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control  if Top_coal_producing==1 ,r
est store m3
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control   if Top_coal_producing==0 ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)
bdiff, group(Top_coal_producing) model(reg CAR_fm5_M30  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail
bdiff, group(Top_coal_producing) model(reg CAR_fm5_M31  ln_GHGscope1_intensity market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize,r  )  reps(500) seed(10101) first detail

**#Table 11
use "E:\West Virginia\stata\EPSchannel1Q.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize " 
reghdfe MEDEST c.postJun30##c.ln_GHGscope1_intensity  $control  , absorb(STATPERSmonth ) vce(cluster CUSIP6num) 
est store m1
reghdfe MEANEST c.postJun30##c.ln_GHGscope1_intensity  $control  , absorb(STATPERSmonth ) vce(cluster CUSIP6num) 
est store m2
esttab m1  m2     using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f) 


use "E:\West Virginia\stata\EPSchannel1Y.dta",clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize " 
reghdfe MEDEST c.postJun30##c.ln_GHGscope1_intensity  $control  , absorb(STATPERSmonth ) vce(cluster CUSIP6num) 
est store m1
reghdfe MEANEST c.postJun30##c.ln_GHGscope1_intensity  $control  , absorb(STATPERSmonth ) vce(cluster CUSIP6num) 
est store m2
esttab m1  m2     using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f) 

**#Tabel12
use "E:\West Virginia\stata\implied_cost_of_equityChannel.dta"
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize " 
reghdfe implied_cost_of_equity1 c.postJun30##c.ln_GHGscope1_intensity  $control  , absorb(STATPERSmonth  ) vce(cluster CUSIP6num) 
est store model1
reghdfe implied_cost_of_equity2 c.postJun30##c.ln_GHGscope1_intensity  $control  , absorb(STATPERSmonth ) vce(cluster CUSIP6num) 
est store model2
esttab model1  model2     using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f) 


**#Table IA.2
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  ln_GHGscope1_intensity       $control if Estimated!=1   ,r
est store m1
reg CAR_fm5_M31  ln_GHGscope1_intensity       $control if Estimated!=1   ,r
est store m2
reg CAR_fm5_M10  ln_GHGscope1_intensity       $control if Estimated!=1   ,r
est store m3
reg CAR_fm5_M11  ln_GHGscope1_intensity       $control if Estimated!=1   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)


**#Table IA.3
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M120  ln_GHGscope1_intensity       $control   ,r
est store m1
reg CAR_fm5_M140  ln_GHGscope1_intensity       $control   ,r
est store m2
esttab m1  m2     using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f) 

**#Table IA.4
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_mkm_M30  ln_GHGscope1_intensity       $control   ,r
est store m1
reg CAR_mkm_M31  ln_GHGscope1_intensity       $control   ,r
est store m2
reg CAR_fm3_M30  ln_GHGscope1_intensity       $control   ,r
est store m3
reg CAR_fm3_M31  ln_GHGscope1_intensity       $control   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

reg CAR_mkm_M30  coef_mkt_intensity       $control   ,r
est store m1
reg CAR_mkm_M31  coef_mkt_intensity       $control   ,r
est store m2
reg CAR_fm3_M30  coef_mkt_intensity       $control   ,r
est store m3
reg CAR_fm3_M31  coef_mkt_intensity       $control   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

reg CAR_mkm_M30  tran_risk_w_std       $control   ,r
est store m1
reg CAR_mkm_M31  tran_risk_w_std       $control   ,r
est store m2
reg CAR_fm3_M30  tran_risk_w_std       $control   ,r
est store m3
reg CAR_fm3_M31  tran_risk_w_std       $control   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

**#Table IA.5
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "

reg CAR_fm5_M30  coef_mkt_intensity_w       $control   ,r
est store m1
reg CAR_fm5_M31  coef_mkt_intensity_w       $control   ,r
est store m2
reg CAR_fm5_M10  coef_mkt_intensity_w       $control   ,r
est store m3
reg CAR_fm5_M11  coef_mkt_intensity_w       $control   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

reg CAR_mkm_M30  coef_mkt_intensity_w       $control   ,r
est store m1
reg CAR_mkm_M31  coef_mkt_intensity_w       $control   ,r
est store m2
reg CAR_fm3_M30  coef_mkt_intensity_w       $control   ,r
est store m3
reg CAR_fm3_M31  coef_mkt_intensity_w       $control   ,r
est store m4
esttab m1 m2 m3 m4  using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

**#Table IA.6
use  "E:\West Virginia\stata\CRSP_SSF_daily_21Jun22Jul_mainsample.dta"	,clear
global control " market_to_book ROA   che_at   tangibility capx_at    market_leverage    dividend_payout market_firmsize "
reg CAR_fm5_M30  CAA_covered       $control   ,r
est store m1
reg CAR_fm5_M31  CAA_covered       $control   ,r
est store m2
reg CAR_fm5_M30  TRI_covered       $control   ,r
est store m3
reg CAR_fm5_M31  TRI_covered       $control   ,r
est store m4
reg CAR_fm5_M30  IPCC_covered       $control   ,r
est store m5
reg CAR_fm5_M31  IPCC_covered       $control   ,r
est store m6
esttab m1 m2 m3 m4 m5 m6 using  temp.csv ,replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)




**#Kim & Kim (2023) Table 2 
use "E:\West Virginia\stata\CRSP_SSF_daily04Apr0207Apr30_fm3mkmKimKim_T2.dta",clear
global control " log_at market_to_book   market_leverage  tangibility  "
	destring sic ,gen (sicnum)
	ffind sicnum, generate("FF48") type(48)
reg CRET_100M13         high_delta_toxic2006  $control i.FF48, cluster(FF48)
est store model1
reg CAR_mkm_M13         high_delta_toxic2006  $control i.FF48, cluster(FF48)
est store model2
reg CAR_fm3_M13         high_delta_toxic2006  $control i.FF48, cluster(FF48)
est store model3
reg CRET_100M15         high_delta_toxic2006  $control i.FF48, cluster(FF48)
est store model4
reg CAR_mkm_M15         high_delta_toxic2006  $control i.FF48, cluster(FF48)
est store model5
reg CAR_fm3_M15         high_delta_toxic2006  $control i.FF48, cluster(FF48)
est store model6
esttab model1  model2    model3 model4  model5 model6  using  temp.csv , replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)


**#Kim & Kim (2023) Table 3
use "E:\West Virginia\stata\CRSP_SSF_daily14Jun2715Jul28_fm3mkmKimKim_T3.dta",clear
global control " log_at market_to_book   market_leverage  tangibility  "
	destring sic ,gen (sicnum)
	ffind sicnum, generate("FF48") type(48)
reg CRET_100M13          high_delta_toxic2014  $control i.FF48, cluster(FF48)
est store model1
reg CAR_mkm_M13          high_delta_toxic2014  $control i.FF48, cluster(FF48)
est store model2
reg CAR_fm3_M13         high_delta_toxic2014  $control i.FF48, cluster(FF48)
est store model3
reg CRET_100M15          high_delta_toxic2014  $control i.FF48, cluster(FF48)
est store model4
reg CAR_mkm_M15         high_delta_toxic2014  $control i.FF48, cluster(FF48)
est store model5
reg CAR_fm3_M15        high_delta_toxic2014  $control i.FF48, cluster(FF48)
est store model6
esttab model1  model2    model3 model4  model5 model6  using  temp.csv , replace scalar(F N) compress nogap star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) t(%6.3f) ar2(%6.4f)

