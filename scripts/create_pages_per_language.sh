#!/bin/bash
#
# Create the pages per language.
#
# Usage:
#
#   ./scripts/create_pages_per_language.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/create_pages_per_language.sh"
    echo " "
    exit 42
fi

Rscript -e 'splimata::split_tabs(input_file_name = "docs/kurserna/README.md", output_file_prefix = "docs/kurserna/generated")'
sed -i '/^---$/,/^---$/d' docs/kurserna/generated_en.md
sed -i '/^---$/,/^---$/d' docs/kurserna/generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/plats/README.md", output_file_prefix = "docs/plats/generated")'
sed -i '/^---$/,/^---$/d' docs/plats/generated_en.md
sed -i '/^---$/,/^---$/d' docs/plats/generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/README.md", output_file_prefix = "docs/volontaerer/readme_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/readme_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/readme_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_entreevaerd.md", output_file_prefix = "docs/volontaerer/bli_entreevaerd_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_entreevaerd_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_entreevaerd_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_kursledare.md", output_file_prefix = "docs/volontaerer/bli_kursledare_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_kursledare_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_kursledare_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_laerare.md", output_file_prefix = "docs/volontaerer/bli_laerare_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_laerare_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_laerare_generated_sv.md

Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_samordnare.md", output_file_prefix = "docs/volontaerer/bli_samordnare_generated")'
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_samordnare_generated_en.md
sed -i '/^---$/,/^---$/d' docs/volontaerer/bli_samordnare_generated_sv.md





