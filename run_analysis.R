## Getting and Cleaning Data Course Project
## This script operates on a data set in the current working directory
## The script will:
## - Merge the training and the test sets to create one data set.
## - Extract only the measurements on the mean and standard deviation for each measurement.
## - Uses descriptive activity names to name the activities in the data set.
## - Labels the data set with the descriptive variable names given by the original 
##   “features.txt” file from the source data download.
## - Create a second, independent tidy data set with the average of each variable for 
##   each activity and each subject.

## first check for "/UCI Har Dataset" directory in working directory
## throw an error if it's not there and halt
if(!file.exists("./UCI Har Dataset")){
        stop("Can't find the </UCI Har Dataset> directory in working directory")
}

## create ouput directory in currentworking directory
if(!file.exists("./output")){dir.create("./output")}

## read in the features labels from the original data set
features_df <- read.table("./UCI HAR Dataset/features.txt", as.is=TRUE)
## remove the non-tidy data characters 
features_df <- gsub("-|\\()|\\(|\\)|\\,", "", features_df[,2])

## read in the activity labels and names from the original data set
activities_df <- read.table("./UCI HAR Dataset/activity_labels.txt", as.is=TRUE)

## read in the test data set from the original data set
test_data_df <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                           col.names=features_df)

## subset the test data, select only mean and std columns
test_data_df <- subset(test_data_df, 
                       select = sort(c(grep('mean', colnames(test_data_df)), 
                                       grep('std', colnames(test_data_df)))))

## read in the test data set activitiy labels from the original data set
test_activities_df <- read.table("./UCI HAR Dataset/test/y_test.txt")

## read in the test data set subjects from the original data set
test_subjects_df <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## bind the test subject labels and test activity labels to the test_data_df data frame
test_data_df <- cbind(test_subjects_df[,1], 
                      test_activities_df[,1], 
                      test_data_df)

## name the new 1st and 2nd columns 
colnames(test_data_df)[1:2] <- c("subject","activity")

## read in the training data from the original data set
train_data_df <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                            col.names=features_df)

## subset the test data, select only mean and std columns
train_data_df <- subset(train_data_df, 
                        select = sort(c(grep('mean', colnames(train_data_df)), 
                                        grep('std', colnames(train_data_df)))))

## read in the training data set activity labels from the original data set
train_activities_df <- read.table("./UCI HAR Dataset/train/y_train.txt")

## read in the training data set subjects from the original data set
train_subjects_df <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## bind the training subject labels and test activity labels to the train_data_df data frame
train_data_df <- cbind(train_subjects_df[,1], 
                       train_activities_df[,1], 
                       train_data_df)

## name the new 1st and 2nd columns 
colnames(train_data_df)[1:2] <- c("subject","activity")

## join the train and test dataframes by row
combined_df <- rbind(test_data_df, train_data_df )

## store the feature names for later use as tidy-variable names for each row
variable_names <- colnames(combined_df[3:length(combined_df)])

## set the activity labels to their descriptive names 
combined_df$activity <- activities_df[combined_df$activity,2]

## uncomment to write combined data sets to file for debugging
## write.table(combined_df, file = "./output/combined_data.txt")

## calculate colMeans by activity for numeric feature data columns
average_by_activity_df <- aggregate(combined_df[3:length(combined_df)], 
                                    combined_df["activity"], 
                                    mean)

## rename the first column
colnames(average_by_activity_df)[1] <- c("observation")

## calculate colMeans by subject for numeric feature data columns
average_by_subject_df <- aggregate(combined_df[3:length(combined_df)],
                                   combined_df["subject"], 
                                   mean)

## rename the first column
colnames(average_by_subject_df)[1] <- c("observation")

## tidy up the subject names
average_by_subject_df[,1] <- paste("subject", average_by_subject_df[,1], sep="")

## combine the two dataframes by row
output2_df <- rbind(average_by_activity_df, average_by_subject_df)

## write averaged data for the combined data to file in ./output
write.table(output2_df, file = "./output/average_by_activity_and_subject.txt", 
            quote = FALSE,
            row.names = FALSE)

## assemble a column list
col_list <- colnames(output2_df)
col_list_df <- cbind(seq(from = 2, to = length(col_list)), 
                     col_list[2:length(col_list)])

## write the column list to file in ./ouput
write.table(col_list_df, file = "./output/variables.txt", 
            quote = FALSE,
            sep = " ",
            row.names = FALSE,
            col.names = FALSE)

## assemble a observation list
obs_list <- output2_df[,1]
obs_list_df <- cbind(seq(1:length(obs_list)), obs_list)

## write the column list to file in ./ouput
write.table(obs_list_df, file = "./output/observations.txt", 
            quote = FALSE,
            sep = " ",
            row.names = FALSE,
            col.names = FALSE)
