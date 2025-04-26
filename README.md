# Lördagskurserna

<!-- markdownlint-disable MD013 --><!-- Table rows must be put on one line, hence 80 chars is unavoidable -->

[![Check bash style](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/check_bash_style.yaml/badge.svg?branch=main)](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/check_bash_style.yaml)
[![Check links](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/check_links.yaml)
[![Check markdown](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/check_markdown.yaml/badge.svg?branch=main)](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/check_markdown.yaml)
[![Create website](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/create_website.yaml/badge.svg?branch=main)](https://github.com/uppsala-makerspace/loerdagskurser/actions/workflows/create_website.yaml)

<!-- markdownlint-enable MD013 -->

[Go to our nicely rendered website](https://uppsala-makerspace.github.io/loerdagskurser/).

- [Contributing](docs/CONTRIBUTING.md)

## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 --><!-- Table rows must be put on one line, hence 80 chars is unavoidable -->

Filename                                  |Descriptions
------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)        |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

<!-- markdownlint-enable MD013 -->
