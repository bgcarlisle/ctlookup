library(tidyverse)

## Each CSV should contain only the following columns:
## trn, doi, preprint_doi, search_date
trial_sets <- list.files("data-raw", "\\.csv$")

trials <- tribble()

for (trial_set in trial_sets) {

    trials_to_add <- read_csv(paste0("data-raw/", trial_set)) %>%
        select(trn, doi, preprint_doi, search_date)
    
    trials <- trials %>%
        bind_rows(
            trials_to_add
        )
}

trials <- trials %>%
    group_by(trn) %>%
    arrange(search_date) %>%
    slice_tail() %>%
    ungroup()

usethis::use_data(trials, overwrite = TRUE)
