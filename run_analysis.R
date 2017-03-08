#### References & Settings ####
# Reference required packages
library(dplyr)

# Setup variables to be used throughout the script
dataDirectory <- "./UCI HAR Dataset"


#### Part 0 - Get Data ####

# Retrieve Source data
#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL, destfile = "UCI_HAR_Dataset.zip")
## AFTER DOWNLOAD, Extract zip contents to UCI HAR Dataset folder


#### Part 1 - Reference Data ####

# Get Supporting Data
featureLabels <- read.table(
                      paste(dataDirectory,"features.txt", sep="/")
                    , col.names = c("id", "featurename")
                    , as.is = TRUE
                    )
activityLabels <- read.table(
                          file = paste(dataDirectory,"activity_labels.txt", sep="/")
                        , col.names = c("id","activityname")
                        )


#### Part 2 - Test Data ####

# Get Test Data frames
testDataSRC <- read.table(
                  paste(dataDirectory,"test","X_test.txt",sep="/")
                , col.names = featureLabels$featurename
                )
testData <- testDataSRC[,grepl("\\.mean\\.\\.|\\.std\\.\\.", colnames(testDataSRC))]

subjects <- read.table(
                  paste(dataDirectory,"test","subject_test.txt",sep="/")
                , col.names = c("subjectid")
                )
testLabels <- read.table(
                  paste(dataDirectory,"test","y_test.txt",sep="/")
                , col.names = c("id")
                 ) %>%
            inner_join(activityLabels, by="id")

testData <- testLabels %>% select(activityname) %>% bind_cols(subjects, testData)


#### Part 3 - Training Data ####

# Get Training Data
trainDataSRC <- read.table(
                  paste(dataDirectory,"train","X_train.txt",sep="/")
                , col.names = featureLabels$featurename
                )
trainData <- trainDataSRC[,grepl("\\.mean\\.\\.|\\.std\\.\\.", colnames(trainDataSRC))]

subjects <- read.table(
                  paste(dataDirectory,"train","subject_train.txt",sep="/")
                , col.names = c("subjectid")
                )
trainLabels <- read.table(
                  paste(dataDirectory,"train","y_train.txt",sep="/")
                , col.names = c("id")
                ) %>%
            inner_join(activityLabels, by="id")

trainData <- trainLabels %>% select(activityname) %>% bind_cols(subjects, trainData)


#### Part 4 - Combine & Clean ####

# Combine Data Sets
allData <- testData %>% bind_rows(trainData)

