test_that("All TRN's are well-formed", {

    ## Define well-formed TRN's using very "strict" regexes for QA
    ## purposes. If you want more "forgiving" regexes for higher
    ## sensitivity, I recommend the ones documented here:
    ## https://github.com/maia-sh/ctregistries/
    strict_regexes <- tribble(
        ~registry,            ~regex,
        "ClinicalTrials.gov", "^NCT\\d{8}$",
        "DRKS",               "^DRKS\\d{8}$",
        "EudraCT",            "^\\d{4}-\\d{6}-\\d{2}$"
    )
    
    ## Combine into a single regex
    combined_regexes <- paste(strict_regexes$regex, collapse="|")

    ## Test that none of the TRN's fails to match
    expect_equal(
        sum(
            ! grepl(
                  combined_regexes,
                  lookup$trn
              )
        ),
        0
    )
})
