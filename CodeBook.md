# Introduction

The script run_analysis.R performs the following 6 steps as described in the instructions of the course project.
1. The training and testing data for X, y and subject variables are read into R and combined using rbind() and cbind() functions into one dataset called data.
2. Then the file features.txt is read into R and the columns of data with the mean and standard deviation features are taken to form a smaller dataset called dataMeanStd.
3. Next the file activity_levels.txt is read into R and the corresponding ActivityIDs in the y column of the dataset dataMeanStd are replaced by their respective descriptive names.
4. Next we give appropriate labels to the columns of dataMeanStd with descriptive variable names from features.txt.
5. Finally we generate a new dataset called dataAverageSubjectActivity with all the average of each variable for each activity and each subject. This dataset is written into the file dataAverageSubjectActivity.txt and is uploaded to this repo.

# Variables

* trainXData, trainYData, trainSData, testXdata, testYData, testSdata contain the raw training and testing data from the files for the variables X, y and s (subject).
* X, y and subject combine the training and testing data for each variable respectively using rbind(), and then data combines these three datasets together into one large dataset using cbind().
* features contains the names of the features corresponding to each column of data.
* colsWanted gives the names of the features from features that have mean or std in their description.
* dataMeanStd is a subset of data containing only the columns given by colsWanted and the last two columns 562 and 563 corresponding to the y and subject data.
* activity contains the names of the activities corresponding to the activity ids present in the y variable, and is used to substitute the corresponding numeric column of dataMeanStd by the descriptive name of each activity.
* dataAverageSubjectActivity contains the average of each variable for each activity and each subject, which is created using the function ddply() from the package plyr.
