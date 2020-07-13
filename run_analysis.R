#Peer-graded Assignment: Getting and cleaning Data Course Project

#Finding and Setting directory
getwd()
setwd("/Users/parulpuri/Desktop/Online Courses/UCI HAR Dataset")

#Installng and Loading package for data manipulation
install.packages("dplyr")
library(dplyr)

#Reading the data frames into R
features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_testing <- read.table("test/subject_test.txt", col.names = "subject")
x_testing <- read.table("test/X_test.txt", col.names = features$functions)
y_testing <- read.table("test/y_test.txt", col.names = "code")
subject_training <- read.table("train/subject_train.txt", col.names = "subject")
x_training <- read.table("train/X_train.txt", col.names = features$functions)
y_training <- read.table("train/y_train.txt", col.names = "code")

##Assignment: Getting and cleaning Data Course Project
#1: Merging testing and training data set into one
X <- rbind(x_training, x_testing)
Y <- rbind(y_training, y_testing)
Subject <- rbind(subject_training, subject_testing)
Merge_data <- cbind(Subject, Y, X)

#2: Extracting measurements on the mean and standard deviation for each measurement
Tidydata <- Merge_data %>% 
  select(subject, code, contains("mean"), contains("std"))

#3: Descriptive activity names to name the activities in the data set
Tidydata$code <- activities[Tidydata$code, 2]

#4: Labeling the dataset with descriptive variable names
names(Tidydata)[2] = "activity"
names(Tidydata)<-gsub("Acc", "Accelerometer", names(Tidydata))
names(Tidydata)<-gsub("Gyro", "Gyroscope", names(Tidydata))
names(Tidydata)<-gsub("BodyBody", "Body", names(Tidydata))
names(Tidydata)<-gsub("Mag", "Magnitude", names(Tidydata))
names(Tidydata)<-gsub("^t", "Time", names(Tidydata))
names(Tidydata)<-gsub("^f", "Frequency", names(Tidydata))
names(Tidydata)<-gsub("tBody", "TimeBody", names(Tidydata))
names(Tidydata)<-gsub("-mean()", "Mean", names(Tidydata), ignore.case = TRUE)
names(Tidydata)<-gsub("-std()", "STD", names(Tidydata), ignore.case = TRUE)
names(Tidydata)<-gsub("-freq()", "Frequency", names(Tidydata), ignore.case = TRUE)
names(Tidydata)<-gsub("angle", "Angle", names(Tidydata))
names(Tidydata)<-gsub("gravity", "Gravity", names(Tidydata))

#5: Creating second dataset from last created dataset
Final_data <- Tidydata %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(Final_data, "Final_data.txt", row.name=FALSE)

str(Final_data)
View(Final_data)
Final_data
