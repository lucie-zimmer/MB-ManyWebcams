## Explanation of the data files and their contents


### relative_data.csv

Contains data from the remote sample tested with WebGazer. Only includes participants who produced data and were not excluded manually or due to sampling rate.

 * **subid**
    * Explanation: Participant identifier + the seen trial order appended as _A or _B 
    * Values: [LAB]_[SUBJECT-NUMBER]\_[TRIAL-ORDER]
 * **condition**
    * Explanation: A leftover variable by a pilot we ran that supported other conditions, not used in this study
    * Values: always "fam"
 * **aoi**
    * Explanation: specifies the area of interest that the _freq_ is referring to
    * Values:
        * "target": The area with the box where the bear will emerge
        * "distractor": The area with the box where the bear will NOT emerge
        * "none": All other areas, including looks away from the screen
    * Boundaries: each value appears once per _subid_
 * **freq**
    * Explanation: The portion of a participant's looks during the 4000ms long critical time period that fell into the given aoi category
    * Values: floating-point numbers 0.0-1.0
    * Boundaries: the freq values across "distractor", "target", "none" for each _subid_ add up to 1.0
    * Uniquely identified by: _subid_ and _aoi_
 * **data_source**
    * Explanation: A short identifier for the LAB that collected that participant
    * Values: (string identifiers for the participating Labs)
    * Uniquely identified by: _subid_

### transformed_data.csv

Data that specifies which aoi was hit by Participant x Stimulus x Timestamp in the critical time window + 4 seconds. Only includes participants who produced data and were not excluded manually or due to sampling rate.

Uniquely identified by: _subid_ and _aoi_

 * **subid**
    * Explanation: Participant identifier + the seen trial order appended as _A or _B 
    * Values: [LAB]_[SUBJECT-NUMBER]\_[TRIAL-ORDER]
* **age_in_days**
    * Explanation: A leftover variable by a pilot we ran that had this data in the export, not used in this study
    * Values: always 0
* **error_subj**
    * Explanation: A leftover variable by a pilot we ran that had this data in the export, not used in this study
    * Values: always False
* **trial_num**
    * Explanation: The position in which this trial appeared in the stimulus presentation order
    * Values: 1, 2, 3, 4
    * Uniquely identified by: _subid_ and _stimulus_
* **stimulus**
    * Explanation: The name of the stimulus that was presented during the trial 
    * Values: "FAM_RR", "FAM_RL", "FAM_LL", "FAM_LR"
 * **condition**
    * Explanation: A leftover variable by a pilot we ran that supported other conditions, not used in this study
    * Values: always "fam"
 * **sampling_rate**
    * Explanation: The average sampling rate that the specific participant's device exhibited during the trial
    * Values: positive floating-point numbers
    * Uniquely identified by: _subid_ and _stimulus_
 * **t...0...8000**
    * Explanation: The timestamp in ms of the recorded data point, starting from the point at which the bear enters the tunnel and extending to 4 seconds after the bear exits the tunnel
    * Values: integers ranging from 0 - 8000
 * **aoi**
    * Explanation: specifies the area of interest that was hit at that point in time
    * Values:
        * "target": The area with the box where the bear will emerge
        * "distractor": The area with the box where the bear will NOT emerge
        * "none": All other areas, including looks away from the screen
    * Uniquely identified by: _subid_ and _stimulus_ and _t...0..8000_
 * **data_source**
    * Explanation: A short identifier for the LAB that collected that participant
    * Values: (string identifiers for the participating Labs)
    * Uniquely identified by: _subid_

### pilot_data.csv

