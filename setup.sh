#!/bin/sh
# Configure git to use the shared hooks directory
# Run once after cloning any refactory-lang repo:
#   ./speckit-shared/setup.sh
git config core.hooksPath speckit-shared/.githooks
echo "Git hooks configured. Submodules will auto-init on checkout."
