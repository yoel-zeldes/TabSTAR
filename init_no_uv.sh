#!/bin/bash

# Install dependencies using uv
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt || echo "⚠️ Dependency install failed; continuing..."
else
    echo "⚠️ requirements.txt not found; skipping dependency install."
fi

# Install the tabstar package itself in editable mode (finds src/tabstar)
echo "📦 Installing tabstar package (editable)"
pip install -e . || echo "⚠️ Failed to install tabstar package; continuing..."

echo "🛠 Ensuring repo root is on Python path via .pth"
# compute site-packages directory for this venv
SITE_PACKAGES=$(python -c "import site; print(site.getsitepackages()[0])")
# write the repo root path into a .pth file
echo "$(pwd)" > "$SITE_PACKAGES/tabstar_paper.pth"
