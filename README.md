#README for Getting and Cleaning Data project

All of the code used for this project is contained in the run_analysis.R script.  The script contains sections in its code which match the part sections below.

## References & Settings
This section references the required libraries for the scripts and sets up intial 'settings'/variables.  The dplyr package is referenced, and the dataDirectory variable is set to the expected directory containing the data

##Part 0 - Get Data
This section is used for getting the initial data.  It has been completely commented out as once the data is retrieved, it does not need to be retrieved again.  Note that source data comes as a zip archive file, so must be unzipped to a subfolder matching the defined dataDirectory

##Part 1 - Reference Data
This section loads all the data associated with the reference data.  Both the features data and activity data is used later on when loading/tidying the test and training data sets.  Specifically, the features data is used to set the column names of the data (using the col.names parameter when reading the data in), and the activity data is merged into the datasets

##Part 2 - Test Data
This section loads all the data associated with the test dataset. It starts by loading the test results data, passing the feature names to the col.names parameter.  The data set is then trimmed to just the columns/features that are the mean and standard deviation measurements (using a regular expression to identify these columns).  The subjects and activity label data is read next, with the activity label data joining in the activity names from the activity reference data set read previously.  At the end, all three datasets are combined using the bind_cols function of the dplyr package.

##Part 3 - Train Data
This section loads all the data associated with the training dataset. It starts by loading the training results data, passing the feature names to the col.names parameter.  The data set is then trimmed to just the columns/features that are the mean and standard deviation measurements (using a regular expression to identify these columns).  The subjects and activity label data is read next, with the activity label data joining in the activity names from the activity reference data set read previously.  At the end, all three datasets are combined using the bind_cols function of the dplyr package.

##Part 4 - Combine & Clean
This section combines the test and training data into one dataset (by rows) using the bind_rows function of the dplyr package. The column names are then given meaningful names.

##Part 5 - Summarize & Save
This section summarises the data for each unique combination of subject and activity.  The summary is done to calculate the mean of each measurement column using the summarize_all function of the dplyr package.  The data set is then written/saved to a comma-separated text file.
