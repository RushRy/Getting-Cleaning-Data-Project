#Codebook for Getting and Cleaning Data project

##Data Source
The data in this repository comes from the UCI Machine Learning Repository, Human Activity Recognition Using Smartphones Data Set.
Data available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

##Data
There are 68 variables in the dataset.  The first two form the primary key:
* subjectid: represents the ID of the subject the observations were taken from
* activityname: a factor column indicating the activity at the time of the observation

The other 66 variables are the mean and standard deviation columns from the original dataset.  Names were transformed to be human readable based on the following convention:
* Time <- t
* Fourier <- f
* Accelerometer <- Acc
* Gyroscope <- Gyro
* Mean <- mean
* StdDev <- std
* Magnitude <- Mag

Therefore, the names of the remaining 66 variables are:
* TimeBodyAccelerometerMeanX
* TimeBodyAccelerometerMeanY
* TimeBodyAccelerometerMeanZ
* TimeBodyAccelerometerStdDevX
* TimeBodyAccelerometerStdDevY
* TimeBodyAccelerometerStdDevZ
* TimeGravityAccelerometerMeanX
* TimeGravityAccelerometerMeanY
* TimeGravityAccelerometerMeanZ
* TimeGravityAccelerometerStdDevX
* TimeGravityAccelerometerStdDevY
* TimeGravityAccelerometerStdDevZ
* TimeBodyAccelerometerJerkMeanX
* TimeBodyAccelerometerJerkMeanY
* TimeBodyAccelerometerJerkMeanZ
* TimeBodyAccelerometerJerkStdDevX
* TimeBodyAccelerometerJerkStdDevY
* TimeBodyAccelerometerJerkStdDevZ
* TimeBodyGyroscopeMeanX
* TimeBodyGyroscopeMeanY
* TimeBodyGyroscopeMeanZ
* TimeBodyGyroscopeStdDevX
* TimeBodyGyroscopeStdDevY
* TimeBodyGyroscopeStdDevZ
* TimeBodyGyroscopeJerkMeanX
* TimeBodyGyroscopeJerkMeanY
* TimeBodyGyroscopeJerkMeanZ
* TimeBodyGyroscopeJerkStdDevX
* TimeBodyGyroscopeJerkStdDevY
* TimeBodyGyroscopeJerkStdDevZ
* TimeBodyAccelerometerMagnitudeMean
* TimeGravityAccelerometerMagnitudeMean
* TimeBodyAccelerometerJerkMagnitudeMean
* TimeBodyGyroscopeMagnitudeMean
* TimeBodyGyroscopeJerkMagnitudeMean
* TimeBodyAccelerometerMagnitudeStdDev
* TimeGravityAccelerometerMagnitudeStdDev
* TimeBodyAccelerometerJerkMagnitudeStdDev
* TimeBodyGyroscopeMagnitudeStdDev
* TimeBodyGyroscopeJerkMagnitudeStdDev
* FourierBodyAccelerometerMeanX
* FourierBodyAccelerometerMeanY
* FourierBodyAccelerometerMeanZ
* FourierBodyAccelerometerStdDevX
* FourierBodyAccelerometerStdDevY
* FourierBodyAccelerometerStdDevZ
* FourierBodyAccelerometerJerkMeanX
* FourierBodyAccelerometerJerkMeanY
* FourierBodyAccelerometerJerkMeanZ
* FourierBodyAccelerometerJerkStdDevX
* FourierBodyAccelerometerJerkStdDevY
* FourierBodyAccelerometerJerkStdDevZ
* FourierBodyGyroscopeMeanX
* FourierBodyGyroscopeMeanY
* FourierBodyGyroscopeMeanZ
* FourierBodyGyroscopeStdDevX
* FourierBodyGyroscopeStdDevY
* FourierBodyGyroscopeStdDevZ
* FourierBodyAccelerometerMagnitudeMean
* FourierBodyAccelerometerMagnitudeStdDev
* FourierBodyAccelerometerJerkMagnitudeMean
* FourierBodyAccelerometerJerkMagnitudeStdDev
* FourierBodyGyroscopeMagnitudeMean
* FourierBodyGyroscopeMagnitudeStdDev
* FourierBodyGyroscopeJerkMagnitudeMean
* FourierBodyGyroscopeJerkMagnitudeStdDev

##Transformations
As mentioned above, the names of the observation measurements were transformed to be human readable.  Also, the tidy data set is the combination of the original test and training data sets.  Each measurement variable is the average of the measurement for that subject/activity/feature combination.
