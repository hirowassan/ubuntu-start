sudo apt install git curl build-essential python3 python-is-python3 python3.10-venv python3-pip npm nodejs apt-transport-https ca-certificates curl software-properties-common default-jdk zsh flatpak
sudo apt-get install ripgrep ninja-build gettext cmake unzip curl

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit.tar.gz lazygit

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

cd ~ && mkdir build
cd build
git clone https://github.com/neovim/neovim && cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo

wget -O discord.deb https://discordapp.com/api/download?platform=linux
sudo dpkg -i discord.deb
sudo apt-get install -f
sudo dpkg -i discord.deb

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt upgrade
sudo apt install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER


LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
export PATH="$HOME/.local/bin:$PATH"
source ~/.bashrc

cd ~ && mkdir font-temp
cd font-temp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Agave.zip && unzip Agave.zip
sudo mv AgaveNerdFont-Bold.ttf  AgaveNerdFont-Regular.ttf  AgaveNerdFontMono-Bold.ttf  AgaveNerdFontMono-Regular.ttf  AgaveNerdFontPropo-Bold.ttf  AgaveNerdFontPropo-Regular.ttf /usr/share/fonts/truetype/
sudo fc-cache -f -v
dconf write /org/gnome/desktop/interface/monospace-font-name "'Agave Nerd Font 12'"
cd ~

flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
