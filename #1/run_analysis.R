# loading the package needed for reading the files
library(data.table)

# Reading the files needed for this problem
# reading the subject_test.txt (Subject), x_test.txt (measurements) and y_test.txt (Activities) files from the test directory and assigning it to variables of the same name as well
subject_test <- read.table("../specdata/UCI_HAR_Dataset/test/subject_test.txt", colClasses = "numeric", col.names = "Subject")
x_test <- read.table("../specdata/UCI_HAR_Dataset/test/X_test.txt", stringsAsFactors = FALSE)
y_test <- read.table("../specdata/UCI_HAR_Dataset/test/y_test.txt", colClasses = "numeric", col.names = "Activities")

# reading the subject_train.txt (Subject), x_train.txt (measurements) and y_train.txt (Activities) files from the train directory and assigning it to variables of the same name as well
subject_train <- read.table("../specdata/UCI_HAR_Dataset/train/subject_train.txt", colClasses = "numeric", col.names = "Subject")
x_train <- read.table("../specdata/UCI_HAR_Dataset/train/X_train.txt", stringsAsFactors = FALSE)
y_train <- read.table("../specdata/UCI_HAR_Dataset/train/y_train.txt", colClasses = "numeric", col.names = "Activities")

# reading the features.txt files from the UCI_HAR_dataset directory and assigning it to variable of the same name as well
features <- read.table("../specdata/UCI_HAR_Dataset/features.txt", stringsAsFactors = FALSE)

# extracting the features$V2 column from the features data table to a vector which is assigned in header_features_labels
header_features_labels <- c(features$V2)

# assigning the header_features_labels as a header for x_test data table which primarily contains measurement values
names(x_test) <- header_features_labels

# extracting the activities column from y_test data table and assigning it to the Activities variable
Activities <- c(y_test$Activities)

# extracting the Subject column from subject_test data table and assigning it to the Subject variable
Subject <- c(subject_test$Subject)

# binding Subject, Activities and x_test by column and assigning it to the all_test_data 
all_test_data <- cbind(Subject, Activities, x_test)

# assigning the same header_features_labels to the measurements in x_train
names(x_train) <- header_features_labels

# extracting the Activities from the y_train data table onto a vector and assigning it to the Activities variable
Activities <- c(y_train$Activities)

# extracting the Subject from the subject_train data table onto a vector and assigning it to the Subject variable
Subject <- c(subject_train$Subject)

# train_data contains the Subject, activities and measurements from x_train that were column-bind
all_train_data <- cbind(Subject, Activities, x_train)

# merging the all_test_data and all_train_data by row and would be stored in the merged_data variable
merged_data <- rbind(all_test_data, all_train_data)

# extracting the measurements on mean and standard deviation of each measurements which is stored in the header_features_labels variable with values mean() and std()
# using grep() funtion to search for matches of "mean()" and "std()" strings as seen in the first argument below, as well as setting the value of fixed and value as TRUE
# matches with "mean()" is stores in mean_values variables
mean_values <- grep("mean()", header_features_labels, value = TRUE, fixed = TRUE)

# matches with "std()" is stored in std_values variable
std_values <- grep("std()", header_features_labels, value = TRUE, fixed = TRUE)

# combining the mean_values and std_values together with the Subject and Activities string and storing it in the mean_and_std variable
mean_and_std <- c("Subject","Activities", mean_values, std_values)

# tidying the data using the subset() function to select the mean_and_std from the merged_data and assigning it to tidy_data variable
tidy_data <- subset(merged_data, select = mean_and_std)

# using gsub function to search for the activity names(1st argument) and replacing it with descriptive ones' (2nd argument) from the tidy_data activities column then assigning it back to the same column
# the descriptive activity names are as follows: 1 is replaced with Walking; 2 is replaced with Walking Upstairs; 3 is replaced with Walking Downstairs;
# 4 is replaced with Sitting; 5 is replaced with Standing; 6 is replaced with Laying which are found in the activity_labels.txt
tidy_data[ ,"Activities"] <- gsub(1, "Walking", tidy_data$Activities)
tidy_data[ ,"Activities"] <- gsub(2, "Walking Upstairs", tidy_data$Activities)
tidy_data[ ,"Activities"] <- gsub(3, "Walking Downstairs", tidy_data$Activities)
tidy_data[ ,"Activities"] <- gsub(4, "Sitting", tidy_data$Activities)
tidy_data[ ,"Activities"] <- gsub(5, "Standing", tidy_data$Activities)
tidy_data[ ,"Activities"] <- gsub(6, "Laying", tidy_data$Activities)

# using the aggregate() function to create a second, independent tidy data set (final_tidy_data) which contains the average of each variable(activities and subjects)
# that is computing for the summary statistics(mean) for the subset of the data (subject ans activities)
# the arguments for this function is the tidy_data , the list of variables (tidy_data$Subject, tidy_data$Activities), and the function (FUN = mean) which is the mean for which to be applied
final_tidy_data <- aggregate(tidy_data, by = list(tidy_data$Subject, tidy_data$Activities), FUN = mean)

# the above code generated another 2 column (3rd and 4th) as a result of the instruction above thus I remove them by specifying -c(3,4) which will remove it from the final_tidy_data and reassigning it back 
final_tidy_data <- final_tidy_data[ , -c(3,4)]

# appropriately labeling the data set by replacing it with descriptive header names
# assigning the column names or header names of the final_tidy_data to the header_labels
header_labels <- names(final_tidy_data)

# by using the names(final_tidy_data) in the console I was able to identify the given header names as seen in the first argument of the sub function
# using the sub() function to replace the given strings which is the first argument of the sub function into a much comprehensible header names (2nd argument from the header_values)
header_labels <- sub("^t", "Time", header_labels)
header_labels <- sub("^f", "Frequency", header_labels)
header_labels <- sub("Acc", "Accelerometer", header_labels)
header_labels <- sub("-mean..", "Mean", header_labels)
header_labels <- sub("-X", "Xaxis", header_labels)
header_labels <- sub("-Y", "Yaxis", header_labels)
header_labels <- sub("-Z", "Zaxis", header_labels)
header_labels <- sub("-std..", "StandardDeviation", header_labels)
header_labels <- sub("Gyro", "Gyroscope", header_labels)
header_labels <- sub("BodyBody", "Body", header_labels)
header_labels <- sub("Mag", "Magnitude", header_labels)
header_labels <- sub("Group.1", "Subject", header_labels)
header_labels <- sub("Group.2", "Activities", header_labels)

# assigning back the descriptive variable names to the data frame final_tidy_data 
# this as well results to the final tidy data set for this problem
header_labels -> names(final_tidy_data)

# creating the Tidy_Dataset file which contains final_tidy_data contents using the write.table function
# the name of the file for the final tidy data is Tidy_dataset which can be found in the same directory as this code
write.table(final_tidy_data, file = "Tidy_Dataset.txt")