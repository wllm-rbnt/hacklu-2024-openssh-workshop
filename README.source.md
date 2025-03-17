# @@ws_title@@ - @@conf_name@@ @@conf_year@@

The [presentation](https://github.com/wllm-rbnt/@@document_name@@/blob/main/@@document_name@@.patat.md) is written in Markdown.

Use [patat](https://github.com/jaspervdj/patat) to render the slides in your terminal or use the [PDF](https://github.com/wllm-rbnt/@@document_name@@/blob/main/@@document_name@@.pdf)/[HTML](https://github.com/wllm-rbnt/@@document_name@@/blob/main/@@document_name@@.html) versions.

    $ wget https://github.com/jaspervdj/patat/releases/download/v0.12.0.1/patat-v0.12.0.1-linux-x86_64.tar.gz
    $ tar xzf patat-v0.12.0.1-linux-x86_64.tar.gz patat-v0.12.0.1-linux-x86_64/patat
    $ patat-v0.12.0.1-linux-x86_64/patat @@document_name@@.patat.md

Use the [ws_gen](https://github.com/wllm-rbnt/@@document_name@@/blob/main/ws_gen) script to generate PDF/HTML versions from Markdown (this script requires [Pandoc](https://pandoc.org/) and [Chromium](https://www.chromium.org/Home/)):

    $ sudo apt install pandoc chromium
    $ ./ws_gen

or

    $ sudo dnf install pandoc chromium
    $ ./ws_gen

Note: this script will also create the final Markdown version along with the
README.md file of the repository.