This file contains data collected during a pilot study of MB2 using in-lab eye-trackers.
 * **subid**
    * Explanation:unique (within lab) ID for the participant
    * Values: <participant ID codes>
 * **lab**
    * Explanation:unique lab ID in the follow format: enter first the name of your institution (e.g. <lmu>) then your or your lab's name (e.g. 
      <babylab>), separated by an underscore
    * Values: e.g., lmu_babylab
 * **stimulus**
    * Explanation: The name of the stimulus that was presented during the trial 
    * Values: e.g., FAM_LL1_1280x960.aviv, FAM_LR2_1280x960.avi, ...
 * **trial_id**
    * Explanation: A leftover variable by the pilot studies of Schuwerk, Kampis et al. (2022) that had this data in the export, not used in this study
    * Values: above 0
 * **age**
    * Explanation:chronological age in days.
    * Values: 1-max age in days, or NA
 * **t**
    * Explanation: The timestamp in ms of the recorded data point
    * Values: integers ranging from -31125 to 8200.
 * **aoi**
    * Explanation: specifies the area of interest that was hit at that point in time
    * Values: "target" = The area with the box and tunnel exit where the bear will emerge; "distractor" = The area with the box and the tunnel exit where 
      the bear will NOT emerge
 * **trial_num**
    * Explanation: which trial number was it?
    * Values: 1, 2, 3, 4
 * **error**
    * Explanation: A leftover variable by the pilot studies of Schuwerk, Kampis et al. (2022) that had this data in the export, not used in this study
    * Values: always "FALSE"
 * **experiment_num**
    * Explanation: which experiment was it? (not used in this study)
    * Values: pilot_1a or pilot_1b_outcome
 * **experiment**
    * Explanation: which number of pilots/experiments was it? (not used in this study)
    * Values: 1a or 1b
 * **error_subj**
    * Explanation: A leftover variable by the pilot studies of Schuwerk, Kampis et al. (2022) that had this data in the export, not used in this study
    * Values: always "FALSE"
 * **time_range**
    * Explanation: A leftover variable by the pilot studies of Schuwerk, Kampis et al. (2022) that had this data in the export, not used in this study
    * Values: above 0

### demographic_data.csv

