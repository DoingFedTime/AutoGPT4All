# THIS REPO IS OUTDATED USE THE NEW UPDATED VERSION FOUND ON THE GPT4ALL-UI REPO:
```
mkdir -p ~/gpt4all-ui && curl -L https://raw.githubusercontent.com/nomic-ai/gpt4all-ui/main/webui.sh -o ~/gpt4all-ui/webui.sh && chmod +x ~/gpt4all-ui/webui.sh && cd ~/gpt4all-ui && ./webui.sh
```

# <img src="https://images.gamebanana.com/img/ico/sprays/5368ee7322ced.gif" width="75"> AutoGPT4All
Automatically create you own AI, no API key, No "as a language model" BS, host it locally, so no regulation can stop you! This script also grabs and installs a UI for you, and converts your Bin properly.  I am including a "manual" file too, which basically tries to break down in plain english how to do this all manually, instead of using the script. 

I created this because I had to grab all three repos, and review the issues of two of the repos in order to implement fixes for GPT4ALL-UI. This script was my solution to having a "download and run it" kind of script that would allow me to put his amazing AI any computer running some versions of linux quickly. 

THE "AutoGPT4ALL-UI.sh" is the ONLY script that has been tested, repeatedly, and was tested on linux mint. The other scripts, like the Mac OS, Python, and Powershell, have NEVER been tested!!! So it turns out that that animals for instance get better and better at learning something understanding something even without reinforcement and punishment

You have been warned. 

** UPDATE **

It's come to my attention that shortly after I posted this script the original GPT4ALL-UI was actually updated to do things like fix the .bin file. 
You can still use this script in spite of that if you want to (it's not going to do any harm from my understanding). When asked if you want to install python-venv, select "y". When asked ANYTHING else select "N". 


# <img src="https://img1.picmix.com/output/stamp/normal/0/9/7/2/522790_2c559.gif" width="75"> AutoGPT4ALL-UI

**AutoGPT4ALL-UI** is a script designed to automate the installation and setup process for GPT4ALL and its user interface. The script takes care of downloading the necessary repositories, installing required dependencies, and configuring the application for seamless use. This repository provides scripts for macOS, Linux (Debian-based), and Windows.

# <img src="https://shopcolors.archroma.com/Content/Images/loading-circle-with-ball.gif" width="75"> Prerequisites

Before running the script, make sure you have the following prerequisites installed on your system:

- macOS: [Homebrew](https://brew.sh/)
- Linux (Debian-based): Standard package management tools (`apt`)
- Windows: [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell) (pre-installed on most modern Windows systems)

# <img src="https://usagif.com/wp-content/uploads/loading-1.gif" width="75"> Usage

To use AutoGPT4ALL-UI, follow the steps below:

1. **Download** the appropriate script for your operating system from this repository.
    - macOS: `mac_install.sh`
    - Linux (Debian-based): `linux_install.sh`
    - Windows: `windows_install.ps1`
2. Open a terminal or command prompt on your operating system.
    - For macOS and Linux: Press `Cmd + Space` or `Ctrl + Alt + T`, respectively, and type "Terminal" to open a terminal window.
    - For Windows: Press `Win + X`, and select "Windows PowerShell" or "Windows PowerShell (Admin)" from the context menu.
3. Navigate to the folder containing the downloaded script.
4. Make the script executable (macOS and Linux only).
    - Type `chmod +x <script_name>` and press `Enter` (replace `<script_name>` with the name of the downloaded script, e.g., `mac_install.sh`).
5. Run the script.
    - For macOS and Linux: Type `./<script_name>` and press `Enter`.
    - For Windows: Type `.\script_name` and press `Enter`.
6. Follow the on-screen prompts and instructions to complete the installation process.
7. After the installation is complete, open your browser and visit http://localhost:9600 to access the GPT4ALL user interface.

TL;DR
1. Clone repo.
2. cd into folder
3. sudo chmod +x autogpt4all.sh
4. ./autogpt4all.sh

# <img src="https://i.pinimg.com/originals/7e/2a/eb/7e2aeb1567e91bfc2404cecca6aceecd.gif" width="125"> Manual Installation

If you prefer a manual installation, follow the step-by-step installation guide provided in the repository. This guide walks you through the process using easy-to-understand language and covers all the steps required to set up GPT4ALL-UI on your system.

# <img src="https://thumbs.gfycat.com/EnragedHoarseEuropeanfiresalamander-size_restricted.gif" width="125"> Contributing

Contributions to AutoGPT4ALL-UI are welcome! The script is provided AS IS. I am not doing any updates to it, or any modifications so feel free to run with it and do whatever you want. 

# <img src="https://media.giphy.com/media/aFrgqGf8CtBhm/giphy.gif" width="125"> License

AutoGPT4ALL-UI is released under the Apache 2.0 License. 

# <img src="https://media.tenor.com/NRCKemMTCx8AAAAC/hideo-kojima-credits.gif" width="125"> Credits

The ONLY reason, I could make this was thanks to the folloing projects that you need to star a.s.a.p.
1. GPT4ALL: https://github.com/nomic-ai/gpt4all
2. GPT4ALL-UI: https://github.com/nomic-ai/gpt4all-ui
3. LLama.cpp: https://github.com/ggerganov/llama.cpp
AutoGPT4ALL-UI was created by DoingFedTime. 
Check out my YouTube channel at https://youtube.com/doingfedtime for darknet content (shameless plug).

