mkdir ~/.local/bin
echo 'export PATH=$HOME/.local/bin:$PATH' >>~/.bashrc
. ~/.bashrc

apt update && apt install -y curl git golang-go

# install agents
curl -fsSL https://chatgpt.com/codex/install.sh | sh
curl -fsSL https://claude.ai/install.sh | bash

# workspace
mkdir -p /tmp/downloads
pushd /tmp/downloads

# install herdr
curl -fsSL https://herdr.dev/install.sh | sh
mkdir -p ~/.config/herdr
cat <<EOF >~/.config/herdr/config.toml
onboarding = false

[keys]
prefix = "ctrl+b"

detach = "prefix+d"
split_vertical = "prefix+%"
split_horizontal = "prefix+\""
focus_pane_left = "prefix+left"
focus_pane_down = "prefix+down"
focus_pane_up = "prefix+up"
focus_pane_right = "prefix+right"
EOF

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xvfz nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 ~/.local
echo 'export PATH=$HOME/.local/nvim-linux-x86_64/bin:$PATH' >>~/.bashrc
. ~/.bashrc

# install lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# install lazygit
GOBIN=$HOME/.local/bin go install github.com/jesseduffield/lazygit@latest

# cleanup
popd
rm -r /tmp/downloads
