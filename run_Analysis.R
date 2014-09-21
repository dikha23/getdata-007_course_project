# Read files
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# Activities
Activity <- rbind(y_train, y_test)
Activity <- merge(Activity, activity_labels, by.x = 1, by.y = 1)[,2]

# Subjects
Subject <- rbind(subject_train, subject_test)[,1]

# Measurements
Measurement <- rbind(X_train, X_test)
Measurement <- Measurement[,c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82,
                              83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161,
                              162, 163, 164, 165, 166, 201, 202, 214, 215, 227,
                              228, 240, 241, 253, 254, 266, 267, 268, 269, 270,
                              271, 345, 346, 347, 348, 349, 350, 424, 425, 426,
                              427, 428, 429, 503, 504, 516, 517, 529, 530, 542,
                              543)]
colnames(Measurement) <- c("tBodyAcc_mean_X", "tBodyAcc_mean_Y",
                           "tBodyAcc_mean_Z", "tBodyAcc_std_X",
                           "tBodyAcc_std_Y", "tBodyAcc_std_Z",
                           "tGravityAcc_mean_X", "tGravityAcc_mean_Y",
                           "tGravityAcc_mean_Z", "tGravityAcc_std_X",
                           "tGravityAcc_std_Y", "tGravityAcc_std_Z",
                           "tBodyAccJerk_mean_X", "tBodyAccJerk_mean_Y",
                           "tBodyAccJerk_mean_Z", "tBodyAccJerk_std_X",
                           "tBodyAccJerk_std_Y", "tBodyAccJerk_std_Z",
                           "tBodyGyro_mean_X", "tBodyGyro_mean_Y",
                           "tBodyGyro_mean_Z", "tBodyGyro_std_X",
                           "tBodyGyro_std_Y", "tBodyGyro_std_Z",
                           "tBodyGyroJerk_mean_X", "tBodyGyroJerk_mean_Y",
                           "tBodyGyroJerk_mean_Z", "tBodyGyroJerk_std_X",
                           "tBodyGyroJerk_std_Y", "tBodyGyroJerk_std_Z",
                           "tBodyAccMag_mean", "tBodyAccMag_std",
                           "tGravityAccMag_mean", "tGravityAccMag_std",
                           "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std",
                           "tBodyGyroMag_mean", "tBodyGyroMag_std",
                           "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std",
                           "fBodyAcc_mean_X", "fBodyAcc_mean_Y",
                           "fBodyAcc_mean_Z", "fBodyAcc_std_X",
                           "fBodyAcc_std_Y", "fBodyAcc_std_Z",
                           "fBodyAccJerk_mean_X", "fBodyAccJerk_mean_Y",
                           "fBodyAccJerk_mean_Z", "fBodyAccJerk_std_X",
                           "fBodyAccJerk_std_Y", "fBodyAccJerk_std_Z",
                           "fBodyGyro_mean_X", "fBodyGyro_mean_Y",
                           "fBodyGyro_mean_Z", "fBodyGyro_std_X",
                           "fBodyGyro_std_Y", "fBodyGyro_std_Z",
                           "fBodyAccMag_mean", "fBodyAccMag_std",
                           "fBodyBodyAccJerkMag_mean","fBodyBodyAccJerkMag_std",
                           "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std",
                           "fBodyBodyGyroJerkMag_mean",
                           "fBodyBodyGyroJerkMag_std")

# Create tidy data sets.
tidy1 <- cbind(Subject, Activity, Measurement)
tidy2 <- aggregate(firstTidyDataSet[,-(1:2)],
                               by = firstTidyDataSet[,1:2], FUN = mean)

# Write output
write.table(tidy2, "output.txt", row.names = FALSE)
