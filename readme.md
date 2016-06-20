---
title: "README"
author: "wu-albert"
date: "June 20, 2016"
output: html_document
---

## Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.
Raw data for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Objectives
The R script, `run_analysis.R`, does the following:

1. Download the dataset if it does not already exist in the working directory
   using `download.file()`
2. Load the activity labels and feature variable names with `read.table()` into 
   `activity_labels` and `features`
3. Filter the features variables for only mean or standard deviation data, using     
   `grep(".*mean.*|.*std.*",...)`
4. Clean the feature variable names with `gsub()`
5. Load the mean and std dev observations from training data and test data: 
   - `UCI HAR Dataset/train/X_train.txt`: training data
   - `UCI HAR Dataset/test/X_test.txt`: test data
6. Load the observation labels for activities and subjects:
   - `UCI HAR Dataset/train/Y_train.txt`: activity labels for training data 
   - `UCI HAR Dataset/train/subject_train.txt`: subject labels for training data 
   - `UCI HAR Dataset/test/Y_test.txt`: activity labels for test data 
   - `UCI HAR Dataset/test/subject_test.txt`: subject labels for test data 

7. Merge the datasets using `rbind()`, and add labels using `cbind()`
8. Creates a tidy dataset of all test and training data into a file
   called `mergedata.txt`.
9. Creates a summary dataset of all test and training data average values
   into a file called `summarydata.txt`. Data average is calculated
   using the `melt()` and `dcast()` functions from the `reshape2` package

#### Instructions from Getting and Cleaning Data Coursera class webpage

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - [see](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
