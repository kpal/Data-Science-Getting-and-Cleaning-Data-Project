require(plyr)


# 1. Merge the training and test sets to create one data set

## Read the raw data from respective files
trainXData <- read.table('UCI HAR Dataset/train/X_train.txt')
trainYData <- read.table('UCI HAR Dataset/train/y_train.txt')
trainSData <- read.table('UCI HAR Dataset/train/subject_train.txt')
testXData <- read.table('UCI HAR Dataset/test/X_test.txt')
testYData <- read.table('UCI HAR Dataset/test/y_test.txt')
testSData <- read.table('UCI HAR Dataset/test/subject_test.txt')

## Create the X, y and subject datasets respectively
X <- rbind(trainXData, testXData)
y <- rbind(trainYData, testYData)
subject <- rbind(trainSData, testSData)

## Combine the above three datasets into one dataset named data
data <- cbind(cbind(X, y), subject)


# 2. Extract only the measurements on the mean and standard deviation for each measurement

## Read the features.txt file to get the features
features <- read.table('UCI HAR Dataset/features.txt', colClasses = 'character')

## Get only columns with mean() or std() in their names
colsWanted <- grep("-(mean|std)\\(\\)", features[, 2])

## Get the subsetted dataset with the appropriate columns
dataMeanStd <- data[, c(colsWanted, 562, 563)]


# 3. Use descriptive activity names to name the activities in the data set

## Read the activity_labels.txt file to get the activity names
activity <- read.table('UCI HAR Dataset/activity_labels.txt',
                       col.names = c('activityID', 'activity'))

## Replace the activity ids by the activity names
dataMeanStd[,67] <- activity[dataMeanStd[,67], 2]


# 4. Appropriately label the data set with descriptive variable names

featuresMeanStd <- features[colsWanted,]
colnames(dataMeanStd) <- c(featuresMeanStd[,2], 'activity', 'subject')


# 5. Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

dataAverageSubjectActivity <- ddply(dataMeanStd, .(subject, activity), 
                       function(x) colMeans(x[, 1:66]))


# 6. Write the dataset back to a .txt file
write.table(dataAverageSubjectActivity, file = 'dataAverageSubjectActivity.txt',
            row.name = FALSE)