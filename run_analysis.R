##
## Setup data files
##

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Proj_Dataset.zip",method="curl")
unzip("Proj_Dataset.zip")
setwd("UCI HAR Dataset")

##
## Read tables and label columns
##

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("Activity.Code","Activity")

x_test <- read.table("test/X_test.txt")
colnames(x_test) <- features[,2]

y_test <- read.table("test/y_test.txt")
colnames(y_test) <- c("Activity.Code")

subject_test <- read.table("test/subject_test.txt")
colnames(subject_test) <- c("Subject")

x_train <- read.table("train/X_train.txt")
colnames(x_train) <- features[,2]

y_train <- read.table("train/y_train.txt")
colnames(y_train) <- c("Activity.Code")

subject_train <- read.table("train/subject_train.txt")
colnames(subject_train) <- c("Subject")

##
## Eliminate unnecessary variables (all measures that are not mean or std)
##

x_test <- x_test[, grepl("mean\\(",colnames(x_test)) | grepl("std\\(",colnames(x_test))]
x_train <- x_train[, grepl("mean\\(",colnames(x_train)) | grepl("std\\(",colnames(x_train))]

##
## Merge tables into one dataset
##

test_set <- cbind(subject_test,merge(y_test,activities,by="Activity.Code"),x_test)
train_set <- cbind(subject_train,merge(y_train,activities,by="Activity.Code"),x_train)
total_set <- rbind(test_set,train_set)
total_set <- subset(total_set,select=-Activity.Code)

##
## Create tidy dataset
##

tidy_set <- aggregate(total_set[,3:68],by=list(total_set$Subject,total_set$Activity),FUN=mean)
colnames(tidy_set) <- c("Subject","Activity",colnames(tidy_set[,3:68]))
tidy_set <- tidy_set[order(tidy_set$Activity,tidy_set$Subject),]
tidy_set <- tidy_set[,c(2,1,3:68)]

##
## Export tidy dataset to text file
##

setwd("..")
write.table(tidy_set,"TidyDataSet.txt",row.names = FALSE)

