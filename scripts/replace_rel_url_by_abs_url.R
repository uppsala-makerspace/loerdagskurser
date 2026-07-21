#!/bin/env Rscript

# Replace all relative URLs by absolute URLs,
# for https://github.com/uppsala-makerspace/umstutorial
#
# This scripts assumes:
# - You are using MkDocs
# - All content is only in direct subfolders of 'docs',
#   e.g. 'docs/kurserna',
#   and not e.g. 'docs/kurserna/om_arduinokursen'
#
# Usage:
#
# arguments:
#
# - absolute path to the file with relative paths
# - mkdocs_page_url:
#   absolute URL of that file being online.
#   This URL must exist

args <- commandArgs(trailingOnly = TRUE)

if (1 == 2) {
  setwd("/home/richel/GitHubs/loerdagskurser")
  args <- c(
    "/home/richel/GitHubs/loerdagskurser/docs/kurserna/README.md",
    "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/"
  )
  args <- c(
    "docs/volontaerer/bli_entreevaerd_generated_en.md",
    "https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/"
  )
  args <- c(
    "docs/volontaerer/bli_entreevaerd_generated_en.md",
    "https://uppsala-makerspace.github.io/loerdagskurser/volontaerer"
  )
  args <- c(
    "/home/richel/GitHubs/loerdagskurser/docs/kurserna/om_arduinokursen_generated_sv.md",
    "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/om_arduinokursen"
  )
}

testthat::expect_equal(2, length(args))

file_name <- args[1]
testthat::expect_true(file.exists(file_name))
mkdocs_page_url <- args[2]
testthat::expect_silent(httr2::url_build(httr2::url_parse(mkdocs_page_url)))

if (!RCurl::url.exists(mkdocs_page_url)) {
  stop(
    "ERROR: mkdocs_page_url '", mkdocs_page_url, "' does not exist.\n",
    "\n",
    "- working directory: ", getwd(),"\n",
    "- args[1] == file_name: ", file_name,"\n",
    "- args[2] == mkdocs_page_url: ", mkdocs_page_url, "\n",
    "\n",
    "ABORTED PROGRAM\n"
  )

}

#' @param mkdocs_page_url URL of the Markdown file with the relative URL
#' @param rel_url relative URL
#' @return a URL without a trailing backslash
get_abs_url <- function(
  mkdocs_page_url,
  rel_url
) {
  testthat::expect_true(RCurl::url.exists(mkdocs_page_url))
  # Expects a trailing backslash
  if (stringr::str_detect(mkdocs_page_url, "[:alnum:]$")) {
    mkdocs_page_url <- paste0(mkdocs_page_url, "/")
  }
  testthat::expect_true(stringr::str_detect(mkdocs_page_url, "/$"))

  n_slashes_in_url <- stringr::str_count(mkdocs_page_url, "/")
  is_in_folder <- n_slashes_in_url == 5
  is_in_subfolder <- n_slashes_in_url == 6
  testthat::expect_true(is_in_folder || is_in_subfolder)

  if (is_in_subfolder) {
    abs_url_with_readme <- httr2::url_build(
      httr2::url_parse(paste0("../", rel_url), base_url = mkdocs_page_url)
    )
  } else {
    abs_url_with_readme <- httr2::url_build(
      httr2::url_parse(rel_url, base_url = mkdocs_page_url)
    )
  }
  abs_url_with_md <- stringr::str_replace(
    abs_url_with_readme, pattern = "README.md", ""
  )
  abs_url <- stringr::str_replace(
    abs_url_with_md,
    pattern = "\\.md", ""
  )

  # Remove a trailing backslash
  abs_url <- stringr::str_replace(abs_url, "/$", "")
  testthat::expect_false(stringr::str_detect(abs_url, "/$"))

  # This would be a replacement gone wroung
  testthat::expect_false(stringr::str_detect(abs_url, "/volontaere/"))

  # Do not test here
  # testthat::expect_true(RCurl::url.exists(abs_url))

  abs_url
}

testthat::expect_equal(
  get_abs_url(
    mkdocs_page_url = "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/",
    rel_url = "../ditt_foersta_besoek/README.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/ditt_foersta_besoek"
)
testthat::expect_equal(
  get_abs_url(
    mkdocs_page_url = "https://uppsala-makerspace.github.io/loerdagskurser/kurserna",
    rel_url = "../ditt_foersta_besoek/README.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/ditt_foersta_besoek"
)
testthat::expect_equal(
  get_abs_url(
    mkdocs_page_url = "https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/",
    rel_url = "../kontakta_oss.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/kontakta_oss"
)
testthat::expect_equal(
  get_abs_url(
    mkdocs_page_url = "https://uppsala-makerspace.github.io/loerdagskurser/volontaerer",
    rel_url = "../kontakta_oss.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/kontakta_oss"
)
testthat::expect_equal(
  get_abs_url(
    mkdocs_page_url = "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/om_arduinokursen",
    rel_url = "README.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/kurserna"
)
# NEW
testthat::expect_equal(
  get_abs_url(
    mkdocs_page_url = "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/om_arduinokursen",
    rel_url = "om_loedningskursen.md"
  ),
  "https://uppsala-makerspace.github.io/loerdagskurser/kurserna/om_loedningskursen"
)

text <- readr::read_lines(file_name)
lines_with_rel_urls <- stringr::str_which(text, pattern = "\\[.*\\]\\(.*.md\\)")
for (line_index in  lines_with_rel_urls) {
  line <- text[line_index]
  matches <- stringr::str_match(line, pattern = "\\[.*\\]\\((.*.md)\\)")
  testthat::expect_equal(1, nrow(matches))
  testthat::expect_equal(2, ncol(matches))
  rel_url <- matches[1, 2]
  abs_url <- get_abs_url(mkdocs_page_url = mkdocs_page_url, rel_url = rel_url)

  if (!RCurl::url.exists(abs_url)) {
    stop(
      "ERROR: abs_url '", abs_url, "' does not exist.\n",
      "\n",
      "- working directory: ", getwd(),"\n",
      "- args[1] == file_name: ", file_name,"\n",
      "- args[2] == mkdocs_page_url: ", mkdocs_page_url, "\n",
      "- rel_url: ", rel_url, "\n",
      "- abs_url: ", abs_url, "\n",
      "\n",
      "ABORTED PROGRAM\n"
    )
  }
  new_line <- stringr::str_replace(line, pattern = stringr::fixed(rel_url), replacement = abs_url)
  text[line_index] <- new_line
}

readr::write_lines(text, file_name)
