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
Rscript -e 'splimata::split_tabs(input_file_name = "docs/plats/README.md", output_file_prefix = "docs/plats/generated")'
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/README.md", output_file_prefix = "docs/volontaerer/readme_generated")'
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_entreevaerd.md", output_file_prefix = "docs/volontaerer/bli_entreevaerd_generated")'
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_kursledare.md", output_file_prefix = "docs/volontaerer/bli_kursledare_generated")'
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_laerare.md", output_file_prefix = "docs/volontaerer/bli_laerare_generated")'
Rscript -e 'splimata::split_tabs(input_file_name = "docs/volontaerer/bli_samordnare.md", output_file_prefix = "docs/volontaerer/bli_samordnare_generated")'



