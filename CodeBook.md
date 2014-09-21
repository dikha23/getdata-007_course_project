CodeBook
========

Variables
---------

A variety of variables are left over after the execution of the script:

- X_train, X_test, y_train, y_test, features, activity_labels, subject_train, subject_test are used to load data from disk;
- Activity, Subject, Measurement are used to merge data from the previous data sets;
- tidy1 and tidy2 are used to house the end results of the data manipulation.

Data
----

The data is obtained from the file "UCI HAR Dataset.zip" whose content is described at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Transformations
---------------

The data is first loaded into the first group of variables mentioned above.

It is then merged into the second set of variables: 
- X_train and X_test go in Measurements,
- y_train, y_test and activity_labels go in Activity,
- subject_train and subject_test go in Subject.

Subject, Activity and Measurements are merged into tidy1
tidy1 is simplified into tidy2 by taking the mean of the measurements when grouping by subject and activity.