KPDWLD <- load("C:/Users/erno2/Documents/Git Repos/infomcm/keyPressDataWithLaneDeviation.Rdata")

KPDWLD <- keyPressDataWithLaneDeviation

dualSteerMeans <- character()
for (i in 1:length(KPDWLD[!duplicated(KPDWLD$pp),])) {
  
  participant <- KPDWLD[KPDWLD$pp == i,]
  for (j in 1:length(participant$pp)) {
    dualSteer <- participant[participant$partOfExperiment == "dualSteerFocus",]
  }
  dualSteerMeans[i] <- mean(dualSteer[dualSteer$Event1=="Correct",]$timeRelativeToTrialStart)

}
dualSteerMeans
totalMean <- mean(dualSteerMeans)
