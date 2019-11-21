a <- 0:9
b <- seq(0,0.9,0.1)
ind <- rep(c("A", "B"),length(a)/2)
indAlt <- c(rep("C",length(a)/2),rep("D",length(a)/2))
myFrame <- data.frame(index1=ind,index2=indAlt,a,b)

names(myFrame)
myFrame$index1
myFrame$index2
dim(myFrame)

myFrame[1:5,]
myFrame[,1:2]

myFrame[myFrame$index1 == "A",]
myFrame[myFrame$index1 == "A",]$b
