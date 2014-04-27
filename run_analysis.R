# Dounload:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Unzip file
# Read README file
# Edit run_analysis.R  script:

# 1. Merges the training and the test sets to create one data set.
# combining data
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X <- rbind(X_train, X_test)

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

Y_train <- read.table("train/y_train.txt")
Y_test <- read.table("test/y_test.txt")
Y <- rbind(Y_train, Y_test)

# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement.

features <- read.table("features.txt")
measures_desired <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, measures_desired]
names(X) <- features[measures_desired, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X)) 

# 3. Uses descriptive activity names to name the activities in the 
# data set

activities_labels <- read.table("activity_labels.txt")
activities_labels[, 2] = gsub("_", "", tolower(as.character(activities_labels[, 2])))
Y[,1] = activities_labels[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(subject) <- "subject"
cleaned <- cbind(subject, Y, X)

# 5. Creates a 2nd, independent tidy data set with the average of each 
# variable for each activity and each subject.

unique_subjects = unique(subject)[,1]
num_subjects = length(unique(subject)[,1])
num_activities = length(activities_labels[,1])
num_cols = dim(cleaned)[2]
result = cleaned[1:(num_subjects*num_activities), ]

row = 1
for (s in 1:num_subjects) {
for (a in 1:num_activities) {
result[row, 1] = unique_subjects[s]
result[row, 2] = activities_labels[a, 2]
tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities_labels[a, 2], ]
result[row, 3:num_cols] <- colMeans(tmp[, 3:num_cols])
row = row+1
}
}
write.table(result, "tidy.txt")
