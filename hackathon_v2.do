clear
cd "C:\Users\Vincent\Dropbox (Personal)\csp_vote"

use data\rp_secteur6
*replace code_insee = subinstr(code_insee, "A", "0", 1)
*replace code_insee = subinstr(code_insee, "B", "0", 1)
destring code_insee, replace

so code_insee
merge code_insee using hackathon_baseselec
ta _merge

*** Régressions par année

* 2012
reg participation_12t1 sh1_2011 sh2_2011 sh4_2011
reg blanc_nul_12t1 sh1_2011 sh2_2011 sh4_2011
reg ps_12t1 sh1_2011 sh2_2011 sh4_2011

* 2007

reg participation_07t1 sh1_2006 sh2_2006 sh4_2006
reg blanc_nul_07t1 sh1_2006 sh2_2006 sh4_2006
reg ps_07t1 sh1_2006 sh2_2006 sh4_2006

* 2002

reg participation_02t1 sh1_1999 sh2_1999 sh4_1999
reg blanc_nul_02t1 sh1_1999 sh2_1999 sh4_1999
reg ps_02t1 sh1_1999 sh2_1999 sh4_1999

* 1995

reg participation_95t1 sh1_1999 sh2_1999 sh4_1999
reg blanc_nul_95t1 sh1_1999 sh2_1999 sh4_1999
reg ps_95t1 sh1_1999 sh2_1999 sh4_1999

* 1988

reg participation_88t1 sh1_1990 sh2_1990 sh4_1990
reg blanc_nul_88t1 sh1_1990 sh2_1990 sh4_1990
reg ps_88t1 sh1_1990 sh2_1990 sh4_1990

* 1981

reg participation_81t1 sh1_1982 sh2_1982 sh4_1982
reg blanc_nul_81t1 sh1_1982 sh2_1982 sh4_1982
reg ps_81t1 sh1_1982 sh2_1982 sh4_1982

*** Régressions par outcome

* Effet sur score PS, toutes les communes

reg ps_12t1 sh2_2011 sh3_2011 sh4_2011
reg ps_07t1 sh2_2006 sh3_2006 sh4_2006
reg ps_02t1 sh2_1999 sh3_1999 sh4_1999
reg ps_95t1 sh2_1999 sh3_1999 sh4_1999

* Effet sur participation, toutes les communes

reg participation_12t1 sh2_2011 sh3_2011 sh4_2011
reg participation_07t1 sh2_2006 sh3_2006 sh4_2006
reg participation_02t1 sh2_1999 sh3_1999 sh4_1999
reg participation_95t1 sh2_1999 sh3_1999 sh4_1999

* Effet sur participation, toutes les communes

reg blanc_12t1 sh2_2011 sh3_2011 sh4_2011
reg blanc_07t1 sh2_2006 sh3_2006 sh4_2006
reg blanc_02t1 sh2_1999 sh3_1999 sh4_1999
reg blanc_95t1 sh2_1999 sh3_1999 sh4_1999

* Effet sur score PS, communes de plus de 9000 habitants

reg ps_12t1 sh2_2011 sh3_2011 sh4_2011 if participation_81t1 ~= .
reg ps_07t1 sh2_2006 sh3_2006 sh4_2006 if participation_81t1 ~= .
reg ps_02t1 sh2_1999 sh3_1999 sh4_1999 if participation_81t1 ~= .
reg ps_95t1 sh2_1999 sh3_1999 sh4_1999 if participation_81t1 ~= .
reg ps_88t1 sh2_1990 sh3_1990 sh4_1990 if participation_81t1 ~= .
reg ps_81t1 sh2_1982 sh3_1982 sh4_1982 if participation_81t1 ~= .

* Effet sur participation, communes de plus de 9000 habitants

reg participation_12t1 sh2_2011 sh3_2011 sh4_2011 if participation_81t1 ~= .
reg participation_07t1 sh2_2006 sh3_2006 sh4_2006 if participation_81t1 ~= .
reg participation_02t1 sh2_1999 sh3_1999 sh4_1999 if participation_81t1 ~= .
reg participation_95t1 sh2_1999 sh3_1999 sh4_1999 if participation_81t1 ~= .
reg participation_88t1 sh2_1990 sh3_1990 sh4_1990 if participation_81t1 ~= .
reg participation_81t1 sh2_1982 sh3_1982 sh4_1982 if participation_81t1 ~= .