Demographic data that was collected with survey tools during the experiments' sessions. Also contains some experimenter and experiment data. 
Each row refers to one participant, so all values are uniquely identified by _subid_.
 * **lab**
    * Explanation:unique lab ID in the following format
    * Values: [acronym of your institution, not longer than 4 characters]_[city of your institution] (e.g. <LMU_Munich>)
 * **subid**
    * Explanation: unique ID for the participant
    * Values: [acronym of your institution, not longer than 4 characters]_[participant number, starting with 001] (e.g. <LMU_569>)
 * **RA**
    * Explanation: unique RA identifier (name or anonymous code)
    * Values: <your experimenter IDs>
 * **trial_sequence**
    * Explanation: which of the two trial orders was used for this participant?
    * Values: A, B
 * **session_error**
    * Explanation: (data should be excluded) - note, do not use this field for individual trial level errors if the participant is still going to be 
      included.
    * Values: noerror, error
 * **session_error_type**
    * Explanation: NA if no error; suggestions are “experimenter error” or “technical error"
    * Values: (open ended)
 * **note**
    * Explanation: NA if you have nothing to note, you could add her information such as 'child was very tired'
    * Values: (open ended)
 * **participant_gender**
    * Explanation: Gender of the participant (NC for unknown)
    * Values: boy, girl, other, NC
 * **age_days**
    * Explanation: chronological age in days.
    * Values: 1-max age in days, or NA
 * **gestation_week**
    * Explanation: In which week of pregnancy was the child born?
    * Values: above 0
 * **residence_country**
    * Explanation: Place of residence (country) of the participant.
    * Values: e.g. Germany, Italy,...
 * **daycare**
    * Explanation: Is the child currently in daycare?
    * Values: yes, no
 * **hours_week_daycare**
    * Explanation: sum of hours the child usually spends in daycare per week (or NA if child is not in daycare)
    * Values: above 0
 * **lang1**
    * Explanation: Native or most-heard language
    * Values: e.g., German, Italian,...
 * **lang1_exposure**
    * Explanation: Percentage exposure to lang1. Note that exposures to all languages for a child should sum to 100!
    * Values: 0-100
  * **lang2**
    * Explanation: Second most-heard language (or NA if no second language)
    * Values: e.g., German, Italian,...
 * **lang2_exposure**
    * Explanation: Percentage exposure to lang2 (or NA if no second language)
    * Values: 0-100
  * **lang3**
    * Explanation: Third most-heard language (or NA if no third language)
    * Values: e.g., German, Italian,...
 * **lang3_exposure**
    * Explanation: Percentage exposure to lang3 (or NA if no third language)
    * Values: 0-100
 * **hearing**
    * Explanation: “yes” if potential exclusion based on hearing
    * Values: yes, no
 * **hearing_info**
    * Explanation: briefly explain if prev is yes
    * Values: (open ended)
 * **vision**
    * Explanation: “yes” if potential exclusion based on vision
    * Values: yes, no
 * **vision_info**
    * Explanation: briefly explain if prev is yes
    * Values: open ended)
 * **cognitive_developmental**
    * Explanation: “yes” if potential exclusion based on cognitive development
    * Values: yes, no
 * **cognitive_developmental_info**
    * Explanation: briefly explain if prev is yes
    * Values: open ended)
 * **sib1_age**
    * Explanation: age in months of oldest sibling, or NA if no sibling
    * Values: 0 or higher
 * **sib1_gender**
    * Explanation: sib1 gender, or NA if no sibling, NC if unknown
    * Values: boy, girl, other, NA, NC
 * **sib2_age**
    * Explanation: age of next sibling in months (or NA if no second sibling)
    * Values: 0 or higher
 * **sib2_gender**
    * Explanation: sib2 gender, or NA if no second sibling, NC if unknown
    * Values: boy, girl, other, NA, NC
 * **sib3_age**
    * Explanation: age of next sibling in months (or NA if no third sibling)
    * Values: 0 or higher
 * **sib3_gender**
    * Explanation: sib3 gender, or NA if no third sibling, NC if unknown
    * Values: boy, girl, other, NA, NC
 * **sib4_age**
    * Explanation: age of next sibling in months (or NA if no fourth sibling)
    * Values: 0 or higher
 * **sib4_gender**
    * Explanation: sib4 gender, or NA if no sibling, NC if unknown
    * Values: boy, girl, other, NA, NC
 * **sib5_age**
    * Explanation: age of next sibling in months (or NA if no fifth sibling)
    * Values: 0 or higher
 * **sib5_gender**
    * Explanation: sib5 gender, or NA if no sibling, NC if unknown
    * Values: boy, girl, other, NA, NC
 * **parentA_gender**
    * Explanation: parent A's gender (NC if unkown or parent prefered not to answer)
    * Values: man, woman, other, NC
 * **parentA_native_lang1**
    * Explanation: Native language (if more than one, add others to variables below)
    * Values: e.g. English, Chinese, etc.
 * **parentA_native_lang2**
    * Explanation: Further Native language
    * Values: e.g. English, Chinese, etc.
 * **parentA_native_lang3**
    * Explanation: Further Native language
    * Values: e.g. English, Chinese, etc.
 * **parentA_education**
    * Explanation: parent A's years of education after Kindergarden (e.g. in the US 12 = finish high school, 14 = finish associates degree, etc.)
    * Values: 0-30
  * **parentB_gender**
    * Explanation: parent B's gender (NC if unkown or parent prefered not to answer)
    * Values: man, woman, other, NC
 * **parentB_native_lang1**
    * Explanation: Native language (if more than one, add others to variables below)
    * Values: e.g. English, Chinese, etc.
 * **parentB_native_lang2**
    * Explanation: Further Native language
    * Values: e.g. English, Chinese, etc.
 * **parentB_native_lang3**
    * Explanation: Further Native language
    * Values: e.g. English, Chinese, etc.
 * **parentB_education**
    * Explanation: parent B's years of education after Kindergarden (e.g. in the US 12 = finish high school, 14 = finish associates degree, etc.)
    * Values: 0-30
 * **recruitment**
    * Explanation: Labid of the lab that recruited the participant
    * Values: e.g., LMU
 * **anything_else**
    * Explanation: Did caregivers report anthing else in the questionnaire?
    * Values: (open ended)

### excluded_trials.csv

This file indicated whether trials were considered to adhere to our inclusion criteria after manual inspection of the webcam footage. The file is only here to aid in reporting exclusions.

* **id**
    * Explanation: Participant identifier
    * Values: [LAB]_[SUBJECT-NUMBER]
* **FAM1**, **FAM2**, **FAM3**, **FAM4**
    * Explanation: specifies which stimulus was shown at the given position in the presentation order
    * Values: "FAM_RR", "FAM_RL", "FAM_LL", "FAM_LR"
