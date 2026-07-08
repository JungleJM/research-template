# Research Templates

Source-of-truth templates for R/Quarto research projects used from Positron.

## Install Into a Repo

From inside a target git repo:

```sh
/Users/jmath/Documents/code/core-repo-scripts/install-research-template-project.sh
```

Or pass an explicit target:

```sh
/Users/jmath/Documents/code/core-repo-scripts/install-research-template-project.sh /path/to/repo
```

The core script clones this repo into a temporary directory and calls:

```text
install-research-template.sh
```

That keeps `.research-template` files and install behavior centralized here.

After installation, run the package setup from the target repo when needed:

```sh
.research-template/install-research-stack.sh
```

## Publish a QMD

From the target repo root, run:

```sh
Rscript .research-template/scripts/publish_qmd.R "qmd/your-draft.qmd"
```

The script reads the QMD YAML `format:` block and renders the declared
`html`, `pdf`, and/or `docx` outputs into:

```text
publish/html/
publish/pdf/
publish/docx/
```

It also reads the QMD YAML `bibliography:` field, copies the `.bib` file into
`publish/references/`, and copies cited Better BibTeX `file = {...}` attachments
into `publish/references/`.

Requirements: R, Quarto, and a working Quarto PDF engine if the QMD declares
`pdf` output. The publish script does not require extra R packages.
