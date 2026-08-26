#!/usr/bin/env bash

set -euo pipefail

font_dir="${1:-.cache/typst-fonts}"
download_dir="$(mktemp -d)"
trap 'rm -rf "$download_dir"' EXIT

mkdir -p "$font_dir"

download() {
  local url="$1"
  local filename="$2"
  local checksum="$3"
  local target="$download_dir/$filename"

  curl --fail --location --retry 3 --retry-all-errors \
    --output "$target" "$url"
  echo "$checksum  $target" | sha256sum --check --status
}

download \
  "https://github.com/fontist/source-fonts/releases/download/v1.0/source-fonts-1.0.zip" \
  "source-fonts-1.0.zip" \
  "0107b5d4ba305cb4dff2ba19138407aa2153632a2c41592f74d20cd0d0261bfd"
download \
  "https://github.com/adobe-fonts/source-han-serif/releases/download/2.003R/09_SourceHanSerifSC.zip" \
  "SourceHanSerifSC-2.003.zip" \
  "8f633642eedf9bf23ab3336faa3d03ce1b56c14d654cd25752bc829c05f79f0d"
download \
  "https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.zip" \
  "Libertinus-7.051.zip" \
  "4d9be29b5cb380c35af8ba967abcc752ad1e07be1f738a9789c33e0dd7478c92"
download \
  "https://github.com/stipub/stixfonts/raw/v2.13b171/zipfiles/static_otf.zip" \
  "STIX-Two-2.13b171.zip" \
  "b5ec34636e117ec97e71e6b89ad2718618184329bbb3d3be5d1e3b0f8ed52789"
download \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.0/CascadiaMono.tar.xz" \
  "CascadiaMono-3.5.0.tar.xz" \
  "f5a9cdde3d984c127b4ceb67c8bf5183064eb257549f7c929f3ea0c95d7f354d"
download \
  "https://github.com/FortAwesome/Font-Awesome/releases/download/7.3.1/fontawesome-free-7.3.1-desktop.zip" \
  "fontawesome-7.3.1.zip" \
  "c61edde261707f33376a28e9a30bb8c70c1a20bf0bd975206b809f3b3b70add5"

unzip -q "$download_dir/source-fonts-1.0.zip" -d "$font_dir/source"
unzip -q "$download_dir/SourceHanSerifSC-2.003.zip" -d "$font_dir/source-han-serif"
unzip -q "$download_dir/Libertinus-7.051.zip" -d "$font_dir/libertinus"
unzip -q "$download_dir/STIX-Two-2.13b171.zip" -d "$font_dir/stix"
tar -xJf "$download_dir/CascadiaMono-3.5.0.tar.xz" -C "$font_dir"
unzip -q "$download_dir/fontawesome-7.3.1.zip" -d "$font_dir/fontawesome"
