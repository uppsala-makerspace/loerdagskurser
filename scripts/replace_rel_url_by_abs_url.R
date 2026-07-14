#!/bin/env Rscript
# Replace all relative URLs by absolute URLs,
# for https://github.com/uppsala-makerspace/umstutorial

# Usage:
#
# arguments:
# - absolute path to the file
# - absolute URL of that file being online

args <- commandArgs(trailingOnly = TRUE)

if (1 == 2) {
  args <- c(
    "/home/richel/GitHubs/loerdagskurser/docs/kurserna/README.md",
    "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/"
  )
}

testthat::expect_equal(2, length(args))

file_name <- args[1]
testthat::expect_true(file.exists(file_name))
base_url <- args[2]
testthat::expect_silent(httr2::url_build(httr2::url_parse(base_url)))

#' @param base_url URL of the Markdown file with the relative URL
#' @param rel_url relative URL
get_abs_url <- function(
  base_url,
  rel_url
) {
  abs_url_with_readme <- httr2::url_build(httr2::url_parse(rel_url, base_url = base_url))
  stringr::str_replace(abs_url_with_readme, pattern = "README.md", "")
}

testthat::expect_equal(
  get_abs_url(
    base_url = "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/",
    rel_url = "../ditt_foersta_besoek/README.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/ditt_foersta_besoek/"
)

# testthat::expect_equal(
#   get_abs_url(
#     base_url = "https://github.com/uppsala-makerspace/loerdagskurser/blob/main/docs/ditt_foersta_besoek/README.md"
#     rel_url = "../ditt_foersta_besoek/README.md"
#   ),
#   "https://github.com/uppsala-makerspace/loerdagskurser/blob/main/docs/ditt_foersta_besoek/README.md"
# )

text <- readr::read_lines(file_name)
lines_with_rel_urls <- stringr::str_which(text, pattern = "\\[.*\\]\\(.*.md\\)")
for (line_index in  lines_with_rel_urls) {
  line <- text[line_index]
  matches <- stringr::str_match(line, pattern = "\\[.*\\]\\((.*.md)\\)")
  testthat::expect_equal(1, nrow(matches))
  testthat::expect_equal(2, ncol(matches))
  rel_url <- matches[1, 2]
  abs_url <- get_abs_url(base_url = base_url, rel_url = rel_url)
  new_line <- stringr::str_replace(line, pattern = stringr::fixed(rel_url), replacement = abs_url)
  text[line_index] <- new_line
}

readr::write_lines(file_name, text)
