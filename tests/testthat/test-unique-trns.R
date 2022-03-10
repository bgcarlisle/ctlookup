test_that("All TRNs are unique", {
    expect_equal(
        sum(length(unique(ctlookup$trn))),
        sum(length(ctlookup$trn))
    )
})
