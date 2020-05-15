*$
* OPA134
*****************************************************************************
* (C) Copyright 2019 Texas Instruments Incorporated. All rights reserved.                                            
*****************************************************************************
** This model is designed as an aid for customers of Texas Instruments.
** TI and its licensors and suppliers make no warranties, either expressed
** or implied, with respect to this model, including the warranties of 
** merchantability or fitness for a particular purpose.  The model is
** provided solely on an "as is" basis.  The entire risk as to its quality
** and performance is with the customer
*****************************************************************************
*
* This model is subject to change without notice. Texas Instruments
* Incorporated is not responsible for updating this model.
*
*****************************************************************************
*
** Released by: Online Design Tools, Texas Instruments Inc.
* Part: OPA134
* Date: 29JAN2019
* Model Type: Generic (suitable for all analysis types)
* EVM Order Number: N/A 
* EVM Users Guide:  N/A 
* Datasheet: SBOS058A –DECEMBER 1997–REVISED OCTOBER 2015
* Created with Green-Williams-Lis Op Amp Macro-model Architecture
*
* Model Version: Final 1.2
*
*****************************************************************************
*
* Updates:
*
* Final 1.2
* Added Vos drift , updated claw , simplified FEMT subcircuit..
*
* Final 1.1
* Release to Web.
*
*****************************************************************************
* Model Usage Notes:
* 1. The following parameters are modeled: 
* 		OPEN-LOOP GAIN AND PHASE VS. FREQUENCY  WITH RL, CL EFFECTS (Aol)
* 		UNITY GAIN BANDWIDTH (GBW)
* 		INPUT COMMON-MODE REJECTION RATIO VS. FREQUENCY (CMRR)
* 		POWER SUPPLY REJECTION RATIO VS. FREQUENCY (PSRR)
* 		DIFFERENTIAL INPUT IMPEDANCE (Zid)
* 		COMMON-MODE INPUT IMPEDANCE (Zic)
* 		OPEN-LOOP OUTPUT IMPEDANCE VS. FREQUENCY (Zo)
* 		OUTPUT CURRENT THROUGH THE SUPPLY (Iout)
* 		INPUT VOLTAGE NOISE DENSITY VS. FREQUENCY (en)
* 		INPUT CURRENT NOISE DENSITY VS. FREQUENCY (in)
* 		OUTPUT VOLTAGE SWING vs. OUTPUT CURRENT (Vo)
* 		SHORT-CIRCUIT OUTPUT CURRENT (Isc)
* 		QUIESCENT CURRENT (Iq)
* 		SETTLING TIME VS. CAPACITIVE LOAD (ts)
* 		SLEW RATE (SR)
* 		SMALL SIGNAL OVERSHOOT VS. CAPACITIVE LOAD
* 		LARGE SIGNAL RESPONSE
* 		OVERLOAD RECOVERY TIME (tor)
* 		INPUT BIAS CURRENT (Ib)
* 		INPUT OFFSET CURRENT (Ios)
* 		INPUT OFFSET VOLTAGE (Vos)
*       INPUT OFFSET VOLTAGE VS. TEMPERATURE (Vos Drift)
* 		INPUT COMMON-MODE VOLTAGE RANGE (Vcm)
* 		INPUT OFFSET VOLTAGE VS. INPUT COMMON-MODE VOLTAGE (Vos vs. Vcm)
* 		INPUT/OUTPUT ESD CELLS (ESDin, ESDout)
***************************************************************************** 
.subckt OPA134 IN+ IN- VCC VEE OUT
******************************************************
.model R_NOISELESS RES (TCE=0 T_ABS=-273.15)
******************************************************
I_OS        ESDn MID 3e-12
I_B         30 MID 5e-12
V_GRp       45 MID 59
V_GRn       46 MID -60
V_ISCp      39 MID 43.885
V_ISCn      40 MID -47.5691
V_ORn       38 VCLP -9.9462
V11         44 37 0
V_ORp       36 VCLP 9.6832
V12         43 35 0
V4          27 OUT 0
VCM_MIN     67 VEE_B 2.5
VCM_MAX     68 VCC_B -2.5
I_Q         VCC VEE 0.004
XV_OS        75 30 VOS_DRIFT_OPA134
XU5         ESDp ESDn VCC VEE ESD_0_OPA134
XU4         19 ESDp MID PSRR_CMRR_0_OPA134
XU3         20 VEE_B MID PSRR_CMRR_1_OPA134
XU2         21 VCC_B MID PSRR_CMRR_2_OPA134
XU1         23 22 CLAMP VSENSE CLAW_CLAMP CL_CLAMP 24 26 27 MID AOL_ZO_0_OPA134
C28         31 MID 1P  
R77         32 31 R_NOISELESS 100 
C27         33 MID 1P  
R76         34 33 R_NOISELESS 100 
R75         MID 35 R_NOISELESS 1 
GVCCS8      35 MID 36 MID  -1
R74         37 MID R_NOISELESS 1 
GVCCS7      37 MID 38 MID  -1
Xi_nn       ESDn MID FEMT_0_OPA134
Xi_np       MID 30 FEMT_0_OPA134
Xe_n        ESDp 30 VNSE_0_OPA134
XIQPos      VIMON MID MID VCC VCCS_LIMIT_IQ_0_OPA134
XIQNeg      MID VIMON VEE MID VCCS_LIMIT_IQ_0_OPA134
C_DIFF      ESDp ESDn 2e-12  
XCL_AMP     39 40 VIMON MID 41 42 CLAMP_AMP_LO_0_OPA134
SOR_SWp     CLAMP 43 CLAMP 43  S_VSWITCH_1
SOR_SWn     44 CLAMP 44 CLAMP  S_VSWITCH_1
XGR_AMP     45 46 47 MID 48 49 CLAMP_AMP_HI_0_OPA134
R39         45 MID R_NOISELESS 1T 
R37         46 MID R_NOISELESS 1T 
R42         VSENSE 47 R_NOISELESS 1M 
C19         47 MID 1F  
R38         48 MID R_NOISELESS 1 
R36         MID 49 R_NOISELESS 1 
R40         48 50 R_NOISELESS 1M 
R41         49 51 R_NOISELESS 1M 
C17         50 MID 1F  
C18         MID 51 1F  
XGR_SRC     50 51 CLAMP MID VCCS_LIM_GR_0_OPA134
R21         41 MID R_NOISELESS 1 
R20         MID 42 R_NOISELESS 1 
R29         41 52 R_NOISELESS 1M 
R30         42 53 R_NOISELESS 1M 
C9          52 MID 1F  
C8          MID 53 1F  
XCL_SRC     52 53 CL_CLAMP MID VCCS_LIM_4_0_OPA134
R22         39 MID R_NOISELESS 1T 
R19         MID 40 R_NOISELESS 1T 
XCLAWp      VIMON MID 54 VCC_B VCCS_LIM_CLAW+_0_OPA134
XCLAWn      MID VIMON VEE_B 55 VCCS_LIM_CLAW-_0_OPA134
R12         54 VCC_B R_NOISELESS 1K 
R16         54 56 R_NOISELESS 1M 
R13         VEE_B 55 R_NOISELESS 1K 
R17         57 55 R_NOISELESS 1M 
C6          57 MID 1F  
C5          MID 56 1F  
G2          VCC_CLP MID 56 MID  -1M
R15         VCC_CLP MID R_NOISELESS 1K 
G3          VEE_CLP MID 57 MID  -1M
R14         MID VEE_CLP R_NOISELESS 1K 
XCLAW_AMP   VCC_CLP VEE_CLP VOUT_S MID 58 59 CLAMP_AMP_LO_0_OPA134
R26         VCC_CLP MID R_NOISELESS 1T 
R23         VEE_CLP MID R_NOISELESS 1T 
R25         58 MID R_NOISELESS 1 
R24         MID 59 R_NOISELESS 1 
R27         58 60 R_NOISELESS 1M 
R28         59 61 R_NOISELESS 1M 
C11         60 MID 1F  
C10         MID 61 1F  
XCLAW_SRC   60 61 CLAW_CLAMP MID VCCS_LIM_3_0_OPA134
H2          34 MID V11 -1
H3          32 MID V12 1
C12         SW_OL MID 100P  
R32         62 SW_OL R_NOISELESS 100 
R31         62 MID R_NOISELESS 1 
XOL_SENSE   MID 62 33 31 OL_SENSE_0_OPA134
S1          24 26 SW_OL MID  S_VSWITCH_3
H1          63 MID V4 1K
S7          VEE OUT VEE OUT  S_VSWITCH_4
S6          OUT VCC OUT VCC  S_VSWITCH_4
R11         MID 64 R_NOISELESS 1T 
R18         64 VOUT_S R_NOISELESS 100 
C7          VOUT_S MID 1N  
E5          64 MID OUT MID  1
C13         VIMON MID 1N  
R33         63 VIMON R_NOISELESS 100 
R10         MID 63 R_NOISELESS 1T 
R47         65 VCLP R_NOISELESS 100 
C24         VCLP MID 100P  
E4          65 MID CL_CLAMP MID  1
C4          23 MID 1F  
R9          23 66 R_NOISELESS 1M 
R7          MID 67 R_NOISELESS 1T 
R6          68 MID R_NOISELESS 1T 
R8          MID 66 R_NOISELESS 1 
XVCM_CLAMP  69 MID 66 MID 68 67 VCCS_EXT_LIM_0_OPA134
E1          MID 0 70 0  1
R89         VEE_B 0 R_NOISELESS 1 
R5          71 VEE_B R_NOISELESS 1M 
C3          71 0 1F  
R60         70 71 R_NOISELESS 1MEG 
C1          70 0 1  
R3          70 0 R_NOISELESS 1T 
R59         72 70 R_NOISELESS 1MEG 
C2          72 0 1F  
R4          VCC_B 72 R_NOISELESS 1M 
R88         VCC_B 0 R_NOISELESS 1 
G17         VEE_B 0 VEE 0  -1
G16         VCC_B 0 VCC 0  -1
R_PSR       73 69 R_NOISELESS 1K 
G_PSR       69 73 21 20  -1M
R2          22 ESDn R_NOISELESS 1M 
R1          73 74 R_NOISELESS 1M 
R_CMR       75 74 R_NOISELESS 1K 
G_CMR       74 75 19 MID  -1M
C_CMn       ESDn MID 5e-12  
C_CMp       MID ESDp 5e-12  
R53         ESDn MID R_NOISELESS 1T 
R52         MID ESDp R_NOISELESS 1T 
R35         IN- ESDn R_NOISELESS 10M 
R34         IN+ ESDp R_NOISELESS 10M 
.MODEL S_VSWITCH_1 VSWITCH (RON=10e-3 ROFF=1e9 VON=10e-3 VOFF=0)
.MODEL S_VSWITCH_3 VSWITCH (RON=1e-3 ROFF=1e9 VON=900e-3 VOFF=800e-3)
.MODEL S_VSWITCH_4 VSWITCH (RON=50 ROFF=1e12 VON=500e-3 VOFF=450e-3)
.ENDS OPA134
*
.SUBCKT ESD_0_OPA134 ESDp ESDn VCC VEE
S2          ESDn VCC ESDn VCC  S_VSWITCH_1
S4          VEE ESDn VEE ESDn  S_VSWITCH_1
S3          ESDp VCC ESDp VCC  S_VSWITCH_1
S5          VEE ESDp VEE ESDp  S_VSWITCH_1
.MODEL S_VSWITCH_1 VSWITCH (RON=50 ROFF=1e12 VON=500e-3 VOFF=450e-3)
.ENDS
*
.subckt VOS_DRIFT_OPA134 VOS+ VOS-
.param DC = 0.00036915
.param POL = 1
.param DRIFT = 2E-06
E1 VOS+ VOS- VALUE={DC+POL*DRIFT*(TEMP-27)}
.ends
*
.SUBCKT PSRR_CMRR_0_OPA134 psrr_in psrr_vccb psrr_mid 
.model R_NOISELESS RES ( TCE=0 T_ABS=-273.15)
R80         psrr_mid psrr_in R_NOISELESS 5555.8642
C27         psrr_in 4 3.1831e-12 
R79         4 psrr_in R_NOISELESS 100MEG 
GVCCS8      4 psrr_mid psrr_vccb psrr_mid  -0.18504
R78         psrr_mid 4 R_NOISELESS 1 
.ENDS
*
.SUBCKT PSRR_CMRR_1_OPA134 psrr_in psrr_vccb mid 
.model R_NOISELESS RES ( TCE=0 T_ABS=-273.15)
R74         mid psrr_in R_NOISELESS 1 
G_2         psrr_in mid 4 mid  -1.3
R2b         mid 4 R_NOISELESS 333333333.3333 
C2a         4 5 1.5915e-14 
R73         5 4 R_NOISELESS 100MEG 
R49         mid 5 R_NOISELESS 1 
GVCCS7      5 mid 6 mid  -1
R2a         mid 6 R_NOISELESS 4000.16 
C1a         6 7 1.5915e-12 
R48         7 6 R_NOISELESS 100MEG 
G_1         7 mid psrr_vccb mid  -0.076075
Rsrc        mid 7 R_NOISELESS 1 
.ENDS
*
.SUBCKT PSRR_CMRR_2_OPA134 psrr_in psrr_vccb mid 
.model R_NOISELESS RES ( TCE=0 T_ABS=-273.15)
R74         mid psrr_in R_NOISELESS 1 
G_2         psrr_in mid 4 mid  -1.4
R2b         mid 4 R_NOISELESS 250000000 
C2a         4 5 1.5915e-13 
R73         5 4 R_NOISELESS 100MEG 
R49         mid 5 R_NOISELESS 1 
GVCCS7      5 mid 6 mid  -1
R2a         mid 6 R_NOISELESS 833.3403 
C1a         6 7 3.1831e-11 
R48         7 6 R_NOISELESS 100MEG 
G_1         7 mid psrr_vccb mid  -0.68168
Rsrc        mid 7 R_NOISELESS 1 
.ENDS
*
.SUBCKT VCCS_LIM_2_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 0.019072
.PARAM IPOS = 0.61843
.PARAM INEG = -0.61843
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VC+,VC-),INEG,IPOS)}
.ENDS
*
.SUBCKT VCCS_LIM_1_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 1E-4
.PARAM IPOS = .5
.PARAM INEG = -.5
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VC+,VC-),INEG,IPOS)}
.ENDS
*
.SUBCKT AOL_ZO_0_OPA134 AOL_INP AOL_INN CLAMP VSENSE CLAW_CLAMP CL_CLAMP ZO_CLEFT ZO_CRIGHT ZO_OUT MID
.MODEL R_NOISELESS RES ( TCE=0 T_ABS=-273.15)
C1_A0          CLAMP MID 3.0217e-08
R4_A0          MID CLAMP R_NOISELESS 1MEG 
XVCCS_LIM_2_A0 4_A0 MID MID CLAMP VCCS_LIM_2_0_OPA134
R3_A0          MID 4_A0 R_NOISELESS 1MEG 
XVCCS_LIM_1_A0 AOL_INP AOL_INN MID 4_A0 VCCS_LIM_1_0_OPA134
R4_VS         VSENSE MID R_NOISELESS 1K 
GVCCS4_VS     VSENSE MID CLAMP MID  -1M
C2_A2          out2 MID 1.4672e-14 
R3_A2          out2 MID R_NOISELESS 1MEG 
GVCCS3_A2      out2 MID VSENSE MID  -1U
R4_CC         CLAW_CLAMP MID R_NOISELESS 1K 
GVCCS4_CC     CLAW_CLAMP MID out2 MID  -1M
R4_CL         CL_CLAMP MID R_NOISELESS 1K 
GVCCS4_CL     CL_CLAMP MID CLAW_CLAMP MID  -1M
G_Aol_Zo    Zo_Cleft MID CL_CLAMP ZO_OUT  -89.0505
GVCCS1_1      outz1 MID Zo_Cright MID  -4.0229
C1_1          Zo_Cleft Zo_Cright 1.0801e-06 
R2_1          Zo_Cright MID R_NOISELESS 3308.1158 
R1_1          Zo_Cright Zo_Cleft R_NOISELESS 10K 
Rdc_1         Zo_Cleft MID R_NOISELESS 1 
GVCCS2_2      outz2 MID net2 MID  -1
C2_2          5_2 MID 1.2202e-12 
R5_2          net2 5_2 R_NOISELESS 10K 
R4_2          net2 outz1 R_NOISELESS 10805.1831
R7_2          outz1 MID R_NOISELESS 1 
R1_3          2_3  MID R_NOISELESS 1 
R11_3         5_3  MID R_NOISELESS 0.38001
C4_3          5_3  outz2 1.9894e-13
R10_3         5_3  outz2 R_NOISELESS 10K 
XVCVS_LIM_1 5_3  MID MID 2_3   VCCS_LIM_ZO_0_OPA134
R9_3          outz2 MID R_NOISELESS 1 
Rdummy      MID ZO_OUT R_NOISELESS 2000 
Rx          ZO_OUT 2_3 R_NOISELESS 20000 
.ENDS
*
.SUBCKT VCCS_LIM_ZO_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 26316.2632
.PARAM IPOS = 1755.4
.PARAM INEG = -1902.764
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VC+,VC-),INEG,IPOS)}
.ENDS
*
.subckt FEMT_0_OPA134 1 2
.param NVRF=3
.param RNVF={1.184*PWR(NVRF,2)}
E1 3 0 5 0 10
R1 5 0 {RNVF}
R2 5 0 {RNVF}
G1 1 2 3 0 1e-6
.ends
*
.SUBCKT VNSE_0_OPA134  1 2
.PARAM FLW=1
.PARAM NLF=85
.PARAM NVR=8
.PARAM GLF={PWR(FLW,0.25)*NLF/1164}
.PARAM RNV={1.184*PWR(NVR,2)}
.MODEL DVN D KF={PWR(FLW,0.5)/1E11} IS=1.0E-16
I1 0 7 10E-3
I2 0 8 10E-3
D1 7 0 DVN
D2 8 0 DVN
E1 3 6 7 8 {GLF}
R1 3 0 1E9
R2 3 0 1E9
R3 3 6 1E9
E2 6 4 5 0 10
R4 5 0 {RNV}
R5 5 0 {RNV}
R6 3 4 1E9
R7 4 0 1E9
E3 1 2 3 4 1
.ENDS
*
.SUBCKT VCCS_LIMIT_IQ_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 1E-3
G1 IOUT- IOUT+ VALUE={IF( (V(VC+,VC-)<=0),0,GAIN*V(VC+,VC-) )}
.ENDS
*
.SUBCKT CLAMP_AMP_LO_0_OPA134  VC+ VC- VIN COM VO+ VO-
.PARAM G=1
GVO+ COM VO+ VALUE = {IF(V(VIN,COM)>V(VC+,COM),((V(VIN,COM)-V(VC+,COM))*G),0)}
GVO- COM VO- VALUE = {IF(V(VIN,COM)<V(VC-,COM),((V(VC-,COM)-V(VIN,COM))*G),0)}
.ENDS
*
.SUBCKT CLAMP_AMP_HI_0_OPA134  VC+ VC- VIN COM VO+ VO-
.PARAM G=10
GVO+ COM VO+ VALUE = {IF(V(VIN,COM)>V(VC+,COM),((V(VIN,COM)-V(VC+,COM))*G),0)}
GVO- COM VO- VALUE = {IF(V(VIN,COM)<V(VC-,COM),((V(VC-,COM)-V(VIN,COM))*G),0)}
.ENDS
*
.SUBCKT VCCS_LIM_GR_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 1
.PARAM IPOS = 1.2369
.PARAM INEG = -1.2369
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VC+,VC-),INEG,IPOS)}
.ENDS
*
.SUBCKT VCCS_LIM_4_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 1
.PARAM IPOS = 0.2478
.PARAM INEG = -0.252
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VC+,VC-),INEG,IPOS)}
.ENDS
*
.SUBCKT VCCS_LIM_CLAW+_0_OPA134 VC+ VC- IOUT+ IOUT-
G1 IOUT+ IOUT- TABLE {(V(VC+,VC-))} =
+(0, 2.5E-3)
+(29.2566, 0.00253)
+(39.0088, 0.0035407)
+(39.4964, 0.003602)
+(40.4716, 0.0037582)
+(41.4468, 0.0039489)
+(42.4221, 0.004199)
+(43.3973, 0.0046021)
+(43.8849, 0.0049166)
.ENDS
*
.SUBCKT VCCS_LIM_CLAW-_0_OPA134 VC+ VC- IOUT+ IOUT-
G1 IOUT+ IOUT- TABLE {(V(VC+,VC-))} =
+(0, 2.2E-3)
+(15.8564, 0.0016712)
+(31.7127, 0.0025495)
+(42.2836, 0.0031587)
+(42.8122, 0.0031903)
+(43.8693, 0.0032536)
+(44.9264, 0.0033071)
+(45.9835, 0.0033814)
+(47.0406, 0.0037475)
+(47.5691, 0.0049421)
.ENDS
* 
.SUBCKT VCCS_LIM_3_0_OPA134  VC+ VC- IOUT+ IOUT-
.PARAM GAIN = 1
.PARAM IPOS = 0.1239
.PARAM INEG = -0.126
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VC+,VC-),INEG,IPOS)}
.ENDS
*
.SUBCKT OL_SENSE_0_OPA134  COM SW+ OLN  OLP
GSW+ COM SW+ VALUE = {IF((V(OLN,COM)>10E-3 | V(OLP,COM)>10E-3),1,0)}
.ENDS
*
.SUBCKT VCCS_EXT_LIM_0_OPA134  VIN+ VIN- IOUT- IOUT+ VP+ VP-
.PARAM GAIN = 1
G1 IOUT+ IOUT- VALUE={LIMIT(GAIN*V(VIN+,VIN-),V(VP-,VIN-), V(VP+,VIN-))}
.ENDS
*
