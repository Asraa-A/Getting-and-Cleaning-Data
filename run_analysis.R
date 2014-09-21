## Needed packages
install.packages("data.table")
install.packages("reshape2")
library(data.table)
library(reshape2)


#This R script does the foloowing:

## 1.Merges the training and the test sets to create one data set.
train_set<-read.table("./train/X_train.txt")
test_set<-read.table("./test/X_test.txt")
X_merged<-merge(test_set,train_set,all=TRUE)
train_labels<-read.table("./train/y_train.txt")
test_labels<-read.table("./test/y_test.txt")
y_merged<-rbind(train_labels,test_labels)
train_subject<-read.table("./train/subject_train.txt")
test_subject<-read.table("./test/subject_test.txt")
subject_merged<-merge( test_subject,train_subject,all=TRUE)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("features.txt")
mean_sd_index<- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X<-X_merged[,mean_sd_index]
names(X)<-features[mean_sd_index,2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## 3.Uses descriptive activity names to name the activities in the data set
activity_names<-read.table("activity_labels.txt")
activity_names[,2]=gsub("_","",activity_names[,2])
activity_names[,2]= tolower(activity_names[, 2])
y_merged[,1]=activity_names[y_merged[,1],2]
names(y_merged)="Activity"

## 4.Appropriately labels the data set with descriptive variable names. 
features <- read.table("features.txt")
names(X_merged) <- features[, 2]
names(X_merged) <- gsub("\\(|\\)", "", names(X))
names(X_merged) <- tolower(names(X))
names(subject_merged)<-"Subject"
Data_set<-cbind(subject_merged,y_merged,X_merged)
write.table(Data_set, "merged_data.txt")

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
id_col<-c("Subject","Activity")
id_cols<-c("Subject","Activity")
data_cols= setdiff(colnames(Data_set), id_cols)
Data_melt= melt(Data_set, id = id_cols, measure.vars = data_cols,na.rm=TRUE)
Data_cast = dcast(Data_melt, Subject + Activity ~ variable,mean)
Data_cast=Data_cast[,1:68]
write.table(Data_cast, "Data_tidy.txt",row.names=FALSE)


