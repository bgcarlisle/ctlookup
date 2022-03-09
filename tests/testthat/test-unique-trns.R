test_that("All TRNs are unique", {
    expect_equal(
        sum(length(unique(trials$trn))),
        sum(length(trials$trn))
    )
})
