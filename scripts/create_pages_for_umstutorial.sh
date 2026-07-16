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

# Kurserna
Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
base_url="https://uppsala-makerspace.github.io/loerdagskurser/kurserna/"
generated_en="docs/kurserna/generated_en.md"
generated_sv="docs/kurserna/generated_sv.md"
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${base_url}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${base_url}
sed -i 's/^# .*$/# Saturday courses overview/g' ${generated_en}
sed -i 's/^# .*$/# Kurser hos Lördagskurser/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/kurserna/))' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/kurserna/))' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, general
generated_en="docs/volontaerer/readme_generated_en.md"
generated_sv="docs/volontaerer/readme_generated_sv.md"
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/README.md", output_file_prefix = "docs/volontaerer/readme_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How volunteering works at the Saturday courses/g' ${generated_en}
sed -i 's/^# .*$/# Hur volontärer skapar Lördagskurserna/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/))' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/))' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, host
generated_en="docs/volontaerer/bli_entreevaerd_generated_en.md"
generated_sv="docs/volontaerer/bli_entreevaerd_generated_sv.md"
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_entreevaerd.md", output_file_prefix = "docs/volontaerer/bli_entreevaerd_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} https://uppsala-makerspace.github.io/loerdagskurser/bli_entreevaerd/
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} https://uppsala-makerspace.github.io/loerdagskurser/bli_entreevaerd/
sed -i 's/^# .*$/# How to become a reception desk host at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man entrévärd hos Lördagskurserna?/g' ${generated_sv}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_entreevaerd/))' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_entreevaerd/))' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, course leader
generated_en="docs/volontaerer/bli_kursledare_generated_en.md"
generated_sv="docs/volontaerer/bli_kursledare_generated_sv.md"
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_kursledare.md", output_file_prefix = "docs/volontaerer/bli_kursledare_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How to become a course leader at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man kursledare hos Lördagskurserna?/g' ${generated_sv}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_kursledare/))' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_kursledare/))' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, teacher
generated_en="docs/volontaerer/bli_laerare_generated_en.md"
generated_sv="docs/volontaerer/bli_laerare_generated_sv.md"
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_laerare.md", output_file_prefix = "docs/volontaerer/bli_laerare_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How to become a teacher at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man lärare hos Lördagskurserna?/g' ${generated_sv}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_laerare/))' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_laerare/))' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

# Volunteers, coordinator
generated_en="docs/volontaerer/bli_samordnare_generated_en.md"
generated_sv="docs/volontaerer/bli_samordnare_generated_sv.md"
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_samordnare.md", output_file_prefix = "docs/volontaerer/bli_samordnare_generated")'
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/
sed -i 's/^# .*$/# How to become a coordinator at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man samordnare hos Lördagskurserna?/g' ${generated_sv}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_samordnare/))' ${generated_en}
sed -i '/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_64_x_60.png)](https://uppsala-makerspace.github.io/loerdagskurser/volontaerer/bli_samordnare/))' ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}
