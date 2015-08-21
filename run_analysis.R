# step-1: merges the training and the test sets to form a new dataset

# setwd("C:/datascience/module_3/assignment")

trainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

combineData <- rbind(trainData, testData)
combineLabel <- rbind(trainLabel, testLabel)
combineSubject <- rbind(trainSubject, testSubject)

#step-2: Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./data/UCI HAR Dataset/features.txt")
featureSelected <- features[grep("mean|std",features$V2),]
combineData_feature <- combineData[,featureSelected$V1]
featureSelected <- gsub("\\(\\)","",featureSelected$V2)
featureSelected <- gsub("-","",featureSelected)
featureSelected <- gsub("mean","Mean",featureSelected)
featureSelected <- gsub("std","Std",featureSelected)

# Step-3: Uses descriptive activity names to name the activities in the data set

activity <-read.table("./data/UCI HAR Dataset/activity_labels.txt")
activityLabel <- activity[combineLabel[,1],2]   
combineLabel[,1] <- activityLabel

# Step-4: Appropriately labels the data set with descriptive variable names. 

names(combineData_feature) <- featureSelected
names(combineLabel) <- "activity"
names(combineSubject) <- "Subject"

cleanData <- cbind(combineSubject, combineLabel, combineData_feature)

# Step-5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#-------------------data.table------------------------
library(data.table)
cleanData<-data.table(cleanData)
tidyDataAverage<-cleanData[, lapply(.SD, mean), by="Subject,activity"]   #.SD = sub data
write.table(tidyDataAverage,"tidyDataSet.txt", row.name=FALSE)
#------------------------------------------------------

