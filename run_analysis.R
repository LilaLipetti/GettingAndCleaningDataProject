
currentWorkingDirectory<-getwd()


## checking if the needed datafolder exists
if (!file.exists("./UCI HAR Dataset")){
        stop("Data directory UCI HAR Dataset not found")
}

## checking if the needed subfolder exists, with needed files
if (!file.exists("./UCI HAR Dataset/train"))
{
        stop("Data directory UCI HAR Dataset/train not found")

}

if (!file.exists("./UCI HAR Dataset/train/X_train.txt"))
{
        
        
}

## 1. Read and merge the training and the test sets to create one data set:
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
x_data<-rbind(x_train,x_test)


y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
y_data<-rbind(y_train,y_test)

        
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_data<-rbind(subject_train,subject_test)



## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
# Read features labels
features <- read.table("features.txt")[, 2]

## grepping the indexes of all mean or std features
extract_features <- grep("(mean|std)\\(\\)", features)

## extract the columns
x_data_extracted <- x_data[, extract_features]

##set new column names: lowercases
names(x_data_extracted) <- features[extract_features]
names(x_data_extracted) <- gsub("\\(|\\)", "", names(x_data_extracted))
names(x_data_extracted) <- tolower(names(x_data_extracted))


# 3. Uses descriptive activity names to name the activities in the data set.
## read the activities and replace "_" characters
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y_data[,1] = activities[y_data[,1], 2]
names(y_data) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
cleaned <- cbind(subject=subject_data, activity=y_data, x_data_extracted)

## sort based on subject, activity
cleaned<-cleaned[with(cleaned, order(subject, activity)), ]

## write output file
write.table(cleaned, "Merged_cleaned_tidydata.txt",row.names = FALSE)


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

tidyData <- aggregate(cleaned, by=list(Subject=cleaned$subject,Activity=cleaned$activity), FUN=mean, na.rm=TRUE)

tidyData<-tidyData[with(tidyData, order(subject, activity)), ]
tidyData <- subset(tidyData, select = -c(activity,subject) )

# Write file
write.table(tidyData, "Average_values_by_subject_and_activity.txt", row.names = FALSE)
