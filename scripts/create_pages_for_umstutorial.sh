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

Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
base_url="https://uppsala-makerspace.github.io/loerdagskurser/kurserna/"
generated_en="docs/kurserna/generated_en.md"
generated_sv="docs/kurserna/generated_sv.md"
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${base_url}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${base_url}
sed -i 's/^# .*$/# Saturday courses overview/g' ${generated_en}
sed -i 's/^# .*$/# Kurser hos Lördagskurser/g' ${generated_en}
# Add an LK logo, with a link to the homepage 
# sed '/^# .*$/ a ![](../)' sedtest.txt

Rscript -e 'splimata::split_tabs(input_file_name = "docs/plats/README.md", output_file_prefix = "docs/plats/generated")'
sed -i '/^---$/,/^---$/d' docs/plats/generated_en.md
sed -i '/^---$/,/^---$/d' docs/plats/generated_sv.md
Rscript scripts/replace_rel_url_by_abs_url.R docs/plats/generated_en.md https://uppsala-makerspace.github.io/loerdagskurser/plats/
Rscript scripts/replace_rel_url_by_abs_url.R docs/plats/generated_sv.md https://uppsala-makerspace.github.io/loerdagskurser/plats/

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/README.md", output_file_prefix = "docs/volontaerer/readme_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/readme_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/readme_generated_sv.md
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/readme_generated_en.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/readme_generated_sv.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How volunteering works at the Saturday courses/g' docs/volontaerer/readme_generated_en.md
sed -i 's/^# .*$/# Hur volontärer skapar Lördagskurserna/g' docs/volontaerer/readme_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_entreevaerd.md", output_file_prefix = "docs/volontaerer/bli_entreevaerd_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_entreevaerd_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_entreevaerd_generated_sv.md
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_entreevaerd_generated_en.md https://uppsala-makerspace.github.io/loerdagskurser/bli_entreevaerd/
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_entreevaerd_generated_sv.md https://uppsala-makerspace.github.io/loerdagskurser/bli_entreevaerd/
sed -i 's/^# .*$/# How to become a reception desk host at the Saturday courses?/g' docs/volontaerer/bli_entreevaerd_generated_en.md
sed -i 's/^# .*$/# Hur bli man entrévärd hos Lördagskurserna?/g' docs/volontaerer/bli_entreevaerd_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_kursledare.md", output_file_prefix = "docs/volontaerer/bli_kursledare_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_kursledare_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_kursledare_generated_sv.md
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_kursledare_generated_en.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_kursledare_generated_sv.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How to become a course leader at the Saturday courses?/g' docs/volontaerer/bli_kursledare_generated_en.md
sed -i 's/^# .*$/# Hur bli man kursledare hos Lördagskurserna?/g' docs/volontaerer/bli_kursledare_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_laerare.md", output_file_prefix = "docs/volontaerer/bli_laerare_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_laerare_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_laerare_generated_sv.md
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_laerare_generated_en.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_laerare_generated_sv.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How to become a teacher at the Saturday courses?/g' docs/volontaerer/bli_laerare_generated_en.md
sed -i 's/^# .*$/# Hur bli man lärare hos Lördagskurserna?/g' docs/volontaerer/bli_laerare_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_samordnare.md", output_file_prefix = "docs/volontaerer/bli_samordnare_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_samordnare_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_samordnare_generated_sv.md
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_samordnare_generated_en.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R docs/volontaerer/bli_samordnare_generated_sv.md https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How to become a coordinator at the Saturday courses?/g' docs/volontaerer/bli_samordnare_generated_en.md
sed -i 's/^# .*$/# Hur bli man samordnare hos Lördagskurserna?/g' docs/volontaerer/bli_samordnare_generated_sv.md
