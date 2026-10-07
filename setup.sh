mkdir ~/.local/bin
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
. ~/.bashrc

apt update && apt install -y curl git

# workspace
mkdir -p /tmp/downloads
pushd /tmp/downloads

# install zellij

curl -LO https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar xvfz zellij-x86_64-unknown-linux-musl.tar.gz
mv zellij ~/.local/bin

# install neovim
mkdir -p /tmp/neovim
pushd /tmp/neovim

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xvfz nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 ~/.local
echo 'export PATH=$HOME/.local/nvim-linux-x86_64/bin:$PATH' >> ~/.bashrc
. ~/.bashrc

# install lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# cleanup
popd
rm -r /tmp/downloads
