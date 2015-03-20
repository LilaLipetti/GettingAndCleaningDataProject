###############################################################################
## run_analysis.R
###############################################################################
## Input  : Downloaded and extracted dataset in UCI HAR Dataset directory.
##          See instructions in README.md
##          
## Output :
##        Merged_cleaned_tidydata.txt
##        Average_values_by_subject_and_activity.txt
##
###############################################################################
## Basic functionality of this script:
##
## 1. Validates
##    - that needed datafolder UCI HAR Dataset is a subdirectory of
##      current working directory
##    - that needed files and directories are available in the UCI HAR Dataset
##      directory
##
## 2. Read the training and the test sets 
##
## 3. Extracts only the measurements on the mean and standard deviation 
##    for each measurement and will set new names for each measurement
##
## 4. Uses descriptive activity names to name the activities in the data set.
##    read the activities 
##
## 5. Appropriately labels the data set with descriptive activity names.
##    Combine subject,activity and extracted data into one dataframe, which is
##    then stored into Merged_cleaned_tidydata.txt
##
## 6. Creates a 2nd, independent tidy data set 
##    with the average of each variable for each activity and each subjet, 
##    which is stored into Average_values_by_subject_and_activity.txt
##
##############################################################################

##############################################################################
## 1. checking if the needed datafolder exists in current working directory
##############################################################################

currentWorkingDirectory<-getwd()

if (!file.exists("UCI HAR Dataset")){
        stop("Data directory UCI HAR Dataset not found")
        
}


## checking if the needed subfolder exists, with needed files
if (!file.exists("UCI HAR Dataset/train"))
{
        stop("Data directory UCI HAR Dataset/train not found. See Readme.md for more information.")

}

if (!file.exists("./UCI HAR Dataset/train/X_train.txt"))
{
        stop("Data directory UCI HAR Dataset/X_train.txt not found. See Readme.md for more information")
        
}

##############################################################################
## 2. Read and merge the training and the test sets to create one data set
##############################################################################

## read training set data and rowbind it to 1 dataframe
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_data<-rbind(x_train,x_test)


## read training label data and rowbind it to 1 column
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_data<-rbind(y_train,y_test)[, 1]

        
## read subject data and rowbind it to 1 column
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_data<-rbind(subject_train,subject_test)
names(subject_data) <- "Subject"


##############################################################################
## 3. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
##    
##############################################################################

## Read features labels
features <- read.table("UCI HAR Dataset/features.txt")[, 2]

## grepping the indexes of all mean or std features
extract_features <- grep("(mean|std)\\(\\)", features)

## exctract only the wanted features as columns
x_data_extracted <- x_data[, extract_features]

## set new column names 
names(x_data_extracted) <- features[extract_features]
names(x_data_extracted) <- gsub("\\(|\\)", "", names(x_data_extracted))
## names(x_data_extracted) <- tolower(names(x_data_extracted))


##############################################################################
## 4. Uses descriptive activity names to name the activities in the data set.
##############################################################################

activityNames <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")

## store the new activity names
activities <- activityNames[y_data]



##############################################################################
## 5. Appropriately labels the data set with descriptive activity names.
##############################################################################

##    Combine subject,activity and extracted data into one dataframe
cleaned <- cbind(Subject=subject_data, Activity=activities, x_data_extracted)

## sort based on subject, activity
cleaned<-cleaned[with(cleaned, order(Subject, Activity)), ]

names(cleaned) <- gsub("^t", "Time", names(cleaned))
names(cleaned) <- gsub("^f", "Frequency", names(cleaned))
names(cleaned) <- gsub("-mean", "Mean", names(cleaned))
names(cleaned) <- gsub("-std", "StdDev", names(cleaned))
names(cleaned) <- gsub("-", "", names(cleaned))
names(cleaned) <- gsub("BodyBody", "Body", names(cleaned))


## write output file
write.table(cleaned, "Merged_cleaned_tidydata.txt",row.names = FALSE)


##############################################################################
## 6. Creates a 2nd, independent tidy data set 
## with the average of each variable for each activity and each subject.
##############################################################################

library(plyr)

## Column means for all but the subject and activity columns
limitedColMeans <- function(cleaned) { colMeans(cleaned[,-c(1,2)]) }
tidyData <- ddply(cleaned, .(Subject, Activity), limitedColMeans)

## add leading "Mean" to variable names
names(tidyData)[-c(1,2)] <- paste0("Mean", names(tidyData)[-c(1,2)])


## sort the data by subject and activity
tidyData<-tidyData[with(tidyData, order(Subject, Activity)), ]


## Write output file
write.table(tidyData, "Average_values_by_subject_and_activity.txt", row.names = FALSE)
