# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data


```r
setwd("~/GitHub/RepData_PeerAssessment1")
df <- read.csv("activity.csv")
df$date <- as.Date(df$date, "%Y-%m-%d")
```


## What is mean total number of steps taken per day?

First we clean the data set by removing NA values, then we find the total number of steps per day.


```r
library(reshape2)
df2 <- df[!is.na(df$steps), ]
totSteps <- tapply(df2$steps, df2$date, sum)
totSteps <- totSteps[!is.na(totSteps)]
```


Here is a histogram of the total number of steps per day.


```r
hist(totSteps)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


The mean number of steps taken per day is:


```r
mean(totSteps)
```

```
## [1] 10766
```


The median number of steps taken per day is:


```r
median(totSteps)
```

```
## [1] 10765
```


## What is the average daily activity pattern?


```r
meanSteps <- tapply(df2$steps, df2$interval, mean)
plot(names(meanSteps), meanSteps, type = "l", xlab = "5-minute interval", ylab = "Number of Steps Taken")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


To find the time interval with the highest average number of steps, we use the which.max function:


```r
which.max(meanSteps)
```

```
## 835 
## 104
```


## Imputing missing values

For missing (NA) values, we will first compute a "default day" of data, consisting of the mean for 
the missing time interval.


```r
defaultDay <- data.frame(mean = meanSteps)
head(defaultDay)
```

```
##       mean
## 0  1.71698
## 5  0.33962
## 10 0.13208
## 15 0.15094
## 20 0.07547
## 25 2.09434
```



## Are there differences in activity patterns between weekdays and weekends?
