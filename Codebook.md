---
output:
  pdf_document: default
  html_document: default
---
**CodeBook**

*The repository consists of 1) R script: run_analysis.R script (containing the 5 steps to cleaning data into tidy), 2) README.md file and 3) Codebook.md*

**1. Download the dataset**

Dataset downloaded and extracted under the folder called [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

**2. Assign each data to variables**

1. features <- features.txt : 561 rows, 2 columns 
*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ*

2. activities <- activity_labels.txt : 6 rows, 2 columns 
*List of activities performed when the corresponding measurements were taken and its codes (labels)*

2. subject_testing <- test/subject_test.txt : 2947 rows, 1 column 
*contains test data of 9/30 volunteer test subjects being observed*

3. x_testing <- test/X_test.txt : 2947 rows, 561 columns 
*contains recorded features test data*

4. y_testing <- test/y_test.txt : 2947 rows, 1 columns 
*contains test data of activities’code labels*

5. subject_training <- test/subject_train.txt : 7352 rows, 1 column 
*contains train data of 21/30 volunteer subjects being observed*

6. x_training <- test/X_train.txt : 7352 rows, 561 columns 
*contains recorded features train data*

7. y_trainig <- test/y_train.txt : 7352 rows, 1 columns 
*contains train data of activities’code labels*

**3. Merging testing and training data set into one**

1. X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function

2. Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function

3. Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

4. Merge_data (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

**4. Extracting measurements on the mean and standard deviation for each measurement**

Tidydata (10299 rows, 88 columns) is created by subsetting Merge_data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

**5. Descriptive activity names to name the activities in the data set**

Entire numbers in code column of the Tidydata replaced with corresponding activity taken from second column of the activities variable

**6. Labeling the dataset with descriptive variable name**

1. All Acc in column’s name replaced by Accelerometer

2. All Gyro in column’s name replaced by Gyroscope

3. All BodyBody in column’s name replaced by Body

4. All Mag in column’s name replaced by Magnitude

5. All start with character f in column’s name replaced by Frequency

6. All start with character t in column’s name replaced by Time

**7. Creating second dataset from last created dataset**

1. *Final_data (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity*

2. *Export Final_data into Final_data.txt file*