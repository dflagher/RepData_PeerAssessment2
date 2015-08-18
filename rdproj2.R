# FILE: rdproj2.R
#
# R script for Reproducible Data project 2. This script will be used to do some
# exploratory data analysis. As such, it will also be a record of what was done, so
# that useful analysis can be used in the final report.

# initializations

library(lubridate)

# set working_dir variable
working_dir <- "~/Documents/courses/repdata/RepData_PeerAssessment2"

# set working directory
setwd(working_dir)

# read in the data file
noaa <- read.csv("data/repdata_data_StormData.csv")

dim(noaa)

tail(noaa)
head(noaa)
head(mdy(noaa$BGN_DATE))
head(noaa$COUNTYNAME)
head(noaa$EVTYPE)