# Cleanup Variable Names
allData <- allData %>% rename(
      TimeBodyAccelerometerMeanX = tBodyAcc.mean...X
    , TimeBodyAccelerometerMeanY = tBodyAcc.mean...Y
    , TimeBodyAccelerometerMeanZ = tBodyAcc.mean...Z
    , TimeBodyAccelerometerStdDevX = tBodyAcc.std...X
    , TimeBodyAccelerometerStdDevY = tBodyAcc.std...Y
    , TimeBodyAccelerometerStdDevZ = tBodyAcc.std...Z
    , TimeGravityAccelerometerMeanX = tGravityAcc.mean...X
    , TimeGravityAccelerometerMeanY = tGravityAcc.mean...Y
    , TimeGravityAccelerometerMeanZ = tGravityAcc.mean...Z
    , TimeGravityAccelerometerStdDevX = tGravityAcc.std...X
    , TimeGravityAccelerometerStdDevY = tGravityAcc.std...Y
    , TimeGravityAccelerometerStdDevZ = tGravityAcc.std...Z
    , TimeBodyAccelerometerJerkMeanX = tBodyAccJerk.mean...X
    , TimeBodyAccelerometerJerkMeanY = tBodyAccJerk.mean...Y
    , TimeBodyAccelerometerJerkMeanZ = tBodyAccJerk.mean...Z
    , TimeBodyAccelerometerJerkStdDevX = tBodyAccJerk.std...X
    , TimeBodyAccelerometerJerkStdDevY = tBodyAccJerk.std...Y
    , TimeBodyAccelerometerJerkStdDevZ = tBodyAccJerk.std...Z
    , TimeBodyGyroscopeMeanX = tBodyGyro.mean...X
    , TimeBodyGyroscopeMeanY = tBodyGyro.mean...Y
    , TimeBodyGyroscopeMeanZ = tBodyGyro.mean...Z
    , TimeBodyGyroscopeStdDevX = tBodyGyro.std...X
    , TimeBodyGyroscopeStdDevY = tBodyGyro.std...Y
    , TimeBodyGyroscopeStdDevZ = tBodyGyro.std...Z
    , TimeBodyGyroscopeJerkMeanX = tBodyGyroJerk.mean...X
    , TimeBodyGyroscopeJerkMeanY = tBodyGyroJerk.mean...Y
    , TimeBodyGyroscopeJerkMeanZ = tBodyGyroJerk.mean...Z
    , TimeBodyGyroscopeJerkStdDevX = tBodyGyroJerk.std...X
    , TimeBodyGyroscopeJerkStdDevY = tBodyGyroJerk.std...Y
    , TimeBodyGyroscopeJerkStdDevZ = tBodyGyroJerk.std...Z
    , TimeBodyAccelerometerMagnitudeMean = tBodyAccMag.mean..
    , TimeGravityAccelerometerMagnitudeMean = tGravityAccMag.mean..
    , TimeBodyAccelerometerJerkMagnitudeMean = tBodyAccJerkMag.mean..
    , TimeBodyGyroscopeMagnitudeMean = tBodyGyroMag.mean..
    , TimeBodyGyroscopeJerkMagnitudeMean = tBodyGyroJerkMag.mean..
    , TimeBodyAccelerometerMagnitudeStdDev = tBodyAccMag.std..
    , TimeGravityAccelerometerMagnitudeStdDev = tGravityAccMag.std..
    , TimeBodyAccelerometerJerkMagnitudeStdDev = tBodyAccJerkMag.std..
    , TimeBodyGyroscopeMagnitudeStdDev = tBodyGyroMag.std..
    , TimeBodyGyroscopeJerkMagnitudeStdDev = tBodyGyroJerkMag.std..
    , FourierBodyAccelerometerMeanX = fBodyAcc.mean...X
    , FourierBodyAccelerometerMeanY = fBodyAcc.mean...Y
    , FourierBodyAccelerometerMeanZ = fBodyAcc.mean...Z
    , FourierBodyAccelerometerStdDevX = fBodyAcc.std...X
    , FourierBodyAccelerometerStdDevY = fBodyAcc.std...Y
    , FourierBodyAccelerometerStdDevZ = fBodyAcc.std...Z
    , FourierBodyAccelerometerJerkMeanX = fBodyAccJerk.mean...X
    , FourierBodyAccelerometerJerkMeanY = fBodyAccJerk.mean...Y
    , FourierBodyAccelerometerJerkMeanZ = fBodyAccJerk.mean...Z
    , FourierBodyAccelerometerJerkStdDevX = fBodyAccJerk.std...X
    , FourierBodyAccelerometerJerkStdDevY = fBodyAccJerk.std...Y
    , FourierBodyAccelerometerJerkStdDevZ = fBodyAccJerk.std...Z
    , FourierBodyGyroscopeMeanX = fBodyGyro.mean...X
    , FourierBodyGyroscopeMeanY = fBodyGyro.mean...Y
    , FourierBodyGyroscopeMeanZ = fBodyGyro.mean...Z
    , FourierBodyGyroscopeStdDevX = fBodyGyro.std...X
    , FourierBodyGyroscopeStdDevY = fBodyGyro.std...Y
    , FourierBodyGyroscopeStdDevZ = fBodyGyro.std...Z
    , FourierBodyAccelerometerMagnitudeMean = fBodyAccMag.mean..
    , FourierBodyAccelerometerMagnitudeStdDev = fBodyAccMag.std..
    , FourierBodyAccelerometerJerkMagnitudeMean = fBodyBodyAccJerkMag.mean..
    , FourierBodyAccelerometerJerkMagnitudeStdDev = fBodyBodyAccJerkMag.std..
    , FourierBodyGyroscopeMagnitudeMean = fBodyBodyGyroMag.mean..
    , FourierBodyGyroscopeMagnitudeStdDev = fBodyBodyGyroMag.std..
    , FourierBodyGyroscopeJerkMagnitudeMean = fBodyBodyGyroJerkMag.mean..
    , FourierBodyGyroscopeJerkMagnitudeStdDev = fBodyBodyGyroJerkMag.std..
    )


