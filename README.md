Human-Activity-Recognition-Using-Smartphones-Dataset
====================================================

The instruction list:

1. Step1 - manually download Human Activity Recognition Using Smartphones Dataset from the link 
                  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzipped

2. Step2 - run  R version 3.1.0, read the train and test row files (dosn't include Inertial Signals files) using read.table function

3. Step3 - combine X-train.txt, y-train.txt and subject_train.txt using cbind function (similar to test data)

4. Step4 - merge train data and test data in one data set using merge function with all argment equal TRUE

5. Step5 - read features.txt using read.table function

6. Step6 - rename data set columns with features.txt labels 

7. Step7 - Extract only the measurements on the mean and standard deviation for each measurement using grepl function 
                  with fixed argement equal TRUE

8. Step8 - Create a second, independent tidy data set with the average of each variable for each activity and each subject
                  using aggregate function 

9. Step9 - read activity_labels.txt using read.table function

10. Step10 - Use descriptive activity names to name the activities in the data set using transform function
