
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

features <- read.table(file.path(getwd(),data_dir,"features.txt"),as.is=TRUE)

activities <- read.table(file.path(getwd(),data_dir,"activity_labels.txt"))

#Steps -
# 1. Merges the training and the test sets to create one data set.

#merger all the data sets to one data set
master_data_set <- rbind(cbind(subject_train,x_train,y_train),cbind(subject_test,x_test,y_test))

#assign readable column names
colnames(master_data_set) <- c("subject",features[,2],"activity")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

required_columns <- grepl("mean()|std()|subject|activity",colnames(master_data_set))
sub_data_set <- master_data_set[,c(required_columns)]

# 3. Uses descriptive activity names to name the activities in the data set.

sub_data_set$activity <- factor(sub_data_set$activity,levels=activities[,1],labels=activities[,2])

# 4. Appropriately labels the data set with descriptive variable names.
col_names <- colnames(sub_data_set)

col_names <- gsub("[()-]","",col_names)
col_names <- gsub("Gyro","_gyroscope",col_names)
col_names <- gsub("Acc","_accelerometer",col_names)
col_names <- gsub("mean","_mean",col_names)
col_names <- gsub("std","_standarddeviation",col_names)
col_names <- gsub("Freq","frequency",col_names)
col_names <- gsub("tBody","time_body",col_names)
col_names <- gsub("fBodyBody","frequency_body",col_names)
col_names <- gsub("fBody","frequency_body",col_names)
col_names <- gsub("Mag","_magnitude",col_names)

colnames(sub_data_set) <- col_names

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#install reshape2 package.
if(!library(reshape2, logical.return = TRUE)) {
  # It didn't exist, so install the package, and then load it
  install.packages('reshape2')
  library(reshape2)
}
#split (melt) the data set by subject and activity
sub_data_set_melted <- melt(sub_data_set,id=c('subject','activity'))

#get the mean value of each splitted rows (above)
tidy_data_set <- dcast(sub_data_set_melted,subject+activity~variable,mean)

#check the data
write.table(tidy_data_set, file=file.path("tidy.txt"), row.names = FALSE, quote = FALSE)

#group by and average by just activity
#optional, not required for this project
#sub_data_set_melted <- melt(sub_data_set,id=c('activity'))
#tidy_data_set <- dcast(sub_data_set_melted,activity~variable,mean)
#write.table(tidy_data_set, file=file.path("tidy.txt"), row.names = FALSE, quote = FALSE)



