This is the Readme file for the Coursera Getting and Cleaning Data course project.

This file does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

It assumes the data set files X_test.txt, X_train.txt, y_test.txt, y_train and features.txt are in the same directory as this script.

Each question's answer is broken out by comments (#) in the file. The data output for part 5 is uploaded to the link in Coursera 
submission.

Here's a brief description of my approach for each question:

1 - After reading both files into memory, I used the merge function to merge the train and test data sets.

2 - Using the features.txt file, I picked the columns that were means and standard deviations (anything that has mean or std in them). 
Then I subsetted these columns accordingly.

3 and 4 - After combining them, I merged the action names ( "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING",
"LAYING") into the merged files in question 1. With this, I created a descriptive activity column to the merged file as a 
new variable.

After that I read the action files (y_test.txt and y_train.txt), I merged them into one and added them into the the merged file 
in question 1, thereby giving the variables meaningful names.

5 - Using the plyr function, I applied the mean action column-wise, separating by the action.

