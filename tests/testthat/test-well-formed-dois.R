test_that("All DOI's are well-formed", {
    expect_equal(
        sum(
            ! grepl(
                  "^10.\\d{4,9}/[-._;()/:A-Z0-9]+$",
                  ctlookup$doi,
                  ignore.case=TRUE
              )
        ),
        0
    )
})
