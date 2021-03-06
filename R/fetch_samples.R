#' fetch_samples
#'
#' Add samples for each patients of the cohort of interest
#' @param clin_dat dataframe containing the sample information to be matched with the patients from the cohort of interest.
#' eg: data_clinical_sample.txt.
#' @param cohort_object output object of the create_cohort function.
#' @export
#' @import
#' dplyr
#' dtplyr
#' tibble

fetch_samples <- function(clin_dat, cohort_object){
  full_join(
    dat,
    clin_dat %>%
      rename(time_dob_sequencing = Time..years..from.DOB.to.NGS.sequencing.report) %>%
      mutate(Oncotree.Code = as.character(Oncotree.Code),
             Sequence.Assay.ID = as.character(Sequence.Assay.ID),
             time_dob_sequencing = as.numeric(as.character(time_dob_sequencing))) %>%
      filter(Patient.Identifier %in% cohort_object$ID) %>%
      select(Patient.Identifier, X.Sample.Identifier, Sequence.Assay.ID,
             Oncotree.Code,time_dob_sequencing,
             Sample.Type) %>%
      rename(ID = Patient.Identifier, sample_ID = X.Sample.Identifier),
    by = "ID") %>%
    mutate(regimen_time = as.numeric(as.character(dob)),
           time_regimen_sequencing = time_dob_sequencing*12 -
             regimen_time/30.4375)
}
