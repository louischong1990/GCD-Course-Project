#Download Data
library(data.table)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists('./Data Science/UCI HAR Dataset.zip')){
  download.file(fileurl,'./Data Science/UCI HAR Dataset.zip', mode = 'wb')
  unzip('./Data Science/UCI HAR Dataset.zip', exdir = getwd())
}

#Read and Convert Data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("S/N","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

#Merge Train and Test sets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
mergeddata <- cbind(Subject, Y, X)

#Extract Mean and Std Dev
library(dplyr)
tidydata <- mergeddata %>% select(subject, code, contains("mean"), contains("std"))

#Name Activities
tidydata$code <- activities[tidydata$code, 2]

#Label Dataset
names(tidydata)[2] = "activity"
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("^f", "Frequency", names(tidydata))
names(tidydata) <- gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata) <- gsub("-std()", "STD", names(tidydata), ignore.case = TRUE)
names(tidydata) <- gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))

#Tidy Dataset
library(dplyr)
finaldata <- tidydata %>% group_by(subject, activity) %>% summarise_all(funs(name = mean))
write.table(finaldata, "finaldata.txt", row.names = FALSE)

str(finaldata)
finaldata
