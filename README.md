# ManyWebcams Analysis Script


This repo contains the analysis script for the [MB-ManyWebcams](https://manybabies.github.io/MB-ManyWebcams/).
For instructions on how to generate data and further information on the study, refer to the [experiment's repository](https://github.com/adriansteffan/manywebcams-eyetracking).


## Setup

To run the script, installations of [R](https://cran.r-project.org/bin/windows/base/) and [RStudio](https://www.rstudio.com/) are required.

Unpack `pilot_data.csv.zip` and put `pilot_data.csv` into the root directory. This csv contains the data of the in-lab eyetracking study against which the MB-ManyWebcams results are to be compared.

When opening `manywebcams_analysis.R` in R Studio, you will be automatically prompted to install the dependencies of the script.

## Example data

The files

- demographic_data.csv
- relative_data.csv
- excluded_trials.csv
- excluded_trials_samplingrate.txt
- participants_excluded_after_pre.txt

contain example data that the LMU lab collected during the MB-ManyWebcams study.

If you only want to analyze data from a singular source/lab, replace these files and run the script.

## Merging multiple data sources

If data from multiple sources needs to be combined, create a `lab_data` folder in the root directory of the repository and arrange the data in the following structure: 

```
├── manywebcams_analysis.R
├── README.md
└── lab_data
    │
    ├── LABNAME_01
    │   ├── demographic_data.csv
    │   ├── relative_data.csv
    │   ├── excluded_trials.csv
    │   ├── excluded_trials_samplingrate.txt
    │   └── participants_excluded_after_pre.txt (optional)
    ├── LABNAME_02
    │   └── ...
    ...
```

The folder names can be freely chosen and should identify the lab that collected that subset of data. If a lab_data folder is present, the script will ignore the top-level data files and work with the merged data table.

## Preparing the data for this script (reproducibility)

Due to the continuous development of the experiment software,the data pipeline was not streamlined in time for the MB-ManyWebcams study. Therefore, the following paragraphs explain how all of the input files for the analysis script are created. 

#### relative_data.csv

This file is generated by running the preprocessing script from the [experiment's repository](https://github.com/adriansteffan/manywebcams-eyetracking).

#### excluded_trials.csv

This file is created manually when checking if participant trial videos match the inclusion criteria. See the [experiment's repository](https://github.com/adriansteffan/manywebcams-eyetracking) for further information about the structure of these files. Make sure the csv uses ; as a separator. While the trial data for these excluded trials was already filtered during preprocessing, these files are needed to report the number of excluded trials.

#### excluded_trials_samplingrate.txt

When running the preprocessing script from the [experiment's repository](https://github.com/adriansteffan/manywebcams-eyetracking), it will print a list of to the trials that were excluded due to an insufficient sampling rate to the console. While the trial data for these excluded trials was already filtered during preprocessing, these files are needed to report the number of excluded trials.

#### participants_excluded_after_pre.txt

If any participant needs to be excluded from the data after the preprocessing is already done, this file (containing one participant ID per line {TODO: How does this look??}.) can be optionally included to make the analysis script ignore the participants.

#### demographic_data.csv

This file is created manually by filling in the "Individual Lab Participants Data" template, which can be downloaded [here](https://docs.google.com/spreadsheets/d/14XckZ6vg7hWV7BC7dj9ga30o0aiEO7v2l_2XQZHV57M/edit#gid=0). The project specific [data validator](https://manybabies.shinyapps.io/validator/) should be used to check whether everything is formatted correctly. Make sure the csv uses ; as a sepearator.

#### ManyWebcams_Exclusion.txt

This file is created manually and contains the IDs of all excluded participants and the reasons for their exclusion.
