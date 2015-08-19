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
noaa <- read.csv("data/repdata_data_StormData.csv")

# include only events that had fatalities or injuries
harmful <- noaa %>%
           filter(FATALITIES > 0 | INJURIES > 0)

a <- noaa %>% filter(FATALITIES > 10)
b <- noaa %>% filter(INJURIES > 0)

summary(a$FATALITIES)

# remove the time part of the BGN_DATE field
harmful$BGN_DATE <- as.Date(harmful$BGN_DATE,"%m/%d/%Y")

x <- harmful %>%
      filter(BGN_DATE > "2001-01-01")

max(x$BGN_DATE)

head(sort(a$FATALITIES, decreasing=TRUE), n=60L)

sort(unique(a$FATALITIES),decreasing = TRUE)

     max(x$FATALITIES)
min(x$FATALITIES)
summary(x$FATALITIES)

unique(a$EVTYPE)



dim(noaa)

tail(noaa)
head(noaa$BGN_DATE)
head(mdy(noaa$BGN_DATE))
head(noaa$COUNTYNAME)
head(noaa$FATALITIES)

count(noaa$BGN_DATE)
length(noaa$BGN_DATE)
length(noaa$EVTYPE)
unique(noaa$EVTYPE)
colnames(noaa)
