# ManyWebcams Analysis Script

This repo contains the analysis script for the [MB-ManyWebcams](https://manybabies.github.io/MB-ManyWebcams/).
For instructions on how to generate data and further information on the study, refer to the [experiments repository](https://github.com/adriansteffan/manywebcams-eyetracking).


## Setup

To run the script, installations of [R](https://cran.r-project.org/bin/windows/base/) and [RStudio](https://www.rstudio.com/) are required.

Unpack `pilot_data.csv.zip` and put `pilot_data.csv` into the root directory. This csv contains the data of the in-lab eyetracking study against which the MB-ManyWebcams results are to be compared.

When opening `manywebcams_analysis.R` in R Studio, you will be automatically prompted to install the dependencies of the script.

## Example data

The files

* relative_data.csv
* demographic_data.csv

contain example data from preliminary results of the MB-ManyWebcams study (as presented at the CDS 2022 conference).

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
    │   └── console_output.txt
    ├── LABNAME_02
    │   └── ...
    ...
```

The folder names can be freely chosen and should identify the lab that collected that subset of data. If a lab_data folder is present, the script will ignore the top-level data files and work with the merged data table.
