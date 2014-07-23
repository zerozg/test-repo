run_analysis <- function(){
        Train_X_Data <- read.table("UCI HAR Dataset/train/X_train.txt")
        Train_y_Data <- read.table("UCI HAR Dataset/train/y_train.txt")
        Train_subject_Data <- read.table("UCI HAR Dataset/train/subject_train.txt")
        names(Train_y_Data) <- "activity"
        names(Train_subject_Data) <- "subject"
        
        Test_X_Data <- read.table("UCI HAR Dataset/test/X_test.txt")
        Test_y_Data <- read.table("UCI HAR Dataset/test/y_test.txt")
        Test_subject_Data <- read.table("UCI HAR Dataset/test/subject_test.txt")
        names(Test_y_Data) <- "activity"
        names(Test_subject_Data) <- "subject"
        
        heads <- read.table("UCI HAR Dataset/features.txt")
        
        Train_Data <- cbind(Train_X_Data, Train_y_Data, Train_subject_Data)
        Test_Data <- cbind(Test_X_Data, Test_y_Data, Test_subject_Data)
        
        data <- merge(Train_Data, Test_Data, all = TRUE)
        names(data) <- heads$V2
        names(data)[562] <- "activity"
        names(data)[563] <- "subject"
        
        goodmean <- grepl("mean()", names(data), fixed = TRUE)
        goodstd <- grepl("std()", names(data), fixed = TRUE)
        
        data <- cbind(data[names(data[, goodmean])], data[names(data[, goodstd])], data["activity"], data["subject"])
        
        data <- aggregate(data, list(data$subject, data$activity), mean)
        data <- subset(data, select = c(-activity, - subject))
        names(data)[1] <- "activity"
        names(data)[2] <- "subject"
        ac <- read.table("UCI HAR Dataset/activity_labels.txt")
        data <- transform(data, activity= ac$V2)
        write.table(data, file = "MyData.txt")
}