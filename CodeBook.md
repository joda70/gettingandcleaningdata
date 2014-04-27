Code Book
=========

## The input data:

* train/X_train.txt; 
* test/X_test.txt; 
* train/subject_train.txt; 
* test/subject_test.txt;
* train/y_train.txt; 
* test/y_test.txt;
* features.txt contains some measurements;
* activity_lables.txt contains descriptive activity names.

## The variables

X binds train/X_train.txt with test/X_test.txt.

Y binds train/y_train.txt with test/y_test.txt.

subject binds train/subject_train.txt with test/subject_test.txt.

## Work to clean up the data

All feature names and activity labels are converted to lower case, while underscore and brackets are removed.

## The output data 

The result is saved in the tidy.txt file, a 180x68 data frame:
* the first column contains subject IDs;
* the second column contains activity names;
* the columns 3-68 contain the averages for each of the 66 attributes. 
 
There are 30 subjects and 6 activities, generating 180 rows in this data.
