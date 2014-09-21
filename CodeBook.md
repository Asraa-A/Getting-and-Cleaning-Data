
#**Code Book**


##Source of the original data: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

 Original description: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



## Data Set Information:

  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

  Check the README.txt file for further details about this dataset.


## Attribute Information:

  For each record in the dataset it is provided: 
    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.
## The R script performs the following to produce the tidy data set:

   * Merges the training (train/X_train.txt) and test sets (test/X_test.txt) to create one data set (X_merged) which is a data frame of 10299 observations of 561 variables.
     Also merges the (train/subject_train.txt) and (test/subject_test.txt), to create one data set (subject_merged) which is a data frame of 10299 obsercations and one variable called subject IDs.
     Moreover,merges (train/y_train.txt) and (test/y_test.txt), to create one data set (y_merged) which is a data frame of 10299 obsercations and one variable called Activity IDs.
   * Read feautres.txt and Extracts only the measurements on the mean and standard deviation for each measurement.The result is a data frame (X_merged) with 10299 observations of 66 variables.
   * Read activity names from activity_labels.txt file and name the activities (y_merged) in the data set (walking,walkingupstairs,walkingdownstairs,sitting,standing,laying).
   * Appropriately labels the data set with descriptive names: attributes names and activity names are converted to lower case, underscores and brackets () are removed. 
     Then it merges (X_merged) features with activity labels (y_merged) and subject IDs (subject_merged). The result is saved as merged_data.txt,data frame with 10299 observations and 68 variables,
     the first column contains subject IDs, the second column activity names, and the rest columns are measurements.
   * Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject,reshape2 package(melt and decast functions).
     The data saved in Data_tidy.txt file a 180x68 data frame.