* **FAM1_OK**, **FAM2_OK**, **FAM3_OK**, **FAM4_OK**
    * Explanation: indicates wether the trial specified in the previous column is fit for inclusion or not
    * Values:
        * yes: Trial included
        * no: Trial excluded
* comment
    * Explanation: comments by the researcher performing the manual check
    * Values: arbitrary strings

### excluded_trials_samplingrate.txt

This file contains a list of trials that were excluded during the preprocessing steps because the device/browser did not supply a sufficient samplingrate (therefore NOT appearing in `relative_data.csv` and `transformed_data.csv`). The file is only here to aid in reporting exclusions.

* A list of trials in the format [LAB]_[SUBJECT-NUMBER]\_[STIMULUS-NAME], given in a python list format (this was due to a non-streamlined preprocessing workflow)

### participants_excluded_after_pre.txt

This file contains a list of participants that were not excluded during the preprocessing steps ( therefore appearing in `relative_data.csv` and `transformed_data.csv`), but are supposed to be ignored by the analysis script (e.g. analysis of demographic data revealed that they do not meet certain inclusion criteria, certain data is missing). 

* One subid per row, without the trial order appendix 

### ManyWebcams_Exclusion_final.txt

This file contains a list of all subjects that were excluded from the study. Used only for exclusion reporting and to filter device and validation data in `validation_useragent.R`.

* One subid per row, without the trial order appendix (rows starting with # contain no subject information) 

### extraction_from_raw/data_validation_useragent.csv

Data about the devices that participants used as well as validation data generated by jsPsych's WebGazer validation trials. Includes all participants that we successfully collected data on, regardless if they were later excluded or not.

One row per participant, so all rows are uniquely identified by _id_

* **id**
    * Explanation: Participant identifier
    * Values: [LAB]_[SUBJECT-NUMBER]
* **browser_family**
    * Explanation: The browser family (e.g. Chrome, Firefox) used by the participant to access the experiment, as extracted from the useragent
    * Values: arbitrary strings
* **browser_version**
    * Explanation: The browser version used by the participant to access the experiment, as extracted from the useragent
    * Values: strings consisting of integers and dots
* **os_name_for_study**
    * Explanation: A simplified name of the operating system used by the participant to access the experiment, created from os_family and os_version
    * Values: arbitrary strings
* **os_family**
    * Explanation: The operating system family (e.g. Mac OS X, Windows) used by the participant to access the experiment, as extracted from the useragent
    * Values: arbitrary strings
* **os_version**
    * Explanation: The operating system version used by the participant to access the experiment, as extracted from the useragent
    * Values: strings consisting of integers and dots
* **device_family**
    * Explanation: The device family (e.g. Mac, other) used by the participant to access the experiment, as extracted from the useragent
    * Values: arbitrary strings
* **window_width**
    * Explanation: Width of the browser window in pixels - assumed to equal screen dimensions, as the experiment was conducted in fullscreen mode
    * Values: positive integers
* **window_height**
    * Explanation: Height of the browser window in pixels - assumed to equal screen dimensions, as the experiment was conducted in fullscreen mode
    * Values: positive integers
* **roi_radius**
    * Explanation: Radius circular area of interest for the jsPsych WebGazer validation. Unused in current study.
    * Values: always 200
* **avg_offset__[x|y]\__[0|1]**
    * Explanation: The average validation offset from the center in [x|y] direction at timepoint [0|1] specified in pixels
    * Values: positive floating-point numbers
* **mean_distance_[0|1]**
    * Explanation: The mean distance of gazes from the center in pixels during validation at timepoint [0|1]
    * Values: positive floating-points
* **avg_offset_[x|y]\_percent_[0|1]**
    * Explanation: The average validation offset from the center in [x|y] direction at timepoint [0|1] specified in precentage of window [width|height]
    * Values: positive floating-point numbers indicating percentage values
* **gaze_percent_in_roi_[0|1]**
    * Explanation: Percentage of gazepoints that fell into the area of interest for the jsPsych WebGazer validation at timepoint [0|1]. Unused in current study.
    * Values: positive floating-point numbers
