#!/bin/bash
#
# Create the pages for https://github.com/uppsala-makerspace/umstutorial
#
# Usage:
#
#   ./scripts/create_pages_for_umstutorial.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/create_pages_for_umstutorial.sh"
    echo " "
    exit 42
fi

# This will be the same for all generated pages
mkdocs_home_url="https://uppsala-makerspace.github.io/loerdagskurser"

# Kurserna
Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
mkdocs_page_url="${mkdocs_home_url}/kurserna" # The page to link to; the rendered version of the source page
generated_en="docs/kurserna/generated_en.md"
generated_sv="docs/kurserna/generated_sv.md"
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url}
sed -i 's/^# .*$/# Saturday courses overview/g' ${generated_en}
sed -i 's/^# .*$/# Kurser hos Lördagskurser/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](https://uppsala-makerspace.github.io/loerdagskurser/kurserna/)' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](https://uppsala-makerspace.github.io/loerdagskurser/kurserna/)' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, general
generated_en="docs/volontaerer/readme_generated_en.md"
generated_sv="docs/volontaerer/readme_generated_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer" # The page to link to; the rendered version of the source page
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/README.md", output_file_prefix = "docs/volontaerer/readme_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# How volunteering works at the Saturday courses/g' ${generated_en}
sed -i 's/^# .*$/# Hur volontärer skapar Lördagskurserna/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, host
generated_en="docs/volontaerer/bli_entreevaerd_generated_en.md"
generated_sv="docs/volontaerer/bli_entreevaerd_generated_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_entreevaerd" # The page to link to; the rendered version of the source page
abs_url="${mkdocs_home_url}/bli_entreevaerd" # relative to absolute URLs assumes all mkdocs_page_urls are in their own folder

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_entreevaerd.md", output_file_prefix = "docs/volontaerer/bli_entreevaerd_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${abs_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${abs_url} || exit 42
sed -i 's/^# .*$/# How to become a reception desk host at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man entrévärd hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, course leader
generated_en="docs/volontaerer/bli_kursledare_generated_en.md"
generated_sv="docs/volontaerer/bli_kursledare_generated_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_kursledare" # The page to link to; the rendered version of the source page
abs_url="${mkdocs_home_url}/bli_kursledare" # relative to absolute URLs assumes all mkdocs_page_urls are in their own folder
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_kursledare.md", output_file_prefix = "docs/volontaerer/bli_kursledare_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${abs_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${abs_url} || exit 42
sed -i 's/^# .*$/# How to become a course leader at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man kursledare hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, teacher
generated_en="docs/volontaerer/bli_laerare_generated_en.md"
generated_sv="docs/volontaerer/bli_laerare_generated_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_laerare" # The page to link to; the rendered version of the source page
abs_url="${mkdocs_home_url}/bli_laerare" # relative to absolute URLs assumes all mkdocs_page_urls are in their own folder

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_laerare.md", output_file_prefix = "docs/volontaerer/bli_laerare_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${abs_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${abs_url} || exit 42
sed -i 's/^# .*$/# How to become a teacher at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man lärare hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}


# Volunteers, coordinator
generated_en="docs/volontaerer/bli_samordnare_generated_en.md"
generated_sv="docs/volontaerer/bli_samordnare_generated_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_bli_samordnare" # The page to link to; the rendered version of the source page
abs_url="${mkdocs_home_url}/bli_bli_samordnare" # relative to absolute URLs assumes all mkdocs_page_urls are in their own folder
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_samordnare.md", output_file_prefix = "docs/volontaerer/bli_samordnare_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${abs_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${abs_url} || exit 42
sed -i 's/^# .*$/# How to become a coordinator at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man samordnare hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

exit 42
