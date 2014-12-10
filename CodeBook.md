This codebook describes the various variables that occur in the run_analysis.R file and are used to tidy the given Samsung Galaxy S3 data.

# Variables

* trainXData, trainYData, trainSData, testXdata, testYData, testSdata contain the raw training and testing data from the files for the variables X, y and s (subject).
* X, y and subject combine the training and testing data for each variable respectively using rbind(), and then data combines these three datasets together into one large dataset using cbind().
* features contains the names of the features corresponding to each column of data.
* colsWanted gives the names of the features from features that have mean or std in their description.
* dataMeanStd is a subset of data containing only the columns given by colsWanted and the last two columns 562 and 563 corresponding to the y and subject data respectively.
* activity contains the names of the activities corresponding to the activity ids present in the y variable, and is used to substitute the corresponding numeric column of dataMeanStd by the descriptive name of each activity.
* dataAverageSubjectActivity contains the average of each variable for each activity and each subject, which is created using the function ddply() from the package plyr.
