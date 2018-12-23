# initial step 1 - download and unzip the data

zip_file <- "UCI HAR Dataset.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zip_file, mode = "wb")
unzip(zip_file)

# initial step 2 - consume training data, test data, features data, activity data
data_dir <- "UCI HAR Dataset"
subject_test <- read.table(file.path(getwd(),data_dir,"test","subject_test.txt"))
x_test <- read.table(file.path(getwd(),data_dir,"test","X_test.txt"))
y_test <- read.table(file.path(getwd(),data_dir,"test","Y_test.txt"))

subject_train <- read.table(file.path(getwd(),data_dir,"train","subject_train.txt"))
x_train <- read.table(file.path(getwd(),data_dir,"train","X_train.txt"))
y_train <- read.table(file.path(getwd(),data_dir,"train","Y_train.txt"))

features <- read.table(file.path(getwd(),data_dir,"features.txt"))

activities <- read.table(file.path(getwd(),data_dir,"activity_labels.txt"))

#Steps -
# 1. Merges the training and the test sets to create one data set.

#column bind the subjects, values and activities
subjects <- cbind(subject_test,subject_train)
values <- cbind(x_test,x_train)
activities <- cbind(y_test,y_train)








