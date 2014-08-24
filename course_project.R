## Set the working directory to the data location
setwd("/Users/zona/Documents/get_clean_data/course_project/UCI HAR Dataset")

## read in the features.txt
features_df <- read.table("features.txt")

## read in the /test data
x_test_df <- read.table("./test/X_test.txt")

## read in the /test 