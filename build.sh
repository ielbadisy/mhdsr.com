#!/usr/bin/env bash
# Renders the bilingual MHDSR site (English default profile + French profile).
# Order matters: French must render first, then English with --no-clean,
# otherwise Quarto's per-profile cleanup deletes the other language's output.
set -euo pipefail
cd "$(dirname "$0")"

rm -rf docs
quarto render --profile fr
quarto render --no-clean
