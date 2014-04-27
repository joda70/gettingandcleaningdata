Getting And Cleaning Data
=========================

Download the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
into your local folder, creating the directory "UCI HAR Dataset"

Put run_analysis.R into "UCI HAR Dataset"

Open R or RStudio

Change the current dir to your local folder\UCI HAR Dataset

Run source("run_analysis.R"), which reads the dataset and write the file tidy.txt, a 180x68 data frame.

Use data <- read.table("tidy.txt") to read the created file, which is a 180x68 data frame, because 
there are 30 subjects and 6 activities.