* Effet sur participation, communes de plus de 9000 habitants

reg blanc_nul_12t1 sh2_2011 sh3_2011 sh4_2011 if participation_81t1 ~= .
reg blanc_nul_07t1 sh2_2006 sh3_2006 sh4_2006 if participation_81t1 ~= .
reg blanc_nul_02t1 sh2_1999 sh3_1999 sh4_1999 if participation_81t1 ~= .
reg blanc_nul_95t1 sh2_1999 sh3_1999 sh4_1999 if participation_81t1 ~= .
reg blanc_nul_88t1 sh2_1990 sh3_1990 sh4_1990 if participation_81t1 ~= .
reg blanc_nul_81t1 sh2_1982 sh3_1982 sh4_1982 if participation_81t1 ~= .

*** Evolution

* Entre 1995 et 2012

gen ps_evolution1 = ps_12t1 - ps_95t1
gen participation_evolution1 = participation_12t1 - participation_95t1
gen blanc_nul_evolution1 = blanc_nul_12t1 - blanc_nul_95t1
gen sh1_evolution1 = sh1_2011 - sh1_1999
gen sh2_evolution1 = sh2_2011 - sh2_1999
gen sh3_evolution1 = sh3_2011 - sh3_1999
gen sh4_evolution1 = sh4_2011 - sh4_1999
reg ps_evolution1 sh1_evolution1 
reg ps_evolution1 sh2_evolution1 
reg ps_evolution1 sh3_evolution1 
reg ps_evolution1 sh4_evolution1 
reg participation_evolution1 sh1_evolution1 
reg participation_evolution1 sh2_evolution1 
reg participation_evolution1 sh3_evolution1 
reg participation_evolution1 sh4_evolution1
reg blanc_nul_evolution1 sh1_evolution1 
reg blanc_nul_evolution1 sh2_evolution1 
reg blanc_nul_evolution1 sh3_evolution1 
reg blanc_nul_evolution1 sh4_evolution1
twoway (sc ps_evolution1 sh1_evolution1) (lfit ps_evolution1 sh1_evolution1) 
twoway (sc ps_evolution1 sh2_evolution1) (lfit ps_evolution1 sh2_evolution1) 
twoway (sc ps_evolution1 sh3_evolution1) (lfit ps_evolution1 sh3_evolution1) 
twoway (sc ps_evolution1 sh4_evolution1) (lfit ps_evolution1 sh4_evolution1)

* Entre 1981 et 2012

gen ps_evolution2 = ps_12t1 - ps_81t1
gen participation_evolution2 = participation_12t1 - participation_81t1
gen blanc_nul_evolution2 = blanc_nul_12t1 - blanc_nul_81t1
gen sh1_evolution2 = sh1_2011 - sh1_1982
gen sh2_evolution2 = sh2_2011 - sh2_1982
gen sh3_evolution2 = sh3_2011 - sh3_1982
gen sh4_evolution2 = sh4_2011 - sh4_1982
reg ps_evolution2 sh1_evolution2 
reg ps_evolution2 sh2_evolution2 
reg ps_evolution2 sh3_evolution2 
reg ps_evolution2 sh4_evolution2 
reg participation_evolution2 sh1_evolution2 
reg participation_evolution2 sh2_evolution2 
reg participation_evolution2 sh3_evolution2 
reg participation_evolution2 sh4_evolution2
reg blanc_nul_evolution2 sh1_evolution2 
reg blanc_nul_evolution2 sh2_evolution2 
reg blanc_nul_evolution2 sh3_evolution2 
reg blanc_nul_evolution2 sh4_evolution2
twoway (sc ps_evolution2 sh1_evolution2) (lfit ps_evolution2 sh1_evolution2) if sh1_evolution2 > -0.1 & sh1_evolution2 < 0.05
twoway (sc ps_evolution2 sh2_evolution2) (lfit ps_evolution2 sh2_evolution2) if sh2_evolution2 > -0.4 & sh2_evolution2 < 0.1
twoway (sc ps_evolution2 sh3_evolution2) (lfit ps_evolution2 sh3_evolution2) if sh3_evolution2 > -0.1 & sh3_evolution2 < 0.05
twoway (sc ps_evolution2 sh4_evolution2) (lfit ps_evolution2 sh4_evolution2) if sh4_evolution2 > 0 & sh4_evolution2 < 0.5
