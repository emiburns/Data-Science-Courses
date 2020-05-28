UCI HAR Data Course Project
================

###### Johns Hopkins Data Science Specialization : Course 3 : Course Project : Code Book

![](https://lh4.googleusercontent.com/proxy/uShWh5V5_c4tN6239GW1yy_tTD2cmF9R8cc3YyosbsWXLfD-W0bjlxyqdZDvETGH6MhhsGnr2fFCcU4BDAEzaWPiq82tzf_iNuWJSa_EQZom=s0-d)

## Human Activity Recognition Using Smartphones Dataset

*Version 1.0*

### Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

#### Smartlab - Non Linear Complex Systems Laboratory

#### DITEN - Universit? degli Studi di Genova.

#### Via Opera Pia 11A, I-16145, Genoa, Italy.

#### <activityrecognition@smartlab.ws>

#### [www.smartlab.ws](www.smartlab.ws)

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
‘features\_info.txt’ for more details.

# For each record it is provided:

  - Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope.
  - A 561-feature vector with time and frequency domain variables.
  - Its activity label.
  - An identifier of the subject who carried out the experiment.

# The dataset includes the following files:

  - ‘README.md’: Current file. Description of analysis files for Course
    Project submission

  - ‘CodeBook.md’: Code book with description of the “UCI-HAR-Data”
    data, variables and step-by-step transformations taken to create the
    tidy dataset

  - ‘features.txt’: List of all features utilized as variable names in
    “UCI-HAR-Data” file. Supplement to ‘CodeBook.md’.

  - ‘activity\_labels.txt’: Links the class labels with their activity
    name. Supplement to ‘CodeBook.md’.

  - ‘run\_analysis.R’: R script used to aggregate and clean available
    HAR data into tidy dataset “UCI-HAR-Data”

  - ‘UCI-HAR-Data.txt’: .txt file of independent tidy dataset with the
    average of each variable for each activity and each subject as
    specified by Course Project instructions. Product of
    ‘run\_analysis.R’

# Additional files and resources:

The following files for the train and test data are available
[HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
and were aggregated into the final tidy dataset “UCI HAR Data” via
‘run\_analysis.R’ (both included in dataset files). Their descriptions
are equivalent.

  - ‘train/subject\_train.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

  - ‘test/subject\_test.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

  - ‘features.txt’: List of all features utilized as variable names in
    “UCI HAR DATA” file.

  - ‘activity\_labels.txt’: Links the class labels with their activity
    name.

  - ‘train/X\_train.txt’: Training set.

  - ‘train/y\_train.txt’: Training labels.

  - ‘test/X\_test.txt’: Test set.

  - ‘test/y\_test.txt’: Test labels.

# Notes:

  - Features are normalized and bounded within \[-1,1\].
  - Each feature vector is a row on the text file.

For more information about this dataset contact:
<activityrecognition@smartlab.ws>

# License:

Use of this dataset in publications must be acknowledged by referencing
the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.
