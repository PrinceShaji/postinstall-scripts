#!/bin/sh

sudo echo "Enter password:"


# Update OS
echo "Updating operating system"
sudo apt update && sudo apt upgrade -y

# Basic toold/utils
sudo apt install wget gpg curl htop -y

echo "Installing bluetooth tools"
sudo apt install blueman -y

# Change theme to dark.
echo "Changin to dark theme"
gsettings set org.gnome.shell.ubuntu color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark # Legacy apps, can specify an accent such as Yaru-olive-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark # new apps
gsettings reset org.gnome.shell.ubuntu color-scheme # if changed above

# Show seconds in task bar
echo "Enabling seconds in task bar"
gsettings set org.gnome.desktop.interface clock-show-seconds true

# Change wallpaper
sudo cp ./wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri "file:////usr/share/backgrounds/wallpaper.jpg"


# Download and install chrome
echo "Downloading latest google-chrome"
wget -O /tmp/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
echo "Installing google-chrome"
sudo dpkg -i /tmp/chrome.deb
echo "Removing temporary files."
rm /tmp/chrome.deb


# # Install Node 18.14.2
echo "Installing nvm"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm -v
echo "Installing latest version of node"
nvm install node
echo "Please use nvm to change to the node version of choice."


# Download and install brave
echo "Adding Brave Browser PPA"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
echo "Installing Brave Browser"
sudo apt install brave-browser -y


# Install VS Code
echo "Updating VS Code PPA"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
# Update PPA and install vs-code
sudo apt install apt-transport-https -y
sudo apt update
echo "Installing VS Code"
sudo apt install code -y # or code-insiders


# Install basic VS Code extensions.
code --install-extension eamodio.gitlens  # gitlens
code --install-extension ms-azuretools.vscode-docker # docker tools
code --install-extension redhat.vscode-yaml # yaml linter.
code --install-extension redhat.vscode-xml # xml linter
code --install-extension SonarSource.sonarlint-vscode # sonarlint
code --install-extension Prisma.prisma # prisma ORM
code --install-extension ms-python.python # python
code --install-extension ms-vscode-remote.remote-containers # docker containers
code --install-extension dbaeumer.vscode-eslint # eslint


# Install Docker
echo "Starting Docker installation"
echo "Adding Docker PPA"
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Updating apt"
sudo apt update
echo "Installing Docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y

echo "Docker postinstall steps"
sudo groupadd docker
sudo usermod -aG docker ${USER}
echo "Docker set up to run as non-sudo user"


# Install Docker Compose V1
echo "Installing Docker Compose V2"
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Install Docker Compose V2
echo "Installing Docker Compose V2"
sudo apt-get install docker-compose-plugin -y
docker compose version


# Install Git
echo "Installing Git"
sudo apt install git -y
git --version
echo "Adding basic git config"
git config --global user.name "Your Name"
git config --global user.email "youremail@company.com"


# Install gcloud-cli
echo "Installing gcloud-cli"
sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update && sudo apt-get install google-cloud-cli



# Installing multimedia tools
echo "Installing VLC"
sudo apt install vlc -y


# Installing screen recorder
echo "Installing simplescreenrecorder"
sudo apt-get install simplescreenrecorder -y


## Install OBS Studio
#echo "Installing OBS Studio"
#sudo add-apt-repository ppa:obsproject/obs-studio
#sudo apt update
#sudo apt install ffmpeg obs-studio -y












