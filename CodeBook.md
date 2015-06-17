# Code Book for *Getting and Cleaning Data*

## Study Design
The raw data used for this study are from the Human Activity Recognition Using Smartphones Dataset[1]. The data was downloaded from: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The goal of this study is to follow the approach outlined by the course project instructions, i.e.:
> You should create one R script called run_analysis.R that does the following. 
> - Merges the training and the test sets to create one data set.
> - Extracts only the measurements on the mean and standard deviation for each measurement. 
> - Uses descriptive activity names to name the activities in the data set
> - Appropriately labels the data set with descriptive variable names. 
> - From the data set in step 4, creates a second, independent *tidy* data set with the average of each variable for each activity and each subject.

To achieve the tidy output data requested in step 5, we modified the order of the steps outlined in the course project. The complete steps followed can be found in [run_analysis.R](./run_analysis.R); a summary follows here.

First, we load X test and train sets, which contain the measurements for the dataset, and combine them.

Second, we read in the labels for the measurements from the features.txt that is included in the dataset. These are appropriately descriptive labels for the variables in the X dataset, so we add them as the names of the columns.

Third, we find all feature labels that have mean and sd measurements. We filter the X data to extract only measurements that have the mean and sd features.

Fourth, we load the y dataset, which contains activity ids which correspond to the labels in activities.txt. We replace the activity ids with the more descriptive activity labels.

Fifth, we load the subject dataset, and then merge the X, the y, and the subject data base into a single, tidy dataset.

Finally, we arrange the dataset by activity and subject, then find the mean of each measurement for each activity / subject pair. The result is a tidy dataset that we write to [feature_averages.txt](./feature_averages.txt).

## Variables
The variables in this study are derived directly from the features and activities found in the Human Activity Recognition Using Smartphones Dataset. For more information on the features and the activities in the dataset, please see the README.txt in the Human Acivity Using Smartphones Dataset. 

Of these measures, the ones that relate to mean and standard deviation were extracted. The list of features that were used can be found in [features_mean_sd.txt](./features_mean_sd.txt). Then, these measurements were grouped by subject and activity, and then were summarized by the mean. 

=========

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012