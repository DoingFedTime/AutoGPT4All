#!/bin/bash

function colored_echo() {
    local color=$1
    local text=$2
    case $color in
        red) echo -e "\033[31m$text\033[0m" ;;
        green) echo -e "\033[32m$text\033[0m" ;;
        blue) echo -e "\033[34m$text\033[0m" ;;
        *) echo "$text" ;;
    esac
}

colored_echo "blue" "Starting the installation process..."

colored_echo "green" "Step 1: Changing to Downloads directory"
cd ~/Downloads/

colored_echo "blue" "Step 2: Updating the system and performing housekeeping tasks (optional)"
read -p "Do you want to update your system? (y/n): " update_choice
if [ "$update_choice" = "y" ]; then
    brew update && brew upgrade
    brew cleanup
else
    colored_echo "red" "System update skipped."
fi

colored_echo "green" "Step 3: Installing required packages"
brew install python3.11 cmake git
brew install --cask docker
brew install pipx
pipx ensurepath
pipx install docker-compose
colored_echo "green" "Step 4: Cloning repositories"
git clone https://github.com/nomic-ai/gpt4all.git
git clone https://github.com/nomic-ai/gpt4all-ui.git
git clone https://github.com/ggerganov/llama.cpp.git
colored_echo "green" "Step 5: Installing nproc using Python 3.11"
python3.11 -m pip install nproc
colored_echo "green" "Step 6: Installing required Python packages from gpt4all-ui"
python3.11 -m pip install -r gpt4all-ui/requirements.txt
colored_echo "green" "Step 7: Making the installer file executable and running it"
chmod +x gpt4all-ui/install.sh
(cd gpt4all-ui/ && ./install.sh)
colored_echo "green" "Step 8: Moving and configuring files"
mv llama.cpp/convert-gpt4all-to-ggml.py gpt4all-ui/
curl -L -o tokenizer.model https://huggingface.co/decapoda-research/llama-7b-hf/blob/main/tokenizer.model
mv tokenizer.model gpt4all-ui/models/
cp gpt4all-ui/models/gpt4all-lora-quantized-ggml.bin llama.cpp/
rm gpt4all-ui/models/gpt4all-lora-quantized-ggml.bin
cp gpt4all-ui/models/tokenizer.model llama.cpp/models/
cd llama.cpp/
python3 -m pip install numpy
python3 -m pip install torch
python3 -m pip install nomic
make
python3 -m pip install torch numpy sentencepiece
cd
cd Downloads/
cp gpt4all-ui/convert-gpt4all-to-ggml.py llama.cpp/
cd llama.cpp/

# Detect operating system and use the correct Python version
OS=$(uname)
if [ "$OS" = "Darwin" ]; then
    PYTHON_CMD="python3"
else
    PYTHON_CMD="python3.11"
fi

$PYTHON_CMD migrate-ggml-2023-03-30-pr613.py gpt4all-lora-quantized-ggml.bin ../gpt4all-ui/models/gpt4all-lora-quantized-ggml.bin
cd ../gpt4all-ui/
bash run.sh
colored_echo "green" "Open your browser and go to localhost:9600"
colored_echo "red" "Start this manually by going into the gpt4all-ui folder and running: bash run.sh"
colored_echo "blue" "Big thanks to the authors of GPT4ALL, GPT4ALL-UI and llama.cpp - they are the real ones! Script Author: DoingFedTime from https://youtube.com/doingfedtime"
