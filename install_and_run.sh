#!/usr/bin/env bash

# ============================================================================ #
# 4-Level AI Lab - Installer & Launcher
#
# Usage:
#   ./install_and_run.sh            # sets up environment and runs the app
#   PYTHON_BIN=python3 ./install_and_run.sh  # override python executable
#   ./install_and_run.sh --no-run   # install only, skip starting the server
# ============================================================================ #

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_DIR="${VENV_DIR:-.venv}"
REQUIREMENTS_FILE="requirements.txt"
RUN_AFTER_INSTALL=1

if [[ "${1:-}" == "--no-run" ]]; then
    RUN_AFTER_INSTALL=0
fi

echo "🚀 4-Level AI Lab Installer"
echo "📂 Project directory: $PROJECT_ROOT"
echo "🐍 Python binary: $PYTHON_BIN"
echo "📦 Requirements file: $REQUIREMENTS_FILE"
echo "📁 Virtualenv: $VENV_DIR"
echo

# --- Check Python ----------------------------------------------------------- #
if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
    echo "❌ Python executable '$PYTHON_BIN' not found."
    echo "   Install Python 3.9+ and/or set PYTHON_BIN to the correct executable."
    exit 1
fi

PYTHON_VERSION="$("$PYTHON_BIN" -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')"
PYTHON_MAJOR="$("$PYTHON_BIN" -c 'import sys; print(sys.version_info[0])')"
PYTHON_MINOR="$("$PYTHON_BIN" -c 'import sys; print(sys.version_info[1])')"

if (( PYTHON_MAJOR < 3 || (PYTHON_MAJOR == 3 && PYTHON_MINOR < 9) )); then
    echo "❌ Python $PYTHON_VERSION detected. Please use Python 3.9 or newer."
    exit 1
fi

echo "✅ Python $PYTHON_VERSION detected."

# --- Create Virtual Environment -------------------------------------------- #
if [[ ! -d "$VENV_DIR" ]]; then
    echo "📦 Creating virtual environment in '$VENV_DIR'..."
    "$PYTHON_BIN" -m venv "$VENV_DIR"
else
    echo "ℹ️ Virtual environment already exists at '$VENV_DIR'."
fi

# Determine platform-specific activate script
if [[ -f "$VENV_DIR/bin/activate" ]]; then
    ACTIVATE_SCRIPT="$VENV_DIR/bin/activate"
    VENV_PYTHON="$VENV_DIR/bin/python"
elif [[ -f "$VENV_DIR/Scripts/activate" ]]; then
    ACTIVATE_SCRIPT="$VENV_DIR/Scripts/activate"
    VENV_PYTHON="$VENV_DIR/Scripts/python.exe"
else
    echo "❌ Unable to locate the activate script inside '$VENV_DIR'."
    exit 1
fi

echo "📂 Activating virtual environment..."
# shellcheck disable=SC1090
source "$ACTIVATE_SCRIPT"

trap 'deactivate >/dev/null 2>&1 || true' EXIT

echo "⬆️ Upgrading pip..."
"$VENV_PYTHON" -m pip install --upgrade pip setuptools wheel >/dev/null

# --- Install Requirements -------------------------------------------------- #
if [[ ! -f "$REQUIREMENTS_FILE" ]]; then
    echo "❌ Requirements file '$REQUIREMENTS_FILE' not found."
    exit 1
fi

echo "📥 Installing dependencies..."
"$VENV_PYTHON" -m pip install -r "$REQUIREMENTS_FILE"

echo
echo "✅ Installation complete."
echo

# --- Optional Run ---------------------------------------------------------- #
if (( RUN_AFTER_INSTALL == 1 )); then
    echo "🌐 Starting Flask development server..."
    echo "   Visit http://localhost:5001 after startup."
    echo
    exec "$VENV_PYTHON" app.py
else
    echo "ℹ️ Installation finished. Skipping server start (--no-run)."
    echo "   To run later:"
    echo "     source \"$ACTIVATE_SCRIPT\""
    echo "     python app.py"
fi

