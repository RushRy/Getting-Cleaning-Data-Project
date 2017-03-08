library(dplyr)

# Check if data directory exists; create it if not
dataDirectory <- "./UCI HAR Dataset"

# Get Supporting Data
featureLabels <- read.table(
                      paste(dataDirectory,"features.txt", sep="/")
                    , sep = " "
                    , col.names = c("id", "featurename")
                    , as.is = TRUE
                    )
activityLabels <- read.table(
                          file = paste(dataDirectory,"activity_labels.txt", sep="/")
                        , sep = " "
                        , col.names = c("id","activityname")
                        )

# Get Test Data
testDataSRC <- read.fwf(
                  paste(dataDirectory,"test","X_test.txt",sep="/")
                , widths = rep(16,561)
                , col.names = featureLabels$featurename
                , n=1000
                )
testData <- testDataSRC[,grepl("\\.mean\\.\\.|\\.std\\.\\.", names(testDataSRC))]

subjects <- read.fwf(
                  paste(dataDirectory,"test","subject_test.txt",sep="/")
                , widths = 16
                , col.names = c("subjectid")
                , n=1000
                )
testLabels <- read.fwf(
                  paste(dataDirectory,"test","y_test.txt",sep="/")
                , widths = 16
                , col.names = c("id")
                , n=1000
                ) %>%
            inner_join(activityLabels, by="id")

testData <- testLabels %>% select(activityname) %>% bind_cols(subjects, testData)

# Get Training Data
trainDataSRC <- read.fwf(
                  paste(dataDirectory,"train","X_train.txt",sep="/")
                , widths = rep(16,561)
                , col.names = featureLabels$featurename
                , n=1000
                )
trainData <- trainDataSRC[,grepl("\\.mean\\.\\.|\\.std\\.\\.", names(trainDataSRC))]

subjects <- read.fwf(
                  paste(dataDirectory,"test","subject_test.txt",sep="/")
                , widths = 16
                , col.names = c("subjectid")
                , n=1000
                )
trainLabels <- read.fwf(
                  paste(dataDirectory,"test","y_test.txt",sep="/")
                , widths = 16
                , col.names = c("id")
                , n=1000
                ) %>%
            inner_join(activityLabels, by="id")

trainData <- trainLabels %>% select(activityname) %>% bind_cols(subjects, trainData)


# Combine Data Sets
allData <- testData %>% bind_rows(trainData)

# Cleanup Variable Names
names(allData) <- tolower(names(allData))
names(allData) <- gsub("\\.","", names(allData))

# Create summary of data set for each activity and subject
subjectActivtySummary <- allData %>%
                            group_by(subjectid, activityname) %>%
                            summarize_all(mean)

