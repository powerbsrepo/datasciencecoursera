# Read in the TEST & TRAIN subject data sets and combine them
trainsub<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names=c("Subject ID"))
testsub<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names=c("Subject ID"))
subjects<-rbind(trainsub, testsub)

# Read in the TEST & TRAIN activity data sets and combine them
trainact<-read.table("UCI HAR Dataset/train/y_train.txt",col.names=c("Activity ID"))
testact<-read.table("UCI HAR Dataset/test/y_test.txt",col.names=c("Activity ID"))
actset<-rbind(trainact, testact)
# Read in the activity labels and merge them into the activity data set
actlab<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("Activity ID","Activity Name"))
acttab<-merge(actset,actlab)
activities<-data.frame(acttab$Activity.Name)
colnames(activities)<-c("Activity Name")

# Read in the TEST & TRAIN results data sets and combine them (only the first 6 columns)
trainset<-read.table("UCI HAR Dataset/train/X_train.txt")
trainset6<-data.frame(trainset[,1:6])
testset<-read.table("UCI HAR Dataset/test/X_test.txt")
testset6<-data.frame(testset[,1:6])
sets<-rbind(trainset6, testset6)

# Combine the subjects, activities, & results into one data set
dataset<-cbind(subjects, activities, sets)
# Add descriptive variable names
colnames(dataset)<-c("Subject.ID","Activity.Name","BodyAccMX","BodyAccMY","BodyAccMZ","BodyAccSX","BodyAccSY","BodyAccSZ")

# Create tidy dataset
datasetg<-group_by(dataset, Subject.ID, Activity.Name)
tidyset<-summarise(datasetg,BodyAccMX=mean(BodyAccMX),BodyAccMY=mean(BodyAccMY),BodyAccMZ=mean(BodyAccMZ),BodyAccSX=mean(BodyAccSX),BodyAccSY=mean(BodyAccSY),BodyAccSZ=mean(BodyAccSZ))

# Write out the tidy data set
write.table(tidyset,"UCIHAR_Analysis.txt",row.name=FALSE)

