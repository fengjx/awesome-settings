#!/usr/bin/env bash


bak_dir=~/.vimbak-`date +%Y%m%d%H%M%S`/
echo "[*] 备份 vim 配置: "${bak_dir}

mkdir ${bak_dir}

mv ~/.vimrc	${bak_dir}
mv ~/.vim ${bak_dir}

echo '[*] 项目依赖：neovim python3 python3-pip python3-venv git curl exuberant-ctags，根据不同操作系统自行安装'

settings_dir=~/opt/awesome-settings

git clone git@github.com:fengjx/awesome-settings.git $settings_dir

# git config user.name "FengJianxin"
# git config user.name "fengjianxin2012@gmail.com"

echo '[*] 创建 Neovim 配置文件目录 ...'
mkdir -p ~/.config/nvim

ln -s $settings_dir/nvim ~/.vim
ln -s $settings_dir/nvim/.vimrc ~/.config/nvim/init.vim

# Install virtualenv to containerize dependencies
echo '[*] 安装 python相关依赖 - neovim pynvim jedi psutil setproctitle yapf doq'
python3 -m venv ~/.config/nvim/env

source ~/.config/nvim/env/bin/activate
# run `pip uninstall neovim pynvim` if still using old neovim module
pip3 install pynvim jedi psutil setproctitle yapf doq
deactivate

# install vim-plug
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo '[*] 安装插件管理器 vim-plug'
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# 安装插件
echo '[*] 安装插件'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

echo -e "[+] 配置完成"