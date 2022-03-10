library(tidyverse)

## Read in all CSVs from the data-raw/ folder
trial_sets <- list.files("data-raw", "\\.csv$")

## Combine all the CSVs into a single data frame
lookup <- tribble()
for (trial_set in trial_sets) {

    trials_to_add <- read_csv(paste0("data-raw/", trial_set)) %>%
        select(trn, doi, preprint_doi, search_date)
    ## Each CSV should contain only the following columns:
    ## trn, doi, preprint_doi, search_date
    
    lookup <- lookup %>%
        bind_rows(
            trials_to_add
        )
}

## Remove duplicate TRNs
lookup <- lookup %>%
    group_by(trn) %>%
    arrange(search_date) %>%
    slice_tail() %>%
    ungroup()

## Write data set to a CSV in the data/ folder
lookup %>%
    write_csv("inst/extdata/lookup.csv")

## Write data set to a .dba file in the data/ folder
usethis::use_data(lookup, overwrite = TRUE)
