#!/usr/bin/env bash
set -euo pipefail

target="${1:-$PWD}"
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$repo_dir/template-files/.research-template"

if [[ ! -d "$target/.git" ]]; then
  echo "Target does not look like a git repo: $target" >&2
  exit 1
fi

if [[ ! -d "$source_dir" ]]; then
  echo "Research template source not found: $source_dir" >&2
  exit 1
fi

mkdir -p "$target/.research-template"
cp -R "$source_dir"/. "$target/.research-template/"

if [[ -f "$target/.research-template/install-research-stack.sh" ]]; then
  chmod +x "$target/.research-template/install-research-stack.sh"
fi

if [[ -f "$target/.research-template/scripts/publish_qmd.R" ]]; then
  chmod +x "$target/.research-template/scripts/publish_qmd.R"
fi

echo "Installed research template files into $target/.research-template"
