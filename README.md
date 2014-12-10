Data-Science-Getting-and-Cleaning-Data-Project
==============================================

This repo contains the R code, its output and documentation for the course project of the "Getting and Cleaning Data" Module of the Johns Hopkins Data Science Specialization track.

The dataset being used is: <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones</a>


# Files

Description of the files in this repo are as follows:
* run_analysis.R is the file containing the R code for the project. The file is well documented and so (hopefully) it is easy to read and understand what is going on.
* CodeBook.md describes the data, the variables and the transformations done to the data to tidy it.
* dataAverageSubjectActivity.txt is the output of the run_analysis.R file that contains a cleaned up dataset with the average of each variable for each activity and each subject.


# Instruction

The R code file can be run by simply importing it into R or RStudio provided the above mentioned dataset is present in the same folder, un-compressed and without names altered. The script run_analysis.R performs the following 5 steps as described in the instructions of the course project.

1. The training and testing data for X, y and subject variables are read into R and combined using rbind() and cbind() functions into one dataset called data.

2. Then the file features.txt is read into R and the columns of data with the mean and standard deviation features are taken to form a smaller dataset called dataMeanStd.

3. Next the file activity_levels.txt is read into R and the corresponding ActivityIDs in the y column of the dataset dataMeanStd are replaced by their respective descriptive names.

4. Next we give appropriate labels to the columns of dataMeanStd with descriptive variable names from features.txt.

5. Finally we generate a new dataset called dataAverageSubjectActivity with all the average of each variable for each activity and each subject. This dataset is written into the file dataAverageSubjectActivity.txt and is uploaded to this repo.
