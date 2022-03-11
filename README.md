# ctlookup

Matching Trial Registration Numbers (TRNs) to Digital Object
Identifiers (DOIs)

## To install and use

```
install.packages("devtools")
library(devtools)
install_github("bgcarlisle/ctlookup")
library(ctlookup)
data(lookup)
```

This package provides a data frame, `lookup`, which can be loaded via
the *R* package with `data(lookup)`. The same data frame is also
provided as a CSV in this repository as `inst/extdata/lookup.csv`.

`lookup` contains four columns:

| `trn` | `doi` | `preprint_doi` | `search_date` |

Each row in this data frame contains a Trial Registration Number (TRN,
the `trn` column) and a date on which the literature was searched
(`search_date` column as an ISO-8601 formatted date).

If a full journal publication reporting the results of the primary
outcome was found, the corresponding Digital Object Identifier (DOI)
is provided, otherwise this column is `NA`. Abstract-only
publications, protocols, systematic reviews, combined or pooled
reports of multiple trials, subgroup analyses, or other secondary
publications using the data from the trial in question are not
included. In the case of multiple publication of the primary outcome
of a clinical trial, the first publication will be included.

If there is a DOI in the `doi` column, it corresponds to a single full
journal publication of the trial's primary outcome results, and if
that column contains `NA`, there was no such publication found on the
date of search.

Similarly, if a preprint is found that reports a trial's primary
outcome results, it will be reported in the `preprint_doi` column,
otherwise that column will contain `NA`.

The `trn` column contains unique entries, as there can only be one
first full journal publication and one first preprint of a trial's
primary outcome results. Due to multiple registration (a clinical
trial that is registered in multiple registries and reported in a
single publication or preprint), the `doi` and `preprint_doi` columns
are not unique.

Every entry in this data set represents a manual search that has been
manually double-coded to ensure data quality. In many cases, these
data have been taken from previously completed projects, checked for
accuracy and added. See `help(lookup)` for a full list of data
sources.

## To contribute

If you completed a project in which you matched clinical trial
registrations to publications and you would like to contribute your
data:

1. Fork this repository locally.
2. Add a CSV to the `data-raw/` folder with the same four columns as
   the `lookup` data frame (see above). Name the file as follows:
   `[publication year]-[first author]-[first word in publication
   title].csv`, e.g. `2016-carlisle-benefit.csv`. Each row should
   contain data that match the definitions and criteria as specified
   above, and should include only manually-curated literature
   searches, not data that has been scraped automatically from Pubmed
   or ClinicalTrials.gov.
3. Cite the source of these data in `R/lookup.R` using a `@source`
   item, formatted as follows: `@source [First author] et
   al. [Title]. [Journal abbreviation], [Year]. doi: [doi]`.
4. Make a pull request.
5. Your submission will be checked for accuracy and consistency with
   the definitions and inclusion criteria for this data set and merged
   on completion.

## How to cite `ctlookup`

Here is a BibTeX entry for `ctlookup`:

```
@Manual{ctlookup-carlisle,
  Title          = {ctlookup},
  Author         = {Carlisle, Benjamin Gregory},
  Organization   = {The Grey Literature},
  Address        = {Berlin, Germany},
  url            = {https://github.com/bgcarlisle/ctlookup},
  year           = 2022
}
```

If you use this data set and you found it useful, I would take it as a
kindness if you cited it.

Best,

Benjamin Gregory Carlisle PhD
