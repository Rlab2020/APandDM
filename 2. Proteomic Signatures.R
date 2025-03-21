## signature = proteomic signaure scores of air pollution exposure
## airpollutant = air pollution exposure as continuous exposure
## dm2_time = follow-up period
## dm2 = type 2 diabetes (1 or 0)



library(lme4);library(lmerTest);library(survival);library(survminer);library(glmnet);library(mediation)



## ASSOCIATIONS OF AIR POLLUTION EXPOSURE WITH T2D

model1<-coxph(Surv(dm2_time,dm2)~airpollutant+age+sex+ses+bmi+prs_dm2+ethnic, data0)
model2<-coxph(Surv(dm2_time,dm2)~airpollutant+age+sex+ses+bmi+prs_dm2+ethnic+whr0+nosmoking+drinkingM+sleeph+regular+dieth+htnp+cadp+strp+statin+steroid, data0)
model3<-coxph(Surv(dm2_time,dm2)~airpollutant+signaure+age+sex+ses+bmi+prs_dm2+ethnic+whr0+nosmoking+drinkingM+sleeph+regular+dieth+htnp+cadp+strp+statin+steroid, data0)

# The associations of each air pollutant with T2D were obtained by running the above code.



## ASSOCIATIONS OF PROTEOMIC SIGNATURES WITH T2D

model4<-coxph(Surv(dm2_time,dm2)~signature+age+sex+ses+bmi+prs_dm2+ethnic+fastt+season+sampleage, data0)
model5<-coxph(Surv(dm2_time,dm2)~signature+age+sex+ses+bmi+prs_dm2+ethnic+whr0+nosmoking+drinkingM+sleeph+regular+dieth+htnp+cadp+strp+statin+steroid+fastt+season+sampleage, data0)
model6<-coxph(Surv(dm2_time,dm2)~signature+airpollutant+age+sex+ses+bmi+prs_dm2+ethnic+whr0+nosmoking+drinkingM+sleeph+regular+dieth+htnp+cadp+strp+statin+steroid+fastt+season+sampleage, data0)

# The associations of each proteomic signature with T2D were obtained by running the above code.


## MEDIATION ANALYSIS

mediation <- mediate(modelMediate, modelDirect, treat = airpollutant, mediator = signature)

# The mediation effect of each proteomic signature in the association of air pollution with T2D were obtained by running the above code.
