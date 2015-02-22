The data was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file was unzipped and it created directory "UCI HAR Dataset" with subdirectories "test" and "train".

An R script was written which combined the test and train data sets to create a raw data frame. This data frame contained columns for Subject ID, Activity Name, and the mean and standard deviation body accelerator measurements for the X, Y and Z plains.

A tidy data set was created from the raw data frame which contained the average measurements for each Subject/Activity combination.   

The tidy data set was written to a text file - tidydata.txt
