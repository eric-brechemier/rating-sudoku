#!/bin/sh
# Requires: xsltproc

usage()
{
  cat << EOF
rating.sh result_xml [result_html]
with:
  result_xml - relative path to the result.xml file
               produced by XSLT Sukoku Solver
  result_html - optional, relative path to the corresponding visualization
                of the result in HTML format, defaults to a file in the same
                folder as input, with the xml extension replaced with html.
EOF
}

if test -z "$1"
then
  usage
  exit 1
fi

input="$1"
output="${2:-$(dirname "$input")/$(basename "$input" ".xml").html}"

echo "$input -> $output"

scriptFolder="$(dirname "$0")"
transform="$scriptFolder/rating.xsl"
xsltproc "$transform" "$input" > "$output" && echo "Done." || echo "Failed."
