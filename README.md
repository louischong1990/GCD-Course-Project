# Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is the submission for the course project.

# Dataset

The dataset (Human Action Recognition Using Smartphones) is extracted from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Files

CodeBook.md
- Code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

run_analysis.R
- Script to prepare data and perform analysis as follows:
    + Merges the training and the test sets to create one data set
    + Extracts only the measurements on the mean and standard deviation for each measurement
    + Uses descriptive activity names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names
    + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

finaldata.txt
- Output of tidy dataset from run_analysis.R
