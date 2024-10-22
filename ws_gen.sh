#!/bin/bash

. ./functions.bash
. ./conf.bash

src="${document_name}.source.md" 
patat_md="${document_name}.patat.md" 

which pandoc >/dev/null 2>&1
[ $? -ne 0 ] && echo "pandoc not found" && exit 1

which chromium >/dev/null 2>&1
[ $? -ne 0 ] && echo "chromium not found" && exit 1

echo -n "Expanding variables in source Markdown ... "
expand "${src}" "${patat_md}"
echo "done"

echo -n "Expanding variables in source README ... "
expand "README.source.md" "README.md"
echo "done"

echo "Converting Markdown to HTML using Pandoc"
pandoc -f markdown \
    -t html5 \
    -s "${document_name}.patat.md" \
    -o "${document_name}.html" \
    --metadata-file ws_gen_resources/metadata.yml \
    --from markdown+emoji \
    --syntax-definition=schematics.xml \
    --highlight-style=style.theme

[ $? -ne 0 ] && echo "Error during Markdown to HTML conversion" && exit 1
echo -e "\t${document_name}.html ... done"

echo "Converting HTML to PDF using Chromium"
chromium --headless \
    --disable-gpu \
    --print-to-pdf="${document_name}.pdf" \
    "${document_name}.html" \
    --print-to-pdf-no-header
[ $? -ne 0 ] && echo "Error during HTML to PDF conversion" && exit 1
echo -e "\t${document_name}.pdf ... done"
