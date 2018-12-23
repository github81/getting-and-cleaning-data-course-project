# getting-and-cleaning-data-course-project

This project downloads, cleans, renames some identifers and outputs a tidy data set to a file (tidy.txt) in the working directory. Data is collected from the accelerometers from the Samsung Galaxy S smartphone.

# initial steps
## inital step 1: download data

The data (zip file) is downloaded to the current working directory and unzipped.More information about the data can be found at the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## inital step 2: consume training data, test data, features data, activity data

The downloaded and unzipped data is consumed from the respective directory and read in to two sets of variables in a table (data.table) format. The following are the variables for training and test data sets.

* subject_test - file test/subject_test.txt 
* x_test - file test/X_test.txt
* y_test - file text/Y_test.xt
* subject_train - file train/subject_train.txt
* x_train - file train/X_train.txt
* y_train - file train/Y_train.txt
* features - file features.txt
* activities_lables - file activity_labels.txt

# steps
## step 1: Merges the training and the test sets to create one data set.
The test and training data is merged in to one master data set. Column bind the training and test data and row bind after that.

First and last column of the data set are "subject" and "activity" data respectively. The columns in the middle are the features which are extracted from the features table.  


## step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Only mean, standard deviation, fist column - "subject", last column - "activity" are needed. Hence, a new sub data set with only the required columns.

## step 3: Uses descriptive activity names to name the activities in the data set.
The activities in the activities column are given a legible name. This information is fetched from the acitivity table.

## step 4: Appropriately labels the data set with descriptive variable names.
Removed unwanted characters like [,(,),- from the column names and also made the column names more legible by doing the following:
* replaced word Gyro by _gyroscope
* replaced word Acc by _accelerometer
* replaced word mean by _mean
* replaced word std by _standarddeviation
* replaced word Freq by frequency
* replaced word tBody by time_body
* replaced word fBodyBody by frequency_body
* replaced word fBody by frequency_body
* replaced word Mag by _magnitude

## step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Mean is calculated for each group of subject and activity. First the data set is split by subject and activity and later mean is calculated for each of the splitted data set.

Finally, the data is written is to tidy_data.txt file.





