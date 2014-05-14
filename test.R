# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data

setwd("~/GitHub/RepData_PeerAssessment1")
df <- read.csv("activity.csv")
df$date <- as.Date(df$date, "%Y-%m-%d")

## What is mean total number of steps taken per day?

library(reshape2)
df2 <- df[!is.na(df$steps),]
totSteps <- tapply(df2$steps,df2$date,sum)
totSteps <- totSteps[!is.na(totSteps)]

hist(totSteps)

mean(totSteps)

The median number of steps taken per day is:
  
median(totSteps)

## What is the average daily activity pattern?

meanSteps <- tapply(df2$steps,df2$interval,mean)
plot(names(meanSteps),meanSteps,type="l",xlab="5-minute interval",ylab="Number of Steps Taken")

which.max(meanSteps)

## Imputing missing values

defaultDay <- data.frame(mean=meanSteps)
head(defaultDay)

## Are there differences in activity patterns between weekdays and weekends?
