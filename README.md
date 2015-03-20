
# README

## Original dataset
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Original data has been used for publishing following article:
Anguita D, Ghio A, Oneto L, Parra X, Reyes-Ortiz JL (2012) Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine, 
4th International Workshop of Ambient Assisted Living (IWAAL 2012), held in Vitoria-Gasteiz, Spain. Dec 2012

Article can be accessed http://link.springer.com/chapter/10.1007/978-3-642-35395-6_30 or http://www.icephd.org/sites/default/files/IWAAL2012.pdf

Dataset download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description of the dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 



## About included run_analysis.R

	1. Merges the training and the test sets to create one new data set.
	
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	
	3. Uses descriptive activity names to name the activities in the new data set
	
	4. Appropriately label the data set with descriptive new variable names (see included cookbook.md) 
	
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

	Output :
		Merged_cleaned_tidydata.txt
		Average_values_by_subject_and_activity.txt
		

## About included cookbook.md
   Includes detailed information how existing variables were transformed to new variables.

   
   
## How to use run_analysis.R
    1) download run_analysis.R into directory 
	2) download the dataset getdata-projectfiles-UCI HAR Dataset into same directory than run_analysis.R 
	3) unzip the dataset
	4) unzipped folder UCI HAR Dataset should be now in the same directory than run_analysis.R
		     

