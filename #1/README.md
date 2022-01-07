---
output: html_document
---

## run_analysis.R description
The original data in this dataset has been reshaped in order to have all of the necessary information in a single tidy dataset. After loading packages and reading files, the train and test datasets now include the subject and activity information. Moreso, the resulting train and test datasets were also merged or combined. Following that, only a subset of the features, those with the mean and standard deviation values, were extracted. Variable names have been replaced by removing special characters and expanding the names into a much more comprehensible one. 

The first resulting dataset for this problem is a tidy data data frame with 68 variables and 10299 observations. Consequently, the second and final resulting dataset is tidy data with 68 variables and 180 observations which contains the mean of all variables for each subject and activity and is contained in a text file called Tidy_Data.txt.

### General Procedure
Generally, the following steps were taken in order to achieve the final tidy data for this problem.

- The first step taken was to load the packages needed in solving the problem.

- Reading and storing the test (test_subject, test_Y, and test_X files) and train (train_subject, train_X, and train_Y files) data to variables that will be used in the solution of this problem.

- In order to add measurement headings to the test data, I used the features.txt file to extract header values.

- Then, putting together the test data by column binding the train_subject, train_Y, and train_X files.

- The same process as the previous steps 3 and 4 were also done to the train data set where I also add header names to the measurement values in the train data and column bound the train_subject, train_X, and train_Y files.

- Merging the train and test data set using rbind() function to get a merged_data.

- Filtering or extracting only the mean and standard deviation values from all the measurements in the header_features. 

- Creating the first tidy data data frame which only contains the mean and stdv measurement values.

- Replacing the numeric labels (1, 2, 3, 4, 5, 6) with descriptive activity names (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) from the activity_labels.txt, respectively.

- Taking the mean of each activity for each subject.

- Expanding the measurement variable names to be more descriptive and understandable.

- Creating and saving the final tidy data in a text file Tidy_Data.

### Specific Process
#### Line by line explanation of code

- Line 2 is the instruction for loading the required package to be used in the solution of this problem, that is in this case I used the data.table package.

- Line 6 to 8 is the reading of the test data sets namely subject_test (Subject), y_test (Activities), and X_test (measurements) files.

- Line 7 to 13 is the reading of the train data sets namely subject_train (Subject), y_train (Activities), and X_train (measurements) files.

- Line 16 is the reading of the features text file.

- Line 19 is the instruction for extracting the features$V2 column from the features data table to a vector which is then assigned in header_features. 

- Line 22 is the instruction for assigning the header_features as a header for the test_X data table which primarily contains measurement values.

- Line 25 and 28 is the extraction of the Subject and Activities from the test_subject and test_Y to a vector, respectively, and assigning it to Subject and Activities variable names.

- Line 31 is the process for binding the Activities and Subjects with the measurement values from the test_X column wise.

- Line 34, the same process with line 22 is applied here such that header_features is assigned as a header to the train_X measurement values.

- Line 37 and 40 adopts the same instruction from Lines 25 and 28, however in this case Subject and Activities come from train_subject and train_Y, respectively.

- Line 43 is the same instruction as with Line 31 however in this instruction I am binding the Activities and Subject with the measurement values from train_X by column.

- Line 46 is the instruction for merging the test and train data sets by row and then stored in the variable merged_data.

- Line 51 and 54 is the extraction of the measurements in means and standard deviation of each measurement which is stored in the header_features variable with values mean() and std(). I am using grep() function to search for matches of "mean()" and "std()" strings. Matches of means is stored in mean_values variable while matches with std are stored in std_values variable.

- Line 57 is the instruction for combining the mean_values, std_values and the Subject and Activities.

- Line 60 is the process or instruction for tidying the data using the subset() function to select the mean_and_std from the merged_data and assign it to tidy_data variable.

- Lines 65 to 70 are for replacing numerical variable names with descriptive variable names as found in activity_labels text file. The instruction is done by using the gsub() function to search for the activity names(1st argument) and replacing them with descriptive ones' (2nd argument) from the tidy_data activities column then assigning them back to the same column.

- Line 75 is the instruction for creating a second, independent tidy data set (final_tidy_data) which contains the average of each variable(activities and subjects) such that I used the aggregate() function to compute for the summary statistics (mean) for the subset of the data (subject and activities). The arguments for this function is the tidy_data , the list of variables (Subject, Activities), and the function (FUN = mean) which is the mean for which to be applied.

- Line 78 is for the removal of the generated columns by the aggregate function in Line 75.

- Line 82 is for assigning the column names or header names of the final_tidy_data to the header_values. This will be used for appropriately labeling the data set by replacing it with descriptive header names.

- Line 86 to 98 is the instruction for replacing the given strings (which can be identified by running the names(final_tidy_data)) which is given as the first argument of the sub-function, into a much expounded and comprehensible header name (2nd argument of the sub-function).

- Line 103 is the instruction for assigning back the descriptive variable names to the data frame final_tidy_data. Moreover, this is the resulting tidy data set for this problem.

- Line 107 is the code for creating the Tidy_Data file which contains final_tidy_data contents using the write.table function. The name of the file for the final tidy data is Tidy_data which can be found in the same directory as the run_analysis.R.
