#!/bin/bash

# this is a good resource for getting set up with most of what you need to start rna-seq analysis
curl http://data.biostarhandbook.com/install.sh | bash

# this is for setting up git remote repo
mamba install gh --channel conda-forge

# follow instructions
gh auth login
