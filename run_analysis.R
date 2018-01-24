1.Download and unzip dataset

url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(url,destfile="./data/Dataset.zip")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 MB)
downloaded 59.7 MB

> unzip(zipfile="./data/Dataset.zip",exdir="./data")

2.Merges the training and the test sets to create one data set.

2.1 Reading files from unziped files
> X_test<- read.table("./data/UCI HAR Dataset/test/X_test.txt")

> y_test<- read.table("./data/UCI HAR Dataset/test/y_test.txt")
> subject_test<- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
> X_train<- read.table("./data/UCI HAR Dataset/train/X_train.txt")
> y_train<- read.table("./data/UCI HAR Dataset/train/y_train.txt")
> subject_train<- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
> features<-  read.table("./data/UCI HAR Dataset/features.txt")
>labels<-  read.table("./data/UCI HAR Dataset/activity_labels.txt")
>labels[,2]<- as.character(labels[,2])
>features[,2]<- as.character(features[,2])

2.2 Assign column names for each file
> colnames(X_train)<- features[,2]
> colnames(y_train)<- "activity_id"
> colnames(subject_train)<- "subject_id"
> colnames (X_test)<- features[,2]
> colnames (y_test)<- "activity_id"
> colnames (subject_test)<- "subject_id"
> colnames(labels)<- c("activity_id","activity_type")
2.3 Merge all data sets into one set:
> train_merge <- cbind(y_train,subject_train,X_train)
> test_merge<- cbind(y_test,subject_test,X_test)
> merge_test_train<- rbind(train_merge,test_merge)

3. Extracts only the measurements on the mean and standard deviation 
for each measurement.
3.1 Read column names:
> colnamesall<- colnames(merge_test_train)

3.2 Create vector for defining ID, mean and standard deviation:
> mean_std<- (grepl("activity_id",colnamesall) |
+ grepl("subject_id",colnamesall) |
+ grepl("mean...",colnamesall) |
+ grepl("std...",colnamesall)
+ )

3.3 Making nessesary subset from above vector:
> Set_mean_std<- merge_test_train[,mean_std==TRUE]

4. Uses descriptive activity names to name the activities in the data set:
> Activity_Names<- merge(Set_mean_std,labels,
+ by="activity_id",
+ all.x=TRUE)

5. Creating a second, independent tidy data set with the average of each variable
 for each activity and each subject:
5.1 Making second tidy data set
> tidy_data<- aggregate(.~subject_id + activity_id, Activity_Names, mean)
> tidy_data<- tidy_data[order(tidy_data$subject_id, tidy_data$activity_id),]
5.2 Writing second tidy data set in txt file
> write.table(tidy_data, "tidy_data.txt",row.names = FALSE, quote = FALSE)