#### Part 5 - Summarize & Save ####

# Create summary of data set for each activity and subject
subjectActivtySummary <- allData %>%
                            group_by(subjectid, activityname) %>%
                            summarize_all(mean)
                            # summarize(
                            #     TimeBodyAccelerometerMeanX = mean(tBodyAcc.mean...X),
                            #     TimeBodyAccelerometerMeanY = mean(tBodyAcc.mean...Y),
                            #     TimeBodyAccelerometerMeanZ = mean(tBodyAcc.mean...Z),
                            #     TimeBodyAccelerometerStdDevX = mean(tBodyAcc.std...X),
                            #     TimeBodyAccelerometerStdDevY = mean(tBodyAcc.std...Y),
                            #     TimeBodyAccelerometerStdDevZ = mean(tBodyAcc.std...Z),
                            #     TimeGravityAccelerometerMeanX = mean(tGravityAcc.mean...X),
                            #     TimeGravityAccelerometerMeanY = mean(tGravityAcc.mean...Y),
                            #     TimeGravityAccelerometerMeanZ = mean(tGravityAcc.mean...Z),
                            #     TimeGravityAccelerometerStdDevX = mean(tGravityAcc.std...X),
                            #     TimeGravityAccelerometerStdDevY = mean(tGravityAcc.std...Y),
                            #     TimeGravityAccelerometerStdDevZ = mean(tGravityAcc.std...Z),
                            #     TimeBodyAccelerometerJerkMeanX = mean(tBodyAccJerk.mean...X),
                            #     TimeBodyAccelerometerJerkMeanY = mean(tBodyAccJerk.mean...Y),
                            #     TimeBodyAccelerometerJerkMeanZ = mean(tBodyAccJerk.mean...Z),
                            #     TimeBodyAccelerometerJerkStdDevX = mean(tBodyAccJerk.std...X),
                            #     TimeBodyAccelerometerJerkStdDevY = mean(tBodyAccJerk.std...Y),
                            #     TimeBodyAccelerometerJerkStdDevZ = mean(tBodyAccJerk.std...Z),
                            #     TimeBodyGyroscopeMeanX = mean(tBodyGyro.mean...X),
                            #     TimeBodyGyroscopeMeanY = mean(tBodyGyro.mean...Y),
                            #     TimeBodyGyroscopeMeanZ = mean(tBodyGyro.mean...Z),
                            #     TimeBodyGyroscopeStdDevX = mean(tBodyGyro.std...X),
                            #     TimeBodyGyroscopeStdDevY = mean(tBodyGyro.std...Y),
                            #     TimeBodyGyroscopeStdDevZ = mean(tBodyGyro.std...Z),
                            #     TimeBodyGyroscopeJerkMeanX = mean(tBodyGyroJerk.mean...X),
                            #     TimeBodyGyroscopeJerkMeanY = mean(tBodyGyroJerk.mean...Y),
                            #     TimeBodyGyroscopeJerkMeanZ = mean(tBodyGyroJerk.mean...Z),
                            #     TimeBodyGyroscopeJerkStdDevX = mean(tBodyGyroJerk.std...X),
                            #     TimeBodyGyroscopeJerkStdDevY = mean(tBodyGyroJerk.std...Y),
                            #     TimeBodyGyroscopeJerkStdDevZ = mean(tBodyGyroJerk.std...Z),
                            #     TimeBodyAccelerometerMagnitudeMean = mean(tBodyAccMag.mean..),
                            #     TimeGravityAccelerometerMagnitudeMean = mean(tGravityAccMag.mean..),
                            #     TimeBodyAccelerometerJerkMagnitudeMean = mean(tBodyAccJerkMag.mean..),
                            #     TimeBodyGyroscopeMagnitudeMean = mean(tBodyGyroMag.mean..),
                            #     TimeBodyGyroscopeJerkMagnitudeMean = mean(tBodyGyroJerkMag.mean..),
                            #     TimeBodyAccelerometerMagnitudeStdDev = mean(tBodyAccMag.std..),
                            #     TimeGravityAccelerometerMagnitudeStdDev = mean(tGravityAccMag.std..),
                            #     TimeBodyAccelerometerJerkMagnitudeStdDev = mean(tBodyAccJerkMag.std..),
                            #     TimeBodyGyroscopeMagnitudeStdDev = mean(tBodyGyroMag.std..),
                            #     TimeBodyGyroscopeJerkMagnitudeStdDev = mean(tBodyGyroJerkMag.std..),
                            #     FourierBodyAccelerometerMeanX = mean(fBodyAcc.mean...X),
                            #     FourierBodyAccelerometerMeanY = mean(fBodyAcc.mean...Y),
                            #     FourierBodyAccelerometerMeanZ = mean(fBodyAcc.mean...Z),
                            #     FourierBodyAccelerometerStdDevX = mean(fBodyAcc.std...X),
                            #     FourierBodyAccelerometerStdDevY = mean(fBodyAcc.std...Y),
                            #     FourierBodyAccelerometerStdDevZ = mean(fBodyAcc.std...Z),
                            #     FourierBodyAccelerometerJerkMeanX = mean(fBodyAccJerk.mean...X),
                            #     FourierBodyAccelerometerJerkMeanY = mean(fBodyAccJerk.mean...Y),
                            #     FourierBodyAccelerometerJerkMeanZ = mean(fBodyAccJerk.mean...Z),
                            #     FourierBodyAccelerometerJerkStdDevX = mean(fBodyAccJerk.std...X),
                            #     FourierBodyAccelerometerJerkStdDevY = mean(fBodyAccJerk.std...Y),
                            #     FourierBodyAccelerometerJerkStdDevZ = mean(fBodyAccJerk.std...Z),
                            #     FourierBodyGyroscopeMeanX = mean(fBodyGyro.mean...X),
                            #     FourierBodyGyroscopeMeanY = mean(fBodyGyro.mean...Y),
                            #     FourierBodyGyroscopeMeanZ = mean(fBodyGyro.mean...Z),
                            #     FourierBodyGyroscopeStdDevX = mean(fBodyGyro.std...X),
                            #     FourierBodyGyroscopeStdDevY = mean(fBodyGyro.std...Y),
                            #     FourierBodyGyroscopeStdDevZ = mean(fBodyGyro.std...Z),
                            #     FourierBodyAccelerometerMagnitudeMean = mean(fBodyAccMag.mean..),
                            #     FourierBodyAccelerometerMagnitudeStdDev = mean(fBodyAccMag.std..),
                            #     FourierBodyAccelerometerJerkMagnitudeMean = mean(fBodyBodyAccJerkMag.mean..),
                            #     FourierBodyAccelerometerJerkMagnitudeStdDev = mean(fBodyBodyAccJerkMag.std..),
                            #     FourierBodyGyroscopeMagnitudeMean = mean(fBodyBodyGyroMag.mean..),
                            #     FourierBodyGyroscopeMagnitudeStdDev = mean(fBodyBodyGyroMag.std..),
                            #     FourierBodyGyroscopeJerkMagnitudeMean = mean(fBodyBodyGyroJerkMag.mean..),
                            #     FourierBodyGyroscopeJerkMagnitudeStdDev = mean(fBodyBodyGyroJerkMag.std..)
                            # )

# Write the output
write.table(subjectActivtySummary, file="subject_activity_summary.txt", sep=",", row.names=FALSE)
