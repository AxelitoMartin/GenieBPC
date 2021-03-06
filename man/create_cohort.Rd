% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_cohort.R
\name{create_cohort}
\alias{create_cohort}
\title{create_cohort}
\usage{
create_cohort(
  treatment_dat,
  center = NULL,
  regimen = NULL,
  line = NULL,
  stage = NULL,
  stage_dat = NULL
)
}
\arguments{
\item{treatment_dat}{dataframe containing the relevant information for therapies. eg: data_timeline_treatment.txt}

\item{center}{character vector containing the centers to be considered to create the cohort. eg: c("MSK", "DFCI"). By default
all centers found in the dataset inputted will be used.}

\item{regimen}{character vector containing the regimens to be considered to create the cohort.
eg: c("Carboplatin, Pemetrexed Disodium","Cisplatin, Pemetrexed Disodium"). By default
all regimens found in the dataset inputted will be used.}

\item{line}{numberic vector containing the line of therapies to be used to create the cohort. eg: c(1,2), which would keep
regimens specified in the argument above at the lines specified here. By default all lines found will be kept.}

\item{stage}{character vector specifying which stage at initial diagnosis to be considered. (this will be updated to reaching that stage
at any time in the future). Requires additional input below.}

\item{stage_dat}{dataframe containing the relevant staging information. eg: data_timeline_cancer_diagnosis.txt}
}
\description{
This function allows the user to create a relevant cohort for analysis based on histology, specific regimen,
regimen line, stage at diagnosis and centers to be considered.
This will return a dataset containing all patients matching the criterion of interests and their available survival data.
Specifically PFS_I, PFS_M and OS from the start of regimen.
}
