

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


### water dataset ###
dtWater = read.csv("MetalcontaminationWater_Calc.csv", header = T)
dtWater = dtWater[,c(3,4,5,13:30)] ##only keep concentrations in microM and TUs 

### Sediment dataset ###
dtSed = read.csv("TSS-2018-EXP-03-Metals Sediment_Corrected_red.csv", header = T)
dtSed = dtSed[,c(1:11)] ## only keep columns with concentrations in mmolperkgDS
d





