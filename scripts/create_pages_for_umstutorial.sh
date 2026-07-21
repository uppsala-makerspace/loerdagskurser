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

echo "========================================================================"
echo "= Courses"
echo "========================================================================"

# if [[ "this" == "nonsense" ]]; then # My favorite debug statement :-)

echo "------------------------------------------------------------------------"
echo "- Courses, general"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/kurserna"
local_folder_input_file="${local_folder_rel_path}/README.md"
local_folder_prefix_output_file="${local_folder_rel_path}/generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna" # The page to link to; the rendered version of the source page
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# Saturday courses overview/g' ${generated_en}
sed -i 's/^# .*$/# Kurser hos Lördagskurser/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}



echo "------------------------------------------------------------------------"
echo "- # Courses, Arduino"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/kurserna"
local_folder_input_file="${local_folder_rel_path}/om_arduinokursen.md"
local_folder_prefix_output_file="${local_folder_rel_path}/om_arduinokursen_generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna/om_arduinokursen" # The page to link to; the rendered version of the source page
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# About the Arduino course/g' ${generated_en}
sed -i 's/^# .*$/# Om Arduinokursen/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

echo "------------------------------------------------------------------------"
echo "- Courses, Blender"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/kurserna"
local_folder_input_file="${local_folder_rel_path}/om_blenderkursen.md"
local_folder_prefix_output_file="${local_folder_rel_path}/om_blenderkursen_generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna/om_blenderkursen" # The page to link to; the rendered version of the source page
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# About the Blender course/g' ${generated_en}
sed -i 's/^# .*$/# Om Blenderkursen/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}


echo "------------------------------------------------------------------------"
echo "- Courses, cooking"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/kurserna"
local_folder_input_file="${local_folder_rel_path}/om_matlagningskursen.md"
local_folder_prefix_output_file="${local_folder_rel_path}/om_matlagningskursen_generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna/om_matlagningskursen" # The page to link to; the rendered version of the source page
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# About the cooking course/g' ${generated_en}
sed -i 's/^# .*$/# Om matlagningskursen/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

echo "------------------------------------------------------------------------"
echo "- Courses, OpenSCAD"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/kurserna"
local_folder_input_file="${local_folder_rel_path}/om_openscad_kursen.md"
local_folder_prefix_output_file="${local_folder_rel_path}/om_openscad_kursen_generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna/om_openscad_kursen" # The page to link to; the rendered version of the source page
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# About the OpenSCAD course/g' ${generated_en}
sed -i 's/^# .*$/# Om OpenSCAD kursen/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

echo "------------------------------------------------------------------------"
echo "- Courses, programming"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/kurserna"
local_folder_input_file="${local_folder_rel_path}/om_programmeringskursen.md"
local_folder_prefix_output_file="${local_folder_rel_path}/om_programmeringskursen_generated"
mkdocs_page_url="${mkdocs_home_url}/kurserna/om_programmeringskursen" # The page to link to; the rendered version of the source page
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# About the programming course/g' ${generated_en}
sed -i 's/^# .*$/# Om programmeringskursen/g' ${generated_sv}
# Add an LK logo, with a link to the homepage, then an empty line
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

echo "========================================================================"
echo "= Volunteers"
echo "========================================================================"
echo "------------------------------------------------------------------------"
echo "- Volunteers, general"
echo "------------------------------------------------------------------------" 
local_folder_rel_path="docs/volontaerer"
local_folder_input_file="${local_folder_rel_path}/README.md"
local_folder_prefix_output_file="${local_folder_rel_path}/readme_generated"
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer" # The page to link to; the rendered version of the source page
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
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

echo "------------------------------------------------------------------------"
echo "- Volunteers, host"
echo "------------------------------------------------------------------------"
local_folder_rel_path="docs/volontaerer"
local_folder_input_file="${local_folder_rel_path}/bli_entreevaerd.md"
local_folder_prefix_output_file="${local_folder_rel_path}/bli_entreevaerd_generated"
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_entreevaerd" # The page to link to; the rendered version of the source page
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# How to become a reception desk host at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man entrévärd hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}


echo "------------------------------------------------------------------------"
echo "- Volunteers, course leader"
echo "------------------------------------------------------------------------"
local_folder_rel_path="docs/volontaerer"
local_folder_input_file="${local_folder_rel_path}/bli_kursledare.md"
local_folder_prefix_output_file="${local_folder_rel_path}/bli_kursledare_generated"
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_kursledare" # The page to link to; the rendered version of the source page
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# How to become a course leader at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man kursledare hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

echo "------------------------------------------------------------------------"
echo "- Volunteers, teacher"
echo "------------------------------------------------------------------------"
local_folder_rel_path="docs/volontaerer"
local_folder_input_file="${local_folder_rel_path}/bli_laerare.md"
local_folder_prefix_output_file="${local_folder_rel_path}/bli_laerare_generated"
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_laerare" # The page to link to; the rendered version of the source page
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# How to become a teacher at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man lärare hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}

echo "------------------------------------------------------------------------"
echo "- Volunteers, course coordinator"
echo "------------------------------------------------------------------------"
local_folder_rel_path="docs/volontaerer"
local_folder_input_file="${local_folder_rel_path}/bli_samordnare.md"
local_folder_prefix_output_file="${local_folder_rel_path}/bli_samordnare_generated"
generated_en="${local_folder_prefix_output_file}_en.md"
generated_sv="${local_folder_prefix_output_file}_sv.md"
mkdocs_page_url="${mkdocs_home_url}/volontaerer/bli_samordnare" # The page to link to; the rendered version of the source page
Rscript -e "ignored_output <- splimata::split_tabs(input_file_name = \"${local_folder_input_file}\", output_file_prefix = \"${local_folder_prefix_output_file}\")" || exit 42
sed -i '/^---$/,/^---$/d' ${generated_en}
sed -i '/^---$/,/^---$/d' ${generated_sv}
# We need to use a fake base URL, as the R script assumes that all base URLs are a README.md in their own folder
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_en} ${mkdocs_page_url} || exit 42
Rscript scripts/replace_rel_url_by_abs_url.R ${generated_sv} ${mkdocs_page_url} || exit 42
sed -i 's/^# .*$/# How to become a coordinator at the Saturday courses?/g' ${generated_en}
sed -i 's/^# .*$/# Hur bli man samordnare hos Lördagskurserna?/g' ${generated_sv}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_en}
sed -i "/^# .*$/ a [![Lördagskurserna logo](loerdagskurser_logo_5x_wider.png)](${mkdocs_page_url})" ${generated_sv}
sed -i '/^# .*$/G' ${generated_en}
sed -i '/^# .*$/G' ${generated_sv}
