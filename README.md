# Second Mini Project (R Programming)
CMSC 197: Introduction to Data Science

### PROBLEM #1
```
Download the zipped file UCI_HAR_Dataset.zip from the LMS. Unzip the file and create a directory ‘specdata’ 
in your local file. DO NOT make any modifications in the files included in the zipped file. The data set is about 
Human Activity Recognition Using Smartphones. The data includes were collected from the accelerometers from the 
Samsung Galaxy S smartphone. You can check the full description of the dataset from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

a. Create an R script called run_analysis.R. The script should include the following:
  • Merges the training and the test sets to create one data set.
  • Extracts only the measurements on the mean and standard deviation for each measurement
  • Uses descriptive activity names to name the activities in the dataset
  • Appropriately labels the data set with descriptive variable names
  • From the data set in step 4, create a second, independent tidy data set with the average of each variable
    for each activity and each subject.
    
b. Create a README.md which explains how all the scripts work and how they are connected. This should 
include the step-by-step procedures that you did in any transformations or how you performed to clean up the 
data until having a tidy data. 

c. Submit the R and md file in your github repository.
```
### PROBLEM #2
````
Download the zipped file household_power_consumption.zip from the LMS. Unzip the file and create a directory 
‘specdata’ in your local file. DO NOT make any modifications in the files included in the zipped file. The data set is 
about the measurements of electric power consumption in one household with a one-minute sampling rate over a 
period of almost 4 years. Different electrical quantities and some sub-metering values are available. The full 
description of the dataset including the 9 variables is at available at 
https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption. 
Loading the data

When loading the dataset into R, consider the following:
  • The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much 
  memory the dataset will require in memory before reading into R. Make sure your computer has 
  enough memory (most modern computers should be fine).
  • We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read 
  the data from just those dates rather than reading in the entire dataset and subsetting to those 
  dates.
  • You may find it useful to convert the Date and Time variables to Date/Time classes in R using 
  the strptime() and as.Date() functions.
  • Note that in this dataset missing values are coded as ?.

Making Plots
Your task is to construct the following plots below using the dataset:
  • Construct the 4 plots in just one R file called plots.R. Write some comments in your R script to 
  separate each part of the script for each plot. Your code should include code for reading the data 
  so that the plot can be fully reproduced. Include also the code that creates the PNG file. 
  • Name each of the generated plot files as plot1.png, plot2.png, plot3.png, and plot4.png
```
