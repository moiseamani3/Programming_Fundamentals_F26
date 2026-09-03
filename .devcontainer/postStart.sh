#!/usr/bin/env bash
set -euo pipefail

cd "${WORKSPACE_FOLDER:-$(pwd)}"

# Create venv once
if [ ! -d ".venv" ]; then
  python -m venv .venv
fi

# Upgrade pip tooling
. .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel

# Optional: auto-install if top-level requirements exists
if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
fi