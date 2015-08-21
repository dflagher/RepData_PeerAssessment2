# FILE: rdproj2.R
#
# R script for Reproducible Data project 2. This script will be used to do some
# exploratory data analysis. As such, it will also be a record of what was done, so
# that useful analysis can be used in the final report.

# initializations

# load libraries
#library(lubridate)
#library(dplyr)

# set working dir
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

# injuries by EVTYPE
injuries <- aggregate(INJURIES ~ EVTYPE, noaa, sum)
top10injuries <- head(injuries[with(injuries, order(-INJURIES)), ], n=10L)
print(top10injuries)

# fatalities by EVTYPE
fatalities <- aggregate(FATALITIES ~ EVTYPE, noaa, sum)
top10fatalities <- head(fatalities[with(fatalities, order(-FATALITIES)), ], n=10L)
print(top10fatalities)

library(ggplot2)

ggplot(data=top10injuries, aes(x=EVTYPE, y=INJURIES)) +
  geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("Event Type") + 
  ylab("Number of Injuries") +
  ggtitle("Injuries by Event")

ggplot(data=top10fatalities, aes(x=EVTYPE, y=FATALITIES)) +
  geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("Event Type") + 
  ylab("Number of Fatalities") +
  ggtitle("Fatalites by Event")


# property damage by EVTYPE
totpropdmg <- aggregate(TOTPROPDMG ~ EVTYPE, noaa, sum)
# convert to billions for reporting purposes; sum get too large
totpropdmg$TOTPROPDMG <- round(totpropdmg$TOTPROPDMG/1000000000, digits=1)

kable(head(totpropdmg[with(totpropdmg, order(-TOTPROPDMG)), ], n=10L),
      row.name= FALSE, col.names = c("Event Type","Cost of Damage"),
      caption = "Property Damage in Billions of Dollars")

# crop damage by EVTYPE
totcropdmg <- aggregate(TOTCROPDMG ~ EVTYPE, noaa, sum)
# convert to billions for reporting purposes; sum get too large
totcropdmg$TOTCROPDMG <- round(totcropdmg$TOTCROPDMG/1000000000, digits=1)

kable(head(totcropdmg[with(totcropdmg, order(-TOTCROPDMG)), ], n=10L),
      row.name= FALSE, col.names = c("Event Type","Cost of Damage"),
      caption = "Crop Damage in Billions of Dollars")



# 
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



pl <- lapply(1:11, function(.x) qplot(1:10,rnorm(10), main=paste("plot",.x)))
ml <- marrangeGrob(pl, nrow=2, ncol=2)
## interactive use; open new devices
ml

