This file describes at detailed level how each step in the run_analysis.R script works:

###### step-1: merges the training and the test sets to form a new dataset
- the main objective of step 1 is to combine dataset from the train and test dataset.
- the train data is divided into three files:
     - X_train.txt
     - y_train.txt
     - subject_train.txt
- the test data is divided into three files:
     - X_test.txt
     - y_test.txt
     - subject_test.txt
- there are all together 30 subjects in the research work.
- to read the text files, the command read.table() is used.
- the combineData variable has a dimension of 10299 x 561.
- the combineLabel variable has a dimension of 10299 x 1.
- the combineSubject variable has a dimension of 10299 x 1.
- make sure that the working directory is set correctly and the working folder name for the dateset is "dataset".

###### step-2: Extracts only the measurements on the mean and standard deviation for each measurement.

- the main objective of this step is to extract features with the word "mean" and "std" only.
- the functions used to do the extractions are "grep" and "gsub".
- the first task is to read the features.txt file.
- the selected features are stored in featureSelected variable.

###### Step-3: Uses descriptive activity names to name the activities in the data set

- the main objective of this step is to map the activity labels to their actual activity names.
- the activity labels are stored in the file named activity_labels.txt
- the activity label are then replaced into combineLabel.

###### Step-4tep-4: Appropriately labels the data set with descriptive variable names. 

- the main objective of this step is to name the column names correctly.
- there are three main renaming tasks; one to each combined data, namely, combineData_feature, combineLabel, combineSubject.

###### Step-5: From the data set in step 4, creates an ndependent tidy data set with the average of each variable for each activity and each subject.

- the last step is to get the aggregated information from the combined dataset.
- use data.table approach
- finally, the output of step 5 is a file named "tidyDataSet.txt"


