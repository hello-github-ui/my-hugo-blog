---
title: vimrc备份
categories:
  - 编程
tags:
  - vim
  - gvim
draft: false
date: 2018-05-03 17:31:59
---
# 备份一下我的 gvim 配置文件
```vim
" 使vimrc文件立马生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 设置自己的Leader
let mapleader=","
" 关于保存退出文件
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
" 处理复制粘贴，注意复制是 按住'，'然后按两下y;粘贴是按住'，'然后再按p
vnoremap <Leader>y "+y
nmap <Leader>p "+p
" 跳转Window，即多窗口时相互之间的跳转，默认是ctrl+w,h,k,j,l
" 即 ctrl+h 映射成 ctrl+w+h
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 定义快捷键到的尾部和首部
nmap H ^
nmap L $
" 快速跳转，一个J相当于3j
nmap J 3j
nmap K 3k



" 文件类型侦测
filetype on
" 根据不同的文件类型加载不同的插件
filetype plugin on


" 开启实时搜索
set incsearch
" 设置搜索时，大小写不敏感
set ignorecase
" 清除当前搜索内容的高亮
noremap <Leader><space> :nohlsearch<CR>



" 开启vim自身命令行模式智能补全
set wildmenu

" 关闭兼容模式
set nocompatible

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on
"--------
" Vim UI
"--------
" color scheme
set background=light
colorscheme fairy-garden
" 设置智能缩进
set smartindent
"设置自动缩进
set autoindent
" 行号和标尺
set number  "行号
set ruler   "在右下角显示光标位置的状态行
set rulerformat=%15(%c%V\ %p%%%)
" 标签页
set tabpagemax=20   "最多20个标签
set showtabline=2   "总是显示标签栏
" 自动重新读入
set autoread
" 显示匹配的括号
set showmatch


" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
" set relativenumber
set laststatus=2	" 显示文件名（包括路径）
set lines=35 columns=118
set guifont=Courier_new:h13













" 插件安装
source $VIMRUNTIME/vimrc_example.vim
source ~/vimfiles/autoload/plug.vim


" 之后通过vim-plug安装的插件就会安装到`~\vimfiles\plugged`这个目录下
" vim-plug的README上说，要避免使用`plugin`这个目录的名称，防止和vim标准的插件混淆
call plug#begin('~\vimfiles\plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" lightline.vim
Plug 'itchyny/lightline.vim'

" NERDTree
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}

call plug#end()

" 配置 NERDTree 映射键
map <F3> :NERDTreeToggle<CR>

" 设置配色方案
" colorscheme morning
" 字体类型和大小
" set guifont=Consolas:h12
set guifont=Source_Code_Pro:h12
set nu
" set relativenumber

" 换行时，自动缩进4列; 使用`<`或者`>`缩进时，缩进4列
set shiftwidth=4

set tabstop=4

" 把输入的tab字符替换空格，具体空格数，跟tabstop设置的值有关
" expandtab

" 会影响到Backspace键删除多个空格和删除tab字符的行为
" set softtabstop=4

set fileencodings=utf-8,chinese,latin-1
set encoding=utf-8
set belloff=all
syntax on
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
set diffexpr=MyDiff()
endif
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg1 = substitute(arg1, '!', '\!', 'g')
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg2 = substitute(arg2, '!', '\!', 'g')
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let arg3 = substitute(arg3, '!', '\!', 'g')
if $VIMRUNTIME =~ ' '
  if &sh =~ '\<cmd'
    if empty(&shellxquote)
      let l:shxq_sav = ''
      set shellxquote&
    endif
    let cmd = '"' . $VIMRUNTIME . '\diff"'
  else
    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
  endif
else
  let cmd = $VIMRUNTIME . '\diff'
endif
let cmd = substitute(cmd, '!', '\!', 'g')
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
if exists('l:shxq_sav')
  let &shellxquote=l:shxq_sav
endif
endfunction

```

由于我是在 windows 上安装的，因此以下内容并未在 linux/mac 上测试过
* 我们首先创建 `~/vimfiles/autoload` 目录
* 创建 ``~/_vimrc` 文件
* 复制我上面的内容到 `_vimrc` 文件中
* 在 vim 的命令模式中，输入 `PlugInstall` 即可

# 关于主题
我们需要从 github 上下载你喜欢的主题文件（通常类似于××.vim 格式），然后将其放入如下目录：`~/vimfiles/colors/`；
然后在配置文件中，设置 `colorscheme morning` 即可

**注意必须首先有 Source Code Pro 字体哦**
