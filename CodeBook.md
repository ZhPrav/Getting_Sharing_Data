## Getting and Cleaning Data Course Project Data Description

The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. A full description is available at the site where the data was 
obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

===================================
Variables Selection for the project 
===================================

1. From the feature list provided with the original data set the only measurements were extracted, which have an average or standard deviation measurements for each observation / type of activity / subject. 
The list of variables includes:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Additinally, there is the set of variables that were estimated from the variables above are: 

- mean: Mean values
- std: Standard deviation
- meanFreq: Weighted average of the frequency components to obtain a mean frequency


Additional vectors obtained by averaging the signals in a signal window sample. These are used on 
the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

Two additional variables:

- activities  
- subject 

where added from vectors provided in files 
y_test.txt, 
y_train.txt,
subject_test.txt, 
subject_train.txt

###############



2. Data sets for Coursera "Getting and Cleaning data" course project were prepared as descibed below:

2.1. Train and test data sets were loaded as separate data frames

2.2. "y" vectors are assigned to each observation in X test and train data frames

2.3. "subject" vectors are assigned to each observation in X test and train data frames

2.4. train and test data sets were merged in one

2.5. Variable names from features.txt were assigned to each column. Names for two additial columns are 
assigned as

- for "Y" vector - "activities"
- for "subject" vector - "subject"

2.6. Columns containing "mean/Mean" or "std/Std", and "activities", and "subject" values in variables 
names were extracted in the xy_mean_std dataset

2.7. Values of "activity" variables were substituted in accordance with mapping provided in 
"activity_labels.txt"

2.8. An additional data set with averaged by activities + subject values is prepared using reshape2 
library functions

3. Files with data sets:
* xy_mean_std.csv
* avr_act_subject.csv
* avr_act_subject.txt