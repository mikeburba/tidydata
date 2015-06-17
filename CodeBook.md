# Code Book for *Getting and Cleaning Data*

## Study Design
The raw data used for this study are from the Human Activity Recognition Using Smartphones Dataset[1]. The data was downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped to [UCI HAR Dataset/](./UCI HAR Dataset/).

The goal of this study is to follow the approach outlined by the course project instructions, i.e.:
> You should create one R script called run_analysis.R that does the following. 
> - Merges the training and the test sets to create one data set.
> - Extracts only the measurements on the mean and standard deviation for each measurement. 
> - Uses descriptive activity names to name the activities in the data set
> - Appropriately labels the data set with descriptive variable names. 
> - From the data set in step 4, creates a second, independent *tidy* data set with the average of each variable for each activity and each subject.


## Variables
The variables in this study are derived directly from the features and activities found in the Human Activity Recognition Using Smartphones Dataset[1]. For more information on these measurements and how they were collected, please see the [README.txt](./UCI HAR Dataset/README.txt) and [features_info.txt](./UCI HAR Dataset/features_info.txt). 

We modified the values in the activity dataset (y), by replacing the ids with the descriptive activity labels found in [activity_labels.txt](./UCI HAR Dataset/activity_labels.txt).

Of the features, we extracted the ones that relate to mean and standard deviation. The complete list of features that we extracted can be found in [features_mean_sd.txt](./features_mean_sd.txt).

These measurements from the initial dataset were grouped by activity and subject, and then summarized by their mean. So the variable names in the final output represent the mean of each measuremnt, aggreated by activity and subject. 
=========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012