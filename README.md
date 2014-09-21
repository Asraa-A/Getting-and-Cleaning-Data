Getting-and-cleaning-Data-Project
=================================

* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a working directory.
* Set the working directory in Rstudio to the one containing the data.
* Put run_analysis.R into the same working directory using git bash.
  * Go to the working directory mentioned above using (cd /../.).
  * Initialize a git repo using (git init).
  * Add the https://github.com/yoya86/Getting-and-Cleaning-Data.git using (git remote add origin ..)
  * Download the files using (git pull ...).
* Run source("run_analysis.R"), a new file Data_tidy.txt will be generated in the working directory containing a data frame with 180 
  observations for 68 variables.