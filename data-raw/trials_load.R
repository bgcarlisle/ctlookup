library(tidyverse)

## Read in all CSVs from the data-raw/ folder
trial_sets <- list.files("data-raw", "\\.csv$")

## Combine all the CSVs into a single data frame
ctlookup <- tribble()
for (trial_set in trial_sets) {

    trials_to_add <- read_csv(paste0("data-raw/", trial_set)) %>%
        select(trn, doi, preprint_doi, search_date)
    ## Each CSV should contain only the following columns:
    ## trn, doi, preprint_doi, search_date
    
    ctlookup <- ctlookup %>%
        bind_rows(
            trials_to_add
        )
}

## Remove duplicate TRNs
ctlookup <- ctlookup %>%
    group_by(trn) %>%
    arrange(search_date) %>%
    slice_tail() %>%
    ungroup()

## Write data set to a CSV in the data/ folder
ctlookup %>%
    write_csv("data/ctlookup.csv")

## Write data set to a .dba file in the data/ folder
usethis::use_data(ctlookup, overwrite = TRUE)
