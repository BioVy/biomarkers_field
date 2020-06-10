

### Fish dataset ####
dtFish =  read.csv("TSS-2018-EXP03-Biomarkers.csv", header = T) ## all endpoints measured in fish
dtFish = dtFish[, c(1:31)] ## remove unnecessary columns for now 

### Invertebrate dataset ####
dtInv.L = read.csv("TSS-201-EXP-03-Invertebrates for metal analysis_red.csv", header = T) ## metals measured in Inv
                                                                                        ## as long table
dtInv.L$Metal_Type = NULL
dtInv.L$Taxon = NULL

## convert dtInv1 to wide table
library(reshape2)

dtInv.W = reshape(dtInv.L, idvar = c("SampleID","River", "Riv", "Region",'Taxon_ID'),
                            v.names = 'Concentration_nmolperg',
                            timevar = 'Metal',
                            direction = 'wide')

colnames(dtInv.W) = c( "SampleID","River","Riv","Region","Taxon_ID","Hg","Fe","Co","Cu","Zn","Cd","Pb","As")

e
### water dataset ###
dtWater = read.csv("MetalcontaminationWater_Calc.csv", header = T)
dtWater = dtWater[,c(3,4,5,13:30)] ##only keep concentrations in microM and TUs 

### Sediment dataset ###
dtSed = read.csv("dtSed_Calc.csv", header = T)
head(dtSed)
dtSed$X = NULL


### save all datasets in 1 object####
dtfieldbiomarkers = list(dtFish,dtInv.L,dtInv.W,dtSed,dtWater)
saveRDS(dtfieldbiomarkers, "dtfieldbiomarkers.RData")



