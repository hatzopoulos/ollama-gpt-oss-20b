# 🧠 Ollama GPT-OSS Setup for macOS

This project provides a simple and elegant way to **install and run Ollama** locally on macOS with the `gpt-oss:20b` model using a beginner-friendly shell script. It also includes an uninstall script for complete cleanup.

---

## 🚀 What It Does

- Installs [Ollama](https://ollama.com) via Homebrew (if not already installed, installs homebrew)
- Starts the `ollama serve` process (if not already running)
- Downloads and runs the `gpt-oss:20b` model locally
- Saves model files and logs locally
- Includes an optional uninstall script to remove Ollama and all related files


## ✅ Requirements

- macOS 12.6 or later
- Apple Silicon (M1/M2/M3) or Intel
- ~30GB of free disk space (for the 20B model)
- Internet connection (initial model download)
- Terminal access (no advanced knowledge needed)


## 📦 Setup Instructions

### Quick Install Method

Open MacOS Terminal App and paste the following line and hit enter/return.

`curl -fsSL https://raw.githubusercontent.com/hatzopoulos/ollama-gpt-oss-20b/refs/heads/main/setup-ollama-gpt-oss-20b.sh | bash`

### Manual Install Method

1. **Download or clone this repository:**

   ```bash
   git clone https://github.com/hatzopoulos/ollama-gpt-oss-20b.git
   cd ollama-gpt-oss-20b

2. Run the setup script:

  ```bash
  chmod +x setup-ollama-gpt-oss-20b.sh
  ./main/setup-ollama-gpt-oss-20b.sh
  ```

3. Talk to the model
  ```bash
  ollama run gpt-oss:20b
  ```
