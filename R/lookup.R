#' Trial Registration Numbers and their corresponding DOIs
#'
#' This contains Trial Registration Numbers (TRNs) that have been
#' manually matched with the corresponding Digital Object Identifier
#' (DOI) for the first full publication of the results for the primary
#' outcome of the trial or its preprint. Abstract-only publications,
#' protocols, systematic reviews, combined or pooled reports of
#' multiple trials, subgroup analyses, or other secondary publications
#' using data from the trial in question are not included. The search
#' date field indicates when the most recent search for the
#' corresponding publication was completed.
#' 
#' @format A tibble with 1 row and 4 variables:
#' \describe{
#'   \item{trn}{chr Trial registry number}
#'   \item{doi}{chr DOI for the first publication of the results of the primary outcome of the trial, NA if none, unique}
#'   \item{preprint_doi}{chr DOI for the preprint of the results of the primary outcome of the trial, NA if none, non-unique due to possible multiple registration}
#'   \item{search_date}{date Date of publication search}
#' }
#'
#' @usage data(lookup)
#'
#' @source Carlisle et al. Benefit, Risk, and Outcomes in Drug Development: A Systematic Review of Sunitinib. J Natl Cancer Inst, 2016. doi: 10.1093/jnci/djv292
#' @source Mattina et al. Inefficiencies and Patient Burdens in the Development of the Targeted Cancer Drug Sorafenib: A Systematic Review. PLOS Biology, 2017. doi: 10.1371/journal.pbio.2000487
"lookup"
