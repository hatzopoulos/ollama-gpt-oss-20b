#!/bin/bash

# Simple setup for Ollama + gpt-oss:20b on macOS

set -e

echo "🔍 Checking for Homebrew..."

if ! command -v brew &>/dev/null; then
    echo "🍺 Homebrew not found. Installing..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew is already installed."
fi

echo "📦 Installing Ollama..."

brew install ollama

echo "🚀 Starting Ollama service..."
ollama serve &

# Wait a bit to ensure service is ready
sleep 5

echo "⬇️ Downloading gpt-oss:20b model (this may take a while)..."

ollama run gpt-oss:20b

echo ""
echo "✅ Setup complete!"
echo ""
echo "💡 You can now chat with the model by running:"
echo "    ollama run gpt-oss:20b"
echo ""
echo "🧠 Tip: You can also use a GUI like Open WebUI (optional) for a better experience:"
echo "    https://github.com/open-webui/open-webui"
echo ""
echo "📂 Model will be stored locally and used offline after download."
