set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



" ---------------------------------------------------------------------------
" Vundle.vim
" ---------------------------------------------------------------------------

" source $VIM/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=$VIM/vimfiles/bundle/Vundle.vim

" call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
call vundle#begin('$VIM/vimfiles/bundle/')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.

" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'
Plugin 'travisjeffery/vim-auto-mkdir'
Plugin 'tomtom/tcomment_vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'klen/python-mode'

" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
Plugin 'matchit.zip'

" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'

" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'

" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ

" ---------------------------------------------------------------------------



" ---------------------------------------------------------------------------
" encoding configure
" ---------------------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,chinese,latin1
set fileencoding=utf-8

set langmenu=zh_CN.utf-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

language message zh_CN.utf-8

" ---------------------------------------------------------------------------
" base configure
" ---------------------------------------------------------------------------
" Linux/MacOSX
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" Windows
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.7z,*.exe,*.dll,*.cpx,*.msc,*.cpl,*.tlb,*.pyc,*.pyo,*.wsgic

set fileformat=unix
set fileformats=unix

set autochdir

" 自动检测文件类型
" filetype plugin indent on

" 语法高亮
syntax on

" colorscheme
" ---------------------
" set background=light
colorscheme solarized

" 关闭错误提示音
" set noerrorbells
set vb t_vb=

" 备份和缓存
set nobackup
set noswapfile

" 文件被改动时自动载入
set autoread

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 显示行号
set number

" 命令行（在状态行下）的高度，默认为1，这里是2
" set cmdheight=2
" 总是显示状态行
set laststatus=2
"在状态行显示命令行
" set showcmd
"高亮显示当前行
set cursorline
" 显示底部滚动条
"set guioptions+=b

" 搜索的时候忽略大小写
set ignorecase
" 输入搜索内容时就显示搜索结果
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 最大宽度
set textwidth=79
" 换行
set wrap
"set nowrap
" 80列显示红线
set colorcolumn=80

" 自动缩进
set autoindent
set smartindent

" 制表符为4
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 用空格代替制表符
set expandtab

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2

set backspace=indent,eol,start

" ---------------------------------------------------------------------------
" CtrlP
" ---------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|pyc|wsgic)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }
" let g:ctrlp_custom_ignore = {
" \ 'file': '\v(\.py|\.wsgi)@<!$'
" \ }

" let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'

" ---------------------------------------------------------------------------
" airline
" ---------------------------------------------------------------------------

let g:airline_powerline_fonts=1
" 需要安装字体 https://github.com/Lokaltog/powerline-fonts

" ---------------------------------------------------------------------------
" tagbar
" ---------------------------------------------------------------------------
let g:tagbar_width=30
let g:tagbar_expand=1

let g:tagbar_autofocus=1

" <silent>
nmap <leader>tb :TagbarToggle<CR>

" ---------------------------------------------------------------------------
" Indent Guides
" ---------------------------------------------------------------------------


" ---------------------------------------------------------------------------
" syntastic (syntax checkers)
" ---------------------------------------------------------------------------

" python
" require packages: pylint, pyflakes, pep8
" let g:syntastic_python_checkers=['pyflakes', 'pep8']

" ---------------------------------------------------------------------------
" omni-completion
" ---------------------------------------------------------------------------
" set wildmenu
set completeopt=longest,menu

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" ---------------------------------------------------------------------------
" python
" ---------------------------------------------------------------------------

" python mode
" --------------

let g:pymode_python = 'python3'

" let g:pymode_paths = []
" let g:pymode_indent = []

let g:pymode_folding = 0
" let g:pymode_motion = 1

" Values may be choosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

autocmd FileType python noremap <buffer> <leader>ff :PymodeLintAuto<CR>

nmap <leader>r :PymodeRun<CR>
