#!/bin/bash

# Simple setup for Ollama + gpt-oss:20b on macOS
# Designed for beginner users

set -e

LOG_FILE=~/ollama.log

# Step 1: Check for Homebrew
echo "🔍 Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
    echo "🍺 Homebrew not found. Installing..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew is already installed."
fi

# Step 2: Check for Ollama
echo "🔍 Checking for Ollama..."
if ! command -v ollama &>/dev/null; then
    echo "📦 Ollama not found. Installing..."
    brew install ollama
else
    echo "✅ Ollama is already installed."
fi

# Step 3: Check if ollama serve is already running
echo "🔄 Checking if 'ollama serve' is already running..."
if pgrep -x "ollama" > /dev/null; then
    echo "🟢 Ollama service is already running."
else
    echo "🚀 Starting Ollama service in background..."
    echo "📄 Logging output to $LOG_FILE"
    nohup ollama serve > "$LOG_FILE" 2>&1 &
    echo "⏳ Waiting a few seconds for the service to initialize..."
    sleep 5
fi

# Step 4: Pull the model
echo "⬇️ Downloading gpt-oss:20b model (this may take a while)..."
ollama run gpt-oss:20b

echo ""
echo "✅ Setup complete!"
echo ""
echo "👉 To chat with the model anytime, run:"
echo "    ollama run gpt-oss:20b"
echo ""
echo "💡 Optional GUI: Open WebUI"
echo "    https://github.com/open-webui/open-webui"
echo ""
echo "📝 If something doesn't work, check the log at:"
echo "    $LOG_FILE"
echo ""
echo "📂 The model is stored locally and can be used offline."
echo ""
echo "🛑 To stop the Ollama service later, run:"
echo "    pkill -x ollama"
echo ""
echo " To completely uninstall ollama and the model data, run:"
echo "    brew uninstall ollama && rm -rf \"~/Library/Application Support/Ollama\" && rm -f $LOG_FILE"
echo ""
