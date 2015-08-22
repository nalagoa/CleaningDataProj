#
# Getting and Cleaning Data - Course Project - 2015.08.22
#

1) Script description

The script should be executed from the same directory where the data was unzipped, as it's stated on the assignment that the data is already in place (if it's not you can uncomment the first 2 lines of code, which perform de zip download and the unzipping).

The script starts by reading all the necessary files into separate data frames.

The file features.txt is used to label the columns of the data frames holding results from the test and training sessions.
The remaining data frames (holding the subjects and holding the actvities and activity codes), have their columns labeled manually (without recurring to any other file).

After all the data frames have names assigned to all the variables, it's time to eliminate all the variables of the test and training data frames, that have not means or standard deviations as a result.
This implied mantaining only variables with one of the following strings on their names: "mean(" "std(". This means that variables like "angle(X,gravityMean)" were also eliminated since despite having the word "Mean" on its name, this variable its in fact the angle between 2 vectors (being one the Mean).

With the data frames "trimmed" it's time to merge them into one big data frame.
The first step is to merge (by columns) the test subjects, test activities and test results (already without unnecessary variables), and then the same type of operation for the training data.
Now we merge (by rows) the test and training data into a unique big data frame, and remove the column of Activity Code as we have the Activity column itself.

The next step is to transform the big data frame into a tidy data set that includes the average of each variable for each activity and each subject.
To do so the script aggregates by activity and subject, the mean of every other column.
For improved readability the data is ordered by Activity and Subject.

The final step is to write the tidy data to a text file named "TidyDataSet.txt".


2) Code book

This data set consists of 40 observations of the following 68 variables.

