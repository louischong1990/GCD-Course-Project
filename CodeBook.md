The run_analysis.R script prepares the data and perform the analysis as follows.

1. Download the dataset
    - Dataset downloaded and extracted under the folder called UCI HAR Dataset

2. Read data and assign to variables
    - features <- features.txt : 561 rows, 2 columns (from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ)
    - activities <- activity_labels.txt : 6 rows, 2 columns (carried out when the corresponding measurements were taken and their codes)
    - subject_train <- train/subject_train.txt : 7352 rows, 1 column (train data of 21/30 volunteer subjects being observed)
    - x_train <- train/X_train.txt : 7352 rows, 561 columns (recorded features train data)
    - y_train <- train/y_train.txt : 7352 rows, 1 columns (train data of activities’ code labels)
    - subject_test <- test/subject_test.txt : 2947 rows, 1 column (test data of 9/30 volunteer test subjects being observed)
    - x_test <- test/X_test.txt : 2947 rows, 561 columns (recorded features test data)
    - y_test <- test/y_test.txt : 2947 rows, 1 columns (test data of activities’ code labels)

3. Merges training and test sets to create one data set
    - X : 10299 rows, 561 columns (merging x_train and x_test using rbind())
    - Y: 10299 rows, 1 column (merging y_train and y_test using rbind())
    - Subject: 10299 rows, 1 column (merging subject_train and subject_test using rbind())
    - mergeddata: 10299 rows, 563 column (merging Subject, Y and X using cbind())

4. Extracts only the measurements on the mean and standard deviation for each measurement
    - tidydata: 10299 rows, 88 columns (subsetting mergeddata, selecting only columns for subject, code and measurements on mean and standard deviation)

5. Uses descriptive activity names to name the activities in the data set
    - Numbers in code column of tidydata replaced with corresponding activity taken from second column of the activities variable

6. Appropriately labels the data set with descriptive variable names
    - code column in tidydata renamed into activity
    - All Acc in column’s name replaced by Accelerometer
    - All Gyro in column’s name replaced by Gyroscope
    - All Mag in column’s name replaced by Magnitude
    - All start with character t in column’s name replaced by Time
    - All start with character f in column’s name replaced by Frequency
    - All -mean() in column’s name replaced by Mean
    - All -std() in column’s name replaced by STD
    - All -freq() in column’s name replaced by Frequency
    - All BodyBody in column’s name replaced by Body

7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
    - finaldata: 180 rows, 88 columns (grouping tidydata by subject and activity, summarizing and taking the mean of each variable for each activity and each subject)
    - Export finaldata into finaldata.txt file
