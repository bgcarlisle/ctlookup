library(tibble)
test_that("All TRNs are unique", {
    expect_equal(
        sum(length(unique(lookup$trn))),
        sum(length(lookup$trn))
    )
})