'Activity' -> Activity performed
'Subject' -> Subject that performed the activity
'tBodyAcc-mean()-X' -> The average of the means of all observations of body acceleration on the X-axis for the pair (Activity,Subject)
'tBodyAcc-mean()-Y' -> The average of the means of all observations of body acceleration on the Y-axis for the pair (Activity,Subject)
'tBodyAcc-mean()-Z' -> The average of the means of all observations of body acceleration on the Z-axis for the pair (Activity,Subject)
'tBodyAcc-std()-X' -> The average of the standard deviations of all observations of body acceleration on the X-axis for the pair (Activity,Subject)
'tBodyAcc-std()-Y' -> The average of the standard deviations of all observations of body acceleration on the Y-axis for the pair (Activity,Subject)
'tBodyAcc-std()-Z' -> The average of the standard deviations of all observations of body acceleration on the Z-axis for the pair (Activity,Subject)
'tGravityAcc-mean()-X' -> The average of the means of all observations of gravity acceleration on the X-axis for the pair (Activity,Subject)
'tGravityAcc-mean()-Y' -> The average of the means of all observations of gravity acceleration on the Y-axis for the pair (Activity,Subject)
'tGravityAcc-mean()-Z' -> The average of the means of all observations of gravity acceleration on the Z-axis for the pair (Activity,Subject)
'tGravityAcc-std()-X' -> The average of the standard deviations of all observations of gravity acceleration on the X-axis for the pair (Activity,Subject)
'tGravityAcc-std()-Y' -> The average of the standard deviations of all observations of gravity acceleration on the Y-axis for the pair (Activity,Subject)
'tGravityAcc-std()-Z' -> The average of the standard deviations of all observations of gravity acceleration on the Z-axis for the pair (Activity,Subject)
'tBodyAccJerk-mean()-X' -> The average of the means of all observations of body linear acceleration derived over time (Jerk signals) on the X-axis for the pair (Activity,Subject)
'tBodyAccJerk-mean()-Y' -> The average of the means of all observations of body linear acceleration derived over time (Jerk signals) on the Y-axis for the pair (Activity,Subject)
'tBodyAccJerk-mean()-Z' -> The average of the means of all observations of body linear acceleration derived over time (Jerk signals) on the Z-axis for the pair (Activity,Subject)
'tBodyAccJerk-std()-X' -> The average of the standard deviations of all observations of body linear acceleration derived over time (Jerk signals) on the X-axis for the pair (Activity,Subject)
'tBodyAccJerk-std()-Y' -> The average of the standard deviations of all observations of body linear acceleration derived over time (Jerk signals) on the Y-axis for the pair (Activity,Subject)
'tBodyAccJerk-std()-Z' -> The average of the standard deviations of all observations of body linear acceleration derived over time (Jerk signals) on the Z-axis for the pair (Activity,Subject)
'tBodyGyro-mean()-X' -> The average of the means of all observations of body angular velocity on the X-axis for the pair (Activity,Subject)
'tBodyGyro-mean()-Y' -> The average of the means of all observations of body angular velocity on the Y-axis for the pair (Activity,Subject)
'tBodyGyro-mean()-Z' -> The average of the means of all observations of body angular velocity on the Z-axis for the pair (Activity,Subject)
'tBodyGyro-std()-X' -> The average of the standard deviations of all observations of body angular velocity on the X-axis for the pair (Activity,Subject)
'tBodyGyro-std()-Y' -> The average of the standard deviations of all observations of body angular velocity on the Y-axis for the pair (Activity,Subject)
'tBodyGyro-std()-Z' -> The average of the standard deviations of all observations of body angular velocity on the Z-axis for the pair (Activity,Subject)
'tBodyGyroJerk-mean()-X' -> The average of the means of all observations of body angular velocity derived over time (Jerk signals) on the X-axis for the pair (Activity,Subject)
'tBodyGyroJerk-mean()-Y' -> The average of the means of all observations of body angular velocity derived over time (Jerk signals) on the Y-axis for the pair (Activity,Subject)
'tBodyGyroJerk-mean()-Z' -> The average of the means of all observations of body angular velocity derived over time (Jerk signals) on the Z-axis for the pair (Activity,Subject)
'tBodyGyroJerk-std()-X' -> The average of the standard deviations of all observations of body angular velocity derived over time (Jerk signals) on the X-axis for the pair (Activity,Subject)
'tBodyGyroJerk-std()-Y' -> The average of the standard deviations of all observations of body angular velocity derived over time (Jerk signals) on the Y-axis for the pair (Activity,Subject)
'tBodyGyroJerk-std()-Z' -> The average of the standard deviations of all observations of body angular velocity derived over time (Jerk signals) on the Z-axis for the pair (Activity,Subject)
'tBodyAccMag-mean()' -> The average of the means of all observations of body acceleration magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyAccMag-std()' -> The average of the standard deviations of all observations of body acceleration magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tGravityAccMag-mean()' -> The average of the means of all observations of gravity acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tGravityAccMag-std()' -> The average of the standard deviations of all observations of gravity acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyAccJerkMag-mean()' -> The average of the means of all observations of body acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyAccJerkMag-std()' -> The average of the standard deviations of all observations of body acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyGyroMag-mean()' -> The average of the means of all observations of body angular velocity magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyGyroMag-std()' -> The average of the standard deviations of all observations of body angular velocity magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyGyroJerkMag-mean()' -> The average of the means of all observations of body angular velocity derived over time (Jerk signals) magnitude (using Euclidean norm) for the pair (Activity,Subject)
'tBodyGyroJerkMag-std()' -> The average of the standard deviations of all observations of body angular velocity derived over time (Jerk signals) magnitude (using Euclidean norm) for the pair (Activity,Subject)
'fBodyAcc-mean()-X' -> The average of the means of all observations of body acceleration applying FFT on the X-axis for the pair (Activity,Subject)
'fBodyAcc-mean()-Y' -> The average of the means of all observations of body acceleration applying FFT on the Y-axis for the pair (Activity,Subject)
'fBodyAcc-mean()-Z' -> The average of the means of all observations of body acceleration applying FFT on the Z-axis for the pair (Activity,Subject)
'fBodyAcc-std()-X' -> The average of the standard deviations of all observations of body acceleration applying FFT on the X-axis for the pair (Activity,Subject)
'fBodyAcc-std()-Y' -> The average of the standard deviations of all observations of body acceleration applying FFT on the Y-axis for the pair (Activity,Subject)
'fBodyAcc-std()-Z' -> The average of the standard deviations of all observations of body acceleration applying FFT on the Z-axis for the pair (Activity,Subject)
'fBodyAccJerk-mean()-X' -> The average of the means of all observations of body linear acceleration derived over time (Jerk signals) applying FFT on the X-axis for the pair (Activity,Subject)
'fBodyAccJerk-mean()-Y' -> The average of the means of all observations of body linear acceleration derived over time (Jerk signals) applying FFT on the Y-axis for the pair (Activity,Subject)
'fBodyAccJerk-mean()-Z' -> The average of the means of all observations of body linear acceleration derived over time (Jerk signals) applying FFT on the Z-axis for the pair (Activity,Subject)
'fBodyAccJerk-std()-X' -> The average of the standard deviations of all observations of body linear acceleration derived over time (Jerk signals) applying FFT on the X-axis for the pair (Activity,Subject)
'fBodyAccJerk-std()-Y' -> The average of the standard deviations of all observations of body linear acceleration derived over time (Jerk signals) applying FFT on the Y-axis for the pair (Activity,Subject)
'fBodyAccJerk-std()-Z' -> The average of the standard deviations of all observations of body linear acceleration derived over time (Jerk signals) applying FFT on the Z-axis for the pair (Activity,Subject)
'fBodyGyro-mean()-X' -> The average of the means of all observations of body angular velocity applying FFT on the X-axis for the pair (Activity,Subject)
'fBodyGyro-mean()-Y' -> The average of the means of all observations of body angular velocity applying FFT on the Y-axis for the pair (Activity,Subject)
'fBodyGyro-mean()-Z' -> The average of the means of all observations of body angular velocity applying FFT on the Z-axis for the pair (Activity,Subject)
'fBodyGyro-std()-X' -> The average of the standard deviations of all observations of body angular velocity applying FFT on the X-axis for the pair (Activity,Subject)
'fBodyGyro-std()-Y' -> The average of the standard deviations of all observations of body angular velocity applying FFT on the Y-axis for the pair (Activity,Subject)
'fBodyGyro-std()-Z' -> The average of the standard deviations of all observations of body angular velocity applying FFT on the Z-axis for the pair (Activity,Subject)
'fBodyAccMag-mean()' -> The average of the means of all observations of body acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyAccMag-std()' -> The average of the standard deviations of all observations of body acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyBodyAccJerkMag-mean()' -> The average of the means of all observations of body acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyBodyAccJerkMag-std()' -> The average of the standard deviations of all observations of body acceleration derived over time (Jerk signals) magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyBodyGyroMag-mean()' -> The average of the means of all observations of body angular velocity magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyBodyGyroMag-std()' -> The average of the standard deviations of all observations of body angular velocity magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyBodyGyroJerkMag-mean()' -> The average of the means of all observations of body angular velocity derived over time (Jerk signals) magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)
'fBodyBodyGyroJerkMag-std()' -> The average of the standard deviations of all observations of body angular velocity derived over time (Jerk signals) magnitude (using Euclidean norm) applying FFT for the pair (Activity,Subject)


