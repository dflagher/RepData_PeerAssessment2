# FILE: rdproj2.R
#
# R script for Reproducible Data project 2. This script will be used to do some
# exploratory data analysis. As such, it will also be a record of what was done, so
# that useful analysis can be used in the final report.

# initializations

# load libraries
#library(lubridate)
#library(dplyr)

# set working_dir
#   change to match your computer when running this script
#
setwd("~/Documents/courses/repdata/RepData_PeerAssessment2")

# read in the data file
noaa <- read.csv("data/repdata_data_StormData.csv.bz2",
                 sep = ",",
                 strip.white = TRUE,
                 stringsAsFactors = FALSE)

# only include columns relevent to our questions
noaa <- subset(noaa, 
               select = c(EVTYPE,FATALITIES,INJURIES,
                          PROPDMG,PROPDMGEXP,CROPDMG,CROPDMGEXP))

# upshift PROPDMGEXP and CROPDMGEXP columns
noaa$PROPDMGEXP <- toupper(noaa$PROPDMGEXP)
noaa$CROPDMGEXP <- toupper(noaa$CROPDMGEXP)

# add columns for property and crop damage totals
noaa$TOTPROPDMG <- 0
noaa$TOTCROPDMG <- 0

numbers <- as.character(1:9)

# calculate property damage totals
noaa$TOTPROPDMG[which(noaa$PROPDMGEXP %in% numbers)] <- 
  noaa$PROPDMG[which(noaa$PROPDMGEXP %in% numbers)] * 1
noaa$TOTPROPDMG[which(noaa$PROPDMGEXP == "H")] <- 
  noaa$PROPDMG[which(noaa$PROPDMGEXP == "H")] * 100
noaa$TOTPROPDMG[which(noaa$PROPDMGEXP == "K")] <- 
  noaa$PROPDMG[which(noaa$PROPDMGEXP == "K")] * 1000
noaa$TOTPROPDMG[which(noaa$PROPDMGEXP == "M")] <- 
  noaa$PROPDMG[which(noaa$PROPDMGEXP == "M")] * 1000000
noaa$TOTPROPDMG[which(noaa$PROPDMGEXP == "B")] <- 
  noaa$PROPDMG[which(noaa$PROPDMGEXP == "B")] * 1000000000

# calculate crop damage totals
noaa$TOTCROPDMG[which(noaa$CROPDMGEXP %in% numbers)] <- 
  noaa$CROPDMG[which(noaa$CROPDMGEXP %in% numbers)] * 1
noaa$TOTCROPDMG[which(noaa$CROPDMGEXP == "H")] <- 
  noaa$CROPDMG[which(noaa$CROPDMGEXP == "H")] * 100
noaa$TOTCROPDMG[which(noaa$CROPDMGEXP == "K")] <- 
  noaa$CROPDMG[which(noaa$CROPDMGEXP == "K")] * 1000
noaa$TOTCROPDMG[which(noaa$CROPDMGEXP == "M")] <-
  noaa$CROPDMG[which(noaa$CROPDMGEXP == "M")] * 1000000
noaa$TOTCROPDMG[which(noaa$CROPDMGEXP == "B")] <- 
  noaa$CROPDMG[which(noaa$CROPDMGEXP == "B")] * 1000000000

max()




df$n[which(df$m == "h")] <- df$n[which(df$m == "h")] * 100

noaa$TOTPROPDMG 
# --------------------------------------------------------------------

# 
x <- df[!(df$m %in% c("a","c")),]
noaa[noaa$PROPDMGEXP %in% c("+","-"," ","?"),]

noaa[noaa$CROPDMGEXP %in% c("+","-"," ","?"),]
x <- filter(noaa, PROPDMGEXP %in% c("+","-"," ","?"))

x <- noaa[which(noaa$PROPDMGEXP %in% c("+","-"," ","?"))]
unique(noaa$PROPDMGEXP)
unique(noaa$CROPDMGEXP)
CROPDMGEXP
colnames(noaa)

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

