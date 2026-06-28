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
