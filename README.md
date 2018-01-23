# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

This repository contains the following files:

1.README.md, EADME that explains the analysis files is clear and understandable.
2.tidy_data.txt, which contains the clean data set.
3.CodeBook.md, code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
5.run_analysis.R which is used to create the tidy data set

The R script run_analysis.R is to create the tidy data set from the source file provided in this course. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

 1.Download and unzip source data (checked there is no such file in the working directory)
 2.Read data.
 3.Merge the training and the test sets to create one data set.
 4.Extract only the measurements on the mean and standard deviation for each measurement.
 5.Use descriptive activity names to name the activities in the data set.
 6.Appropriately label the data set with descriptive variable names.
 7.Create a second, independent tidy set with the average of each variable for each activity and each subject.
 8.Write the data set to the tidy_data.txt file.
