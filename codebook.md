# Code Book

## Subject and Activity

These variables identify the unique subject/activity pair the variables relate to:

 - Subject: the integer subject ID.
 - Activity: the string activity name:
   - Laying 
   - Sitting
   - Standing
   - Walking   
   - Walking Downstairs
   - Walking Upstairs
   
  
##Following variable renaming were done
  - Replace `t` with `Time`
  - Replace `f` with `Frequency`
  - Replace `-mean` with `Mean`
  - Replace `-std` with `StdDev`
  - Remove characters `-`
  - Replace `BodyBody` with `Body`

 
## Variables in raw and tidy data set

 Raw data set | Tidy data set
 -------------|-------------- 
 `subject` | `Subject`
 `tBodyAcc-mean()-X` | `TimeBodyAccMeanX`
 `tBodyAcc-mean()-Y` | `TimeBodyAccMeanY`
 `tBodyAcc-mean()-Z` | `TimeBodyAccMeanZ`
 `tBodyAcc-std()-X` | `TimeBodyAccStdDevX`
 `tBodyAcc-std()-Y` | `TimeBodyAccStdDevY`
 `tBodyAcc-std()-Z` | `TimeBodyAccStdDevZ`
 `tGravityAcc-mean()-X` | `TimeGravityAccMeanX`
 `tGravityAcc-mean()-Y` | `TimeGravityAccMeanY`
 `tGravityAcc-mean()-Z` | `TimeGravityAccMeanZ`
 `tGravityAcc-std()-X` | `TimeGravityAccStdDevX`
 `tGravityAcc-std()-Y` | `TimeGravityAccStdDevY`
 `tGravityAcc-std()-Z` | `TimeGravityAccStdDevZ`
 `tBodyAccJerk-mean()-X` | `TimeBodyAccJerkMeanX`
 `tBodyAccJerk-mean()-Y` | `TimeBodyAccJerkMeanY`
 `tBodyAccJerk-mean()-Z` | `TimeBodyAccJerkMeanZ`
 `tBodyAccJerk-std()-X` | `TimeBodyAccJerkStdDevX`
 `tBodyAccJerk-std()-Y` | `TimeBodyAccJerkStdDevY`
 `tBodyAccJerk-std()-Z` | `TimeBodyAccJerkStdDevZ`
 `tBodyGyro-mean()-X` | `TimeBodyGyroMeanX`
 `tBodyGyro-mean()-Y` | `TimeBodyGyroMeanY`
 `tBodyGyro-mean()-Z` | `TimeBodyGyroMeanZ`
 `tBodyGyro-std()-X` | `TimeBodyGyroStdDevX`
 `tBodyGyro-std()-Y` | `TimeBodyGyroStdDevY`
 `tBodyGyro-std()-Z` | `TimeBodyGyroStdDevZ`
 `tBodyGyroJerk-mean()-X` | `TimeBodyGyroJerkMeanX`
 `tBodyGyroJerk-mean()-Y` | `TimeBodyGyroJerkMeanY`
 `tBodyGyroJerk-mean()-Z` | `TimeBodyGyroJerkMeanZ`
 `tBodyGyroJerk-std()-X` | `TimeBodyGyroJerkStdDevX`
 `tBodyGyroJerk-std()-Y` | `TimeBodyGyroJerkStdDevY`
 `tBodyGyroJerk-std()-Z` | `TimeBodyGyroJerkStdDevZ`
 `tBodyAccMag-mean()` | `TimeBodyAccMagMean`
 `tBodyAccMag-std()` | `TimeBodyAccMagStdDev`
 `tGravityAccMag-mean()` | `TimeGravityAccMagMean`
 `tGravityAccMag-std()` | `TimeGravityAccMagStdDev`
 `tBodyAccJerkMag-mean()` | `TimeBodyAccJerkMagMean`
 `tBodyAccJerkMag-std()` | `TimeBodyAccJerkMagStdDev`
 `tBodyGyroMag-mean()` | `TimeBodyGyroMagMean`
 `tBodyGyroMag-std()` | `TimeBodyGyroMagStdDev`
 `tBodyGyroJerkMag-mean()` | `TimeBodyGyroJerkMagMean`
 `tBodyGyroJerkMag-std()` | `TimeBodyGyroJerkMagStdDev`
 `fBodyAcc-mean()-X` | `FrequencyBodyAccMeanX`
 `fBodyAcc-mean()-Y` | `FrequencyBodyAccMeanY`
 `fBodyAcc-mean()-Z` | `FrequencyBodyAccMeanZ`
 `fBodyAcc-std()-X` | `FrequencyBodyAccStdDevX`
 `fBodyAcc-std()-Y` | `FrequencyBodyAccStdDevY`
 `fBodyAcc-std()-Z` | `FrequencyBodyAccStdDevZ`
 `fBodyAccJerk-mean()-X` | `FrequencyBodyAccJerkMeanX`
 `fBodyAccJerk-mean()-Y` | `FrequencyBodyAccJerkMeanY`
 `fBodyAccJerk-mean()-Z` | `FrequencyBodyAccJerkMeanZ`
 `fBodyAccJerk-std()-X` | `FrequencyBodyAccJerkStdDevX`
 `fBodyAccJerk-std()-Y` | `FrequencyBodyAccJerkStdDevY`
 `fBodyAccJerk-std()-Z` | `FrequencyBodyAccJerkStdDevZ`
 `fBodyGyro-mean()-X` | `FrequencyBodyGyroMeanX`
 `fBodyGyro-mean()-Y` | `FrequencyBodyGyroMeanY`
 `fBodyGyro-mean()-Z` | `FrequencyBodyGyroMeanZ`
 `fBodyGyro-std()-X` | `FrequencyBodyGyroStdDevX`
 `fBodyGyro-std()-Y` | `FrequencyBodyGyroStdDevY`
 `fBodyGyro-std()-Z` | `FrequencyBodyGyroStdDevZ`
 `fBodyAccMag-mean()` | `FrequencyBodyAccMagMean`
 `fBodyAccMag-std()` | `FrequencyBodyAccMagStdDev`
 `fBodyBodyAccJerkMag-mean()` | `FrequencyBodyAccJerkMagMean`
 `fBodyBodyAccJerkMag-std()` | `FrequencyBodyAccJerkMagStd`
 `fBodyBodyGyroMag-mean()` | `FrequencyBodyGyroMagMean`
 `fBodyBodyGyroMag-std()` | `FrequencyBodyGyroMagStdDev`
 `fBodyBodyGyroJerkMag-mean()` | `FrequencyBodyGyroJerkMagMean`
 `fBodyBodyGyroJerkMag-std()` | `FrequencyBodyGyroJerkMagStdDev`
 
 
 ## Variables in "Average Values by Subject and Activity"
 In the Average_values_by_subject_and_activity.txt the variable names has leading "Mean" like
 
 Raw data set | Tidy data set | Average data set
 -------------|-------------- |-------------- 
 `subject` | `Subject` | `Subject` 
 `tBodyAcc-mean()-X` | `TimeBodyAccMeanX` | `MeanTimeBodyAccMeanX`
 `tBodyAcc-mean()-Y` | `TimeBodyAccMeanY` | `MeanTimeBodyAccMeanY` 
 ....