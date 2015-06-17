# run_analysis is a function that:
# 1. Loads the UCI HAR Dataset 
# 2. Filters the measures that are mean or sd measures
# 3. Groups the data by activity and subject
# 4. Computes the mean of each filtered measure
# 5. Outputs the result in a tidy data set
#
# Project Instructions:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#
# NOTE: I did not follow the project instrcutions step-by-step, as I found it simpler
# to do them out of order
run_analysis <- function() {
  # since we are using the dplyr library, load it as the first step
  library(dplyr)
  
  # 1. Merges the training and the test sets to create one data set.
  # Start by merging the X data. To simplify processing, I am going to
  # wait to merge the y and subject data
  X_test  <- read.table("X_test.txt")
  X_train <- read.table("X_train.txt")
  X <- rbind(X_train, X_test)
  
  # 4. Appropriately labels the data set with descriptive variable names. 
  # This is out of order to make processing more simple. I'm using the 
  # features in the data set as my column labels
  features <- read.table("features.txt", stringsAsFactors=F)
  features <- dplyr::rename(features, idx=V1, feature=V2)
  names(X) <- features$feature
  
  # 2. Extracts only the measurements on the mean and standard deviation 
  # for each measurement. 
  # I used grepl to find all features that have mean() or std() in them
  features_mean_sd <- features %>% filter(grepl("mean()|std()",feature))
  # Write the table of the feautres selected for documentation
  write.table(features_mean_sd, "features_mean_sd.txt", row.name=F)
  
  # Do a simple subset to trim all variables that are not mean / sd features
  X <- X[,features_mean_sd$idx]
  
  # 3. Uses descriptive activity names to name the activities in the data set 
  # Now I need to load the y (activity data)
  y_test  <- read.table("y_test.txt")
  y_train <- read.table("y_train.txt")
  y <- rbind(y_train, y_test)

  # I'm using the activity labels in the data set as the decriptions for the activity
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=F)
  # First add the labels as a new column in y, then select only that column, effectively replacing
  # the activity ids with their labels
  y <- y %>% mutate(activity=activities[V1,2]) %>% select(activity)

  # 5. From the data set in step 4, creates a second, independent tidy data set with the 
  # average of each variable for each activity and each subject.  
  # Finally, load the subject data
  s_test  <- read.table("subject_test.txt")
  s_train <- read.table("subject_train.txt")
  s <- rbind(s_train, s_test)
  
  # rename the column to make it more readable
  s <- dplyr::rename(s, subject=V1) 
  
  # merge the X, y, and subject data into a single data set
  data <- cbind(X,y,s)
  
  # aggregate the data by activity & subject, and take the mean of each measure
  aggregated <- aggregate(data[,1:nrow(features_mean_sd)], by=list(activity=data$activity, subject=data$subject), mean)
  
  # finally write out the tidy data output
  write.table(aggregated, "feature_averages.txt", row.name=F)
}