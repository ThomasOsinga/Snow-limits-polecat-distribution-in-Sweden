# Author: Marlon E. Cobos 
#Edited by: Thomas Osinga
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Information:
# Data needed to replicate these analyses are:
# - Occurrence records properly cleaned and processed for creating ENMs.
# - Variables masked to the area where models will be calibrated (M).
# - If you need projections variables masked to the area or representing the 
#   scenario of interest.
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# (ONLY IF NEEDED) installing the package 
## devtools
install.packages("devtools")

## kuenm
devtools::install_github("marlonecobos/kuenm")
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# loading the package
library(kuenm)

# setting working directory (CHANGE IT ACCORDING TO YOUR NEEDS)
setwd("D:/Stage/Modelling/R_MAXENT/Gaan we weer")
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# preparing data
## splitting training and testing records 
help(kuenm_occsplit)

occs <- read.csv("occ_Mustela.csv")

set.seed(1)
split <- kuenm_occsplit(occ = occs, train.proportion = 0.8, method = "random",
                        save = TRUE, name = "occ")

## preparing sets of variables )
help(kuenm_varcomb)

vs <- kuenm_varcomb(var.dir = "Variables", out.dir = "M_variables", min.number = 4, 
                    in.format = "ascii", out.format = "ascii")

#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# calibration
## candidate model creation 
help(kuenm_cal)

oj <- "occ_joint.csv"
otr <- "occ_train.csv"
mvars <- "M_variables"
bcal <- "batch_cal"
candir <- "Candidate_models1"
regm <- c(0.1, 0.25,0.5, 1, 2)
fclas <- c("lq", "q", "lqp")
mxpath <- "D:/Stage/Programs/maxent"

kuenm_cal(occ.joint = oj, occ.tra = otr, M.var.dir = mvars, 
          batch = bcal, out.dir = candir, max.memory = 1000, 
          reg.mult = regm, f.clas = fclas, args = NULL, 
          maxent.path = mxpath, wait = FALSE, run = TRUE)


k## evaluation of candidate models 
help(kuenm_ceval)

ote <- "occ_test.csv"
cresdir <- "Calibration_results"

kuenm_ceval(path = candir, occ.joint = oj, occ.tra = otr, 
            occ.test = ote, batch = bcal, out.eval = cresdir,
            threshold = 5, rand.percent = 50, iterations = 500,
            kept = TRUE, selection = "OR_AICc", parallel.proc = FALSE) 
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# model projections 
help(kuenm_mod)

bfmod <- "batch_model"
moddir <- "Final_models"
gvars <- "G_variables"

kuenm_mod(occ.joint = oj, M.var.dir = mvars, out.eval = cresdir, 
          batch = bfmod, rep.n = 10, rep.type = "Bootstrap",
          jackknife = TRUE, out.dir = moddir, max.memory = 1000, 
          out.format = "cloglog", project = TRUE, G.var.dir = gvars, 
          ext.type = "ext", write.mess = FALSE, write.clamp = FALSE, 
          maxent.path = mxpath, args = NULL, wait = FALSE, run = TRUE)

#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# independent evaluation 
help(kuenm_feval)

kuenm_feval(path = moddir, occ.joint = oj, occ.ind = "Mustela_putorius_Validatation.csv", 
            replicates = TRUE, out.eval = "F_models_evaluation_10_15", threshold = c(5,10,15), 
            rand.percent = 50, iterations = 500, parallel.proc = FALSE)


#-------------------------------------------------------------------------------
# evaluation of extrapolation risks 
help(kuenm_mmop)

outmop <- "MOP_results"

kuenm_mmop(G.var.dir = gvars, is.swd = FALSE, M.var.dir = mvars, sets.var = "Set_1", 
           out.mop = outmop, percent = 5, comp.each = 2000, 
           parallel = FALSE)
