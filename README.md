getdata-006
===========

Getting and Cleaning Data Course Project

The source data for this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained, and is also included in the data set text files.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Downlaod original data set at the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R script called run_analysis.R will do the following:
  - Merge the training and the test sets to create one data set.
  - Extract only the measurements on the mean and standard deviation for each measurement. 
  - Uses descriptive activity names to name the activities in the data set.
  - Labels the data set with the descriptive variable names given by the original “features.txt” file from the source data download.
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Steps to reproduce the output.

1. Create a working directory to store the expanded source data, run_analysis.R, and the output tidy data set.
2. Download "getdata-projectfiles-UCI HAR Dataset.zip" from the repository to the working directory and expand the zip file. The resulting file structure must be unchanged for run_analysis.R to function correctly.
3. Copy run_analysis.R from this git repository to the working directory.
4. Open R console and setwd(“working directory”)
5. source("run_analysis.R")
6. 2 files will be written to ./output directory
	- features.txt
	- average_by_activity_and_subject.txt
	

Code Book: features.txt

This file is a list of the average mean and standard deviation variable names in row order, as found in the unlabeled rows of average_by_activity_and_subject.txt, 

rows - observations
columns - variables (measurements)

Code Book: average_by_activity_and_subject.txt

This file contains the average mean and standard deviation for each feature in the original data set.

average_by_activity_and_subject.txt contains the following variables, listed by column number.

2 tBodyAccmeanX
3 tBodyAccmeanY
4 tBodyAccmeanZ
5 tBodyAccstdX
6 tBodyAccstdY
7 tBodyAccstdZ
8 tGravityAccmeanX
9 tGravityAccmeanY
10 tGravityAccmeanZ
11 tGravityAccstdX
12 tGravityAccstdY
13 tGravityAccstdZ
14 tBodyAccJerkmeanX
15 tBodyAccJerkmeanY
16 tBodyAccJerkmeanZ
17 tBodyAccJerkstdX
18 tBodyAccJerkstdY
19 tBodyAccJerkstdZ
20 tBodyGyromeanX
21 tBodyGyromeanY
22 tBodyGyromeanZ
23 tBodyGyrostdX
24 tBodyGyrostdY
25 tBodyGyrostdZ
26 tBodyGyroJerkmeanX
27 tBodyGyroJerkmeanY
28 tBodyGyroJerkmeanZ
29 tBodyGyroJerkstdX
30 tBodyGyroJerkstdY
31 tBodyGyroJerkstdZ
32 tBodyAccMagmean
33 tBodyAccMagstd
34 tGravityAccMagmean
35 tGravityAccMagstd
36 tBodyAccJerkMagmean
37 tBodyAccJerkMagstd
38 tBodyGyroMagmean
39 tBodyGyroMagstd
40 tBodyGyroJerkMagmean
41 tBodyGyroJerkMagstd
42 fBodyAccmeanX
43 fBodyAccmeanY
44 fBodyAccmeanZ
45 fBodyAccstdX
46 fBodyAccstdY
47 fBodyAccstdZ
48 fBodyAccmeanFreqX
49 fBodyAccmeanFreqY
50 fBodyAccmeanFreqZ
51 fBodyAccJerkmeanX
52 fBodyAccJerkmeanY
53 fBodyAccJerkmeanZ
54 fBodyAccJerkstdX
55 fBodyAccJerkstdY
56 fBodyAccJerkstdZ
57 fBodyAccJerkmeanFreqX
58 fBodyAccJerkmeanFreqY
59 fBodyAccJerkmeanFreqZ
60 fBodyGyromeanX
61 fBodyGyromeanY
62 fBodyGyromeanZ
63 fBodyGyrostdX
64 fBodyGyrostdY
65 fBodyGyrostdZ
66 fBodyGyromeanFreqX
67 fBodyGyromeanFreqY
68 fBodyGyromeanFreqZ
69 fBodyAccMagmean
70 fBodyAccMagstd
71 fBodyAccMagmeanFreq
72 fBodyBodyAccJerkMagmean
73 fBodyBodyAccJerkMagstd
74 fBodyBodyAccJerkMagmeanFreq
75 fBodyBodyGyroMagmean
76 fBodyBodyGyroMagstd
77 fBodyBodyGyroMagmeanFreq
78 fBodyBodyGyroJerkMagmean
79 fBodyBodyGyroJerkMagstd
80 fBodyBodyGyroJerkMagmeanFreq

average_by_activity_and_subject.txt contains the following observations, listed by row number, counting from 0 at the header.

1 LAYING
2 SITTING
3 STANDING
4 WALKING
5 WALKING_DOWNSTAIRS
6 WALKING_UPSTAIRS
7 subject1
8 subject2
9 subject3
10 subject4
11 subject5
12 subject6
13 subject7
14 subject8
15 subject9
16 subject10
17 subject11
18 subject12
19 subject13
20 subject14
21 subject15
22 subject16
23 subject17
24 subject18
25 subject19
26 subject20
27 subject21
28 subject22
29 subject23
30 subject24
31 subject25
32 subject26
33 subject27
34 subject28
35 subject29
36 subject30

