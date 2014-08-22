#Read the test data and train data
testdata=read.table("X_test.txt")
traindata=read.table("X_train.txt")

##Part 1##
#Merging test data and train data into one set
mergedata2<-merge(testdata,traindata,all=TRUE)


##Part 2##
#Extract only measurements on mean and standard deviation
#all variables with "mean" and "std" in variable name are selected
mean_std <- subset(mergedata2, select=c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543))


##Part 3##
#Adding action into the single file as factors
mergedata2$action<-factor(merged_y$V1)
#Adding descriptive activity names to the single file (as a new variable)
action.l<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
mergedata2$action_name<-action.l[mergedata2$action]


##Part 4##
#Labeling data set with descriptive variable names
#Read the feature file
features<-read.table("features.txt")
#Adding column names to mergedata2
colnames(mergedata2)<-features$V2
#Read the action files
y_test<-read.table("y_test.txt")
y_train<-read.table("y_train.txt")
#Merging the action files into one
merged_y<-rbind(y_test,y_train)

##Part 5##
#Creating second, independent tidy data set with the average of each variable for each activity and each subject
#Each subject = each individual column, each action = action_name
library(plyr)
tidy<-ddply(mergedata2,"action_name",colwise(mean))