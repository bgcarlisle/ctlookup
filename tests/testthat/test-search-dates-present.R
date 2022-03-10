test_that("All entries have a search date", {
  expect_equal(sum(is.na(ctlookup$search_date)), 0)
})
