#!/bin/bash

function colored_echo() {
    local color=$1
    local text=$2
    case $color in
        red) echo -e "\e[31m$text\e[0m" ;;
        green) echo -e "\e[32m$text\e[0m" ;;
        blue) echo -e "\e[34m$text\e[0m" ;;
        *) echo "$text" ;;
    esac
}

colored_echo "blue" "Starting the installation process..."

colored_echo "green" "Step 1: Changing to Downloads directory"
cd ~/Downloads/

colored_echo "blue" "Step 2: Updating the system and performing housekeeping tasks (optional)"
read -p "Do you want to update your system? (y/n): " update_choice
if [ "$update_choice" = "y" ]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt autoclean -y && sudo apt autoremove -y
else
    colored_echo "red" "System update skipped."
fi

colored_echo "green" "Step 3: Installing required packages"
sudo apt install -y python3.11-dev build-essential git docker docker-compose python3-pip
colored_echo "green" "Step 4: Cloning repositories"
git clone https://github.com/nomic-ai/gpt4all.git
git clone https://github.com/nomic-ai/gpt4all-ui.git
git clone https://github.com/ggerganov/llama.cpp.git
colored_echo "green" "Step 5: Installing cmake and nproc using Python 3.11"
python3.11 -m pip install cmake nproc
colored_echo "green" "Step 6: Installing required Python packages from gpt4all-ui"
python3.11 -m pip install -r gpt4all-ui/requirements.txt
colored_echo "green" "Step 7: Making the installer file executable and running it"
sudo chmod +x gpt4all-ui/install.sh
(cd gpt4all-ui/ && ./install.sh)
colored_echo "green" "Step 8: Moving and configuring files"
mv llama.cpp/convert-gpt4all-to-ggml.py gpt4all-ui/
wget https://huggingface.co/decapoda-research/llama-7b-hf/blob/main/tokenizer.model
mv tokenizer.model gpt4all-ui/models/
cp gpt4all-ui/models/gpt4all-lora-quantized-ggml.bin llama.cpp/
rm gpt4all-ui/models/gpt4all-lora-quantized-ggml.bin
cp gpt4all-ui/models/tokenizer.model llama.cpp/models/
cd llama.cpp/
pip install numpy
pip install torch
pip install nomic
make
python3 -m pip install torch numpy sentencepiece
cd
cd Downloads/
cp gpt4all-ui/convert-gpt4all-to-ggml.py llama.cpp/
cd llama.cpp/
python3 migrate-ggml-2023-03-30-pr613.py gpt4all-lora-quantized-ggml.bin ../gpt4all-ui/models/gpt4all-lora-quantized-ggml.bin
cd ../gpt4all-ui/
bash run.sh
colored_echo "green" "Open your browser and go to localhost:9600"
colored_echo "red" "Start this manually by going into the gpt4all-ui folder and running: bash run.sh"
colored_echo "blue" "Big thanks to the authors of GPT4ALL, GPT4ALL-UI and llama.cpp - they are the real ones! Script Author: DoingFedTime from https://youtube.com/doingfedtime"
