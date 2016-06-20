## 
library(plyr)

#### Merges the training and the test sets to create one data set.
##
## 1. Download the dataset if it does not already exist in the 
## working directory
##
filename <- "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

## 2. Load the activity labels and feature variable names
##
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## 3. Filter the features variables for only mean or standard deviation data
##
featuresIndex <- grep(".*mean.*|.*std.*", features[,2])
featuresIndex.names <- features[featuresIndex,2]

## 4. Clean the feature variable names
##
featuresIndex.names = gsub('-mean', 'Mean', featuresIndex.names)
featuresIndex.names = gsub('-std', 'Std', featuresIndex.names)
featuresIndex.names <- gsub('[-()]', '', featuresIndex.names)

## 5. Load the mean and std dev observations from training data 
## and test data
##
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresIndex]
testData <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresIndex]

## 6. Load the observation labels for activities and subjects
##
trainActivity <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testActivity <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## 7. Merge the datasets and add labels
##
train <- cbind(trainSubject, trainActivity, trainData)
test <- cbind(testSubject, testActivity, testData)
result <- rbind(train, test)

colnames(result) <- c("subject", "activity", featuresIndex.names)
result$activity <- factor(result$activity, 
                          levels = activity_labels[,1], 
                          labels = activity_labels[,2])
result$subject <- as.factor(result$subject)
## dim(result) = 10299 rows, 81 columns

## 8. Creates a tidy dataset of all test and training data
##
write.table(result, "mergedata.txt", row.names = FALSE, quote = FALSE)

## 9. Creates a summary dataset of all test and training data 
## average values
##
library(reshape2)
result.melted <- melt(result, id = c("subject", "activity"))
result.mean <- dcast(result.melted, subject + activity ~ variable, mean)
write.table(result.mean, "avgdata.txt", row.names = FALSE, quote = FALSE)