"            _                            _          __
"           (_)                          (_)        |  ]
"  _   __   __    _ .--..--.    ______   __     .--.| |   .---.
" [ \ [  ] [  |  [ `.-. .-. |  |______| [  |  / /'`\' |  / /__\\
"  \ \/ /   | |   | | | | | |            | |  | \__/  |  | \__.,
"   \__/   [___] [___||__||__]          [___]  '.__.;__]  '.__.'
"

if has('autocmd')
  " 为了可以重新执行 vimrc，开头先清除当前组的自动命令
  au!
endif

" 支持中文不乱码
set enc=utf-8
" 不需要兼容 vi
set nocompatible

set fileencodings=ucs-bom,utf-8,gb18030,latin1
" set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set scrolloff=1
" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase

" 定义快捷键的前缀，即<Leader>
let mapleader=","

" source $VIMRUNTIME/vimrc_example.vim

" 启用 man 插件
source $VIMRUNTIME/ftplugin/man.vim

if has('gui_running')
  " 下面两行仅为占位使用；请填入你自己的字体
  if has("gui_macvim")
    set macligatures
  endif
  set guifont=Fira\ Code:h14

  " 不延迟加载菜单（需要放在下面的 source 语句之前）
  let do_syntax_sel_menu = 1
  let do_no_lazyload_menus = 1

  " 设置文本菜单
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<C-Z>
    nnoremap <F10>      :emenu <C-Z>
    inoremap <F10> <C-O>:emenu <C-Z>
  endif

endif

" 不生成备份文件
set nobackup
" 撤销文件保存目录
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
  endif
endif


" 显示行号
set nu
set number

" 突出显示当前行
set cursorline
set cul " cursorline的缩写形式

" 启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" if has('mouse')
"  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
"    set mouse=a
"  else
"    set mouse=nvi
"  endif
" endif

" 显示括号匹配
set showmatch

" 设置Tab长度为4空格
set tabstop=4
" 设置自动缩进长度为4空格
set shiftwidth=4
" 继承前一行的缩进方式，适用于多行注释
set autoindent
" 设置粘贴模式
" set paste

" 显示空格和tab键
set listchars=tab:>-,trail:-
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 打开文件类型检测
filetype plugin indent on
" 打开语法高亮
syntax on
syntax enable
" 让vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

"==============================================================================
" GVim 的配置
"==============================================================================
if has('gui_running')
  " 设置启动时窗口的大小
  " set lines=800 columns=600 linespace=4

  " set guioptions-=m " 隐藏菜单栏
  " set guioptions-=T " 隐藏工具栏
  " set guioptions-=L " 隐藏左侧滚动条
  " set guioptions-=r " 隐藏右侧滚动条
  " set guioptions-=b " 隐藏底部滚动条
  " 在 gvim 下不会和 terminal 的 alt+数字的快捷键冲突，
  " 所以将 tab 切换配置一份 alt+数字的快捷键
  :nn <M-1> 1gt
  :nn <M-2> 2gt
  :nn <M-3> 3gt
  :nn <M-4> 4gt
  :nn <M-5> 5gt
  :nn <M-6> 6gt
  :nn <M-7> 7gt
  :nn <M-8> 8gt
  :nn <M-9> 9gt
  :nn <M-0> :tablast<CR>
endif