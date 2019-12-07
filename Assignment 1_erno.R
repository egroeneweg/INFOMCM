#
#
# Opdracht 1
#
#

#
#
# A
#
#

rm(list = ls())
setwd("C:/Users/Leon/Desktop/CogMod/")
#resultTable <- read.csv("participant52data.csv", header=TRUE,sep="")
#resultTable[,2]
load("keyPressDataWithLaneDeviation.Rdata")
#testDing <- read.csv("C:/Users/Leon/Desktop/CogMod/keyPressDataWithLaneDeviation,csv", header=TRUE,sep="")
data <- keyPressDataWithLaneDeviation
colnames(data)
#data[typingErrorMadeOnTrial == FALSE,]
dataTest <- data[data$typingErrorMadeOnTrial == FALSE,]
#dataTest$typingErrorMadeOnTrial


#dataTest$
smallMean <- aggregate(
  dataTest$timeRelativeToTrialStart[(dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus") & dataTest$phoneNrLengthAfterKeyPress == 11]
  ,list(
    dataTest$partOfExperiment[(dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus") & dataTest$phoneNrLengthAfterKeyPress == 11]
    ,
    dataTest$pp[(dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus") & dataTest$phoneNrLengthAfterKeyPress == 11]
  )
  ,mean
)
smallMean$x <- smallMean$x/1000
resultTable <- aggregate(smallMean$x,
                         list(
                           smallMean$Group.1
                         )
                         ,mean)
grandSD <- aggregate(smallMean$x,
                     list(
                       smallMean$Group.1
                     )
                     ,sd)
#table3 <- aggregate(dataTest$timeRelativeToTrialStart[dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus"],list(dataTest$partOfExperiment[dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus"]),se)
#resultTable$SD <- NA
resultTable$SD <- grandSD$x
#resultTable$SE <- NA
resultTable$SE <- resultTable$SD/sqrt(length(dataTest$timeRelativeToTrialStart[dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus"]))
colnames(resultTable) <- c(" ", "M","SD", "SE") 

resultTable


#
#
# B
#
#
#dataTest$
smallMeanLD <- aggregate(
  abs(dataTest$lanePosition[(!is.na(dataTest$lanePosition)) & dataTest$phoneNrLengthAfterKeyPress == 11])
  ,list(
    dataTest$partOfExperiment[(!is.na(dataTest$lanePosition)) & dataTest$phoneNrLengthAfterKeyPress == 11]
    ,
    dataTest$pp[(!is.na(dataTest$lanePosition)) & dataTest$phoneNrLengthAfterKeyPress == 11]
  )
  ,mean
)
resultTableLD <- aggregate(smallMeanLD$x,
                           list(
                             smallMeanLD$Group.1
                           )
                           ,mean)
grandSD_LD <- aggregate(smallMeanLD$x,
                        list(
                          smallMeanLD$Group.1
                        )
                        ,sd)
#table3 <- aggregate(dataTest$timeRelativeToTrialStart[dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus"],list(dataTest$partOfExperiment[dataTest$partOfExperiment == "dualSteerFocus" | dataTest$partOfExperiment == "dualDialFocus"]),se)
#resultTable$SD <- NA
resultTableLD$SD <- grandSD_LD$x
#resultTable$SE <- NA
resultTableLD$SE <- resultTableLD$SD/sqrt(length(dataTest$timeRelativeToTrialStart[(!is.na(dataTest$lanePosition)) & dataTest$phoneNrLengthAfterKeyPress == 11]))
colnames(resultTableLD) <- c(" ", "M","SD", "SE") 

resultTableLD