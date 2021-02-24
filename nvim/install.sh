#!/usr/bin/env bash

echo '[*] 项目依赖：neovim node npm python3 python3-pip python3-venv git curl universal-ctags，根据不同操作系统自行安装'

bak_dir=~/.vimbak-`date +%Y%m%d%H%M%S`/
echo "[*] 备份 vim 配置: "${bak_dir}

mkdir ${bak_dir}

if [ -f "$HOME/.vimrc" ]; then
  mv ~/.vimrc	${bak_dir}
fi

if [ -d "$HOME/.vim" ]; then
  mv ~/.vim ${bak_dir}
fi

settings_dir=$HOME/opt/awesome-settings

if [ ! -d "$settings_dir" ]; then
  git clone https://github.com/fengjx/awesome-settings.git $settings_dir
else
  cd $settings_dir
  git pull
fi

echo '[*] 创建 Neovim 配置文件目录 ...'
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.vim

ln -s $settings_dir/nvim/.vimrc $HOME/.vim/.vimrc
ln -s $settings_dir/nvim/vimrcs $HOME/.vim/vimrcs
ln -s $settings_dir/nvim/.vimrc $HOME/.config/nvim/init.vim
ln -s $settings_dir/nvim/lua $HOME/.config/nvim/lua
ln -s $settings_dir/nvim/coc/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $settings_dir/nvim/ultisnips $HOME/.config/nvim/my-snippets

# Install virtualenv to containerize dependencies
echo '[*] 安装 python相关依赖 - neovim pynvim jedi psutil setproctitle yapf doq'
if [ ! -d "$HOME/.config/nvim/env" ]; then
  python3 -m venv $HOME/.config/nvim/env
fi
source $HOME/.config/nvim/env/bin/activate
pip install neovim pynvim jedi psutil setproctitle yapf doq # run `pip uninstall neovim pynvim` if still using old neovim module
deactivate

# install vim-plug
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo '[*] 安装插件管理器 vim-plug'
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# 安装插件
echo '[*] 安装插件'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

echo -e "[+] 完成"
