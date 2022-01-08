## run_analysis.R description
The original data in this dataset has been reshaped in order to have all of the necessary information in a single tidy dataset. After loading the package and reading files, the train and test datasets now include the subject and activity information. Moreso, the resulting train and test datasets were also merged or combined. Following that, only a subset of the features, those with the mean and standard deviation values, were extracted. Variable names have been replaced by removing special characters and expanding the names into a much more comprehensible one. 

The first resulting dataset for this problem is a tidy data data frame with 68 variables and 10299 observations. Consequently, the second and final resulting dataset is tidy data with 68 variables and 180 observations which contains the mean of all variables for each subject and activity and is contained in a text file called Tidy_Data.txt.

### General Process
Generally, the following steps were taken in order to achieve the final tidy data for this problem.

#### Preliminary Step
1. Installed and loaded the data.table() package which will be used in solving this problem.
2. Loading and reading the test (subject_test[Subject], y_test[Activities], x_test[measurements] files), and  train (subject_train[Subject], x_train, and y_train files) data to variables.
3. Loading and reading the features.txt file data to a variable and creating a data frame that contains the labels from the feature text file. 

#### Step 1  Merges the training and the test sets to create one data set.
1. Assign the feature labels to the measurement values from x_test file then column bind the x_test[measurement values], y_test[Activities], and subject_test[Subject] into one dataset.
2. Assign the feature labels to the measurement values from x_train file then column bind the x_train[measurement values], y_train[Activities] and subject_train[Subject] into one dataset.
3. Row bind the train and test data frames that were created to create a single data set.

#### Step 2 Extracts only the measurements on the mean and standard deviation for each measurement
1. Create a data frame variable that contains feature labels with the target feature label 'mean()'.
2. Create another data frame variable that contains feature labels with the target feature label 'std()'.
3. Create and store in a vector the mean and std data frame with Subject and Activities string labels.
Subset the overall single data set to extract only the mean, standard deviation, Subject, and Activities values which were stored in a vector from the previous step.

#### Step 3 Uses descriptive activity names to name the activities in the dataset
1. As identified and retrieved from activity_labels.txt, rename the numerical labels of activities into the corresponding descriptive labels.

#### Step 4 Appropriately labels the data set with descriptive variable names 
1. By examining the data, the following labels could be replaced using the sub() function to achieve much comprehensive and descriptive labels.
    - "^f" replaced with Frequency
    - "^t" replaced with Time
    - "Acc" can be replaced with Accelerometer
    - "-mean.." replaced with Mean
    - "-X" replaced with Xaxis
    - "-Y" replaced with Yaxis
    - "-Z" replaced with Zaxis
    - "-std.." replaced with StandardDeviation.
    - "Gyro" can be replaced with Gyroscope
    - "BodyBody" can be replaced with Body
    - "Mag" can be replaced with Magnitude
    - "Group.1" replaced with Subject
    - "Group.2" replaced with Activities

#### Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
1. Using the aggregate() function to group the tidy data set by activities and subject and taking the mean of each group.
2. Removing the aggregate function generated columns.
3. From Step 4, assign the descriptive header labels to the final tidy data set as its column headers.
4. Using the write.table() function, create a text file called "Tidy_Dataset" that contains the final tidy data set.

