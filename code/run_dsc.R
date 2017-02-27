library(dscr)
library(ashr)
sessionInfo()

dsc_normalmeans=new_dsc("normalmeans","../output/dsc-normalmeans-files")
source("add_named_scenarios.R")
add_named_scenarios(dsc_normalmeans,c("spiky","near-normal","flat-top","skew","big-normal","bimodal"), nsamp=10, suffix = "-n10")
add_named_scenarios(dsc_normalmeans,c("spiky","near-normal","flat-top","skew","big-normal","bimodal"), nsamp=100, suffix = "-n100")
add_named_scenarios(dsc_normalmeans,c("spiky","near-normal","flat-top","skew","big-normal","bimodal"), nsamp=1000, suffix = "-n1000")


#simulations with no null effects, t4 distribution
add_named_scenarios(dsc_normalmeans,c("t4"), nsamp=10, suffix="-n10")
add_named_scenarios(dsc_normalmeans,c("t4"), nsamp=100, suffix="-n100")
add_named_scenarios(dsc_normalmeans,c("t4"), nsamp=1000, suffix="-n1000")


# more with no null effects
add_named_scenarios(dsc_normalmeans,c("near-normal","big-normal","flat-top","vbignormal","bimodal"),min_pi0=0,max_pi0=0,suffix="-nn-n1000")

source("add_methods.R")

add_output_parser(dsc_normalmeans,"ash2beta",ash2beta_est,"ash_output","beta_est_output")
add_output_parser(dsc_normalmeans,"ebayesthresh2beta",ebayesthresh2beta_est,"ebayesthresh_output","beta_est_output")
add_output_parser(dsc_normalmeans,"horseshoe2beta",horseshoe2beta_est,"horseshoe_output","beta_est_output")

#add_output_parser(dsc_normalmeans,"mixfdr2beta",mixfdr2beta_est,"mixfdr_output","beta_est_output")



source("score.R")
add_score(dsc_normalmeans,score,"beta_err","beta_est_output")


res=run_dsc(dsc_normalmeans)
save(res,dsc_normalmeans,file="../output/dsc-normalmeans-files/res.RData")


