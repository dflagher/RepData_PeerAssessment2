# FILE: rdproj2.R
#
# R script for Reproducible Data project 2. This script will be used to do some
# exploratory data analysis. As such, it will also be a record of what was done, so
# that useful analysis can be used in the final report.

# initializations

library(lubridate)
library(dplyr)

# set working_dir variable
working_dir <- "~/Documents/courses/repdata/RepData_PeerAssessment2"

# set working directory
setwd(working_dir)

# read in the data file
noaa <- read.csv("data/repdata_data_StormData.csv.bz2")

# include only events that had fatalities or injuries
harmful <- noaa %>%
           filter(FATALITIES > 0 | INJURIES > 0)

# only looking at EVTYPE,FATALITIES, and INJURIES
harmful <- subset(harmful, select = c(EVTYPE,FATALITIES,INJURIES))

# --------------------------------------------------------------------

head(harmful[with(harmful, order(-FATALITIES,-INJURIES)),])
as.data.frame(table(harmful$EVTYPE))

x<-
  subset(harmful$EVTYPE, harmful$FATALITIES %in% top20)

top20 <- head(sort(harmful$FATALITIES,decreasing=TRUE),n=20L)


dd[with(dd, order(-z, b)), ]

table(harmful$EVTYPE, harmful$FATALITIES > 200)
summary(harmful)

sort(table(harmful$EVTYPE)[,2],decreasing=TRUE)
x <- as.data.frame(table(harmful$EVTYPE))
colnames(x)

head(x[with(x, order(-Freq)), ],20L)


[,2]
t <- table(harmful$EVTYPE)

unique(harmful$EVTYPE)


b <- factor(rep(c("A","B","C"), 10))
table(b)
b

