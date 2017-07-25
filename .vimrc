

"基础配置
set tags=tags; "ctags
set autochdir  "ctags
set backspace=indent,eol,start
set nocompatible  "去VI的兼容
set guifont=Courier\10\Pitch\ 15
set number
set numberwidth=2
set ts=4
set expandtab
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set cul
set ruler

"------------------------------------------------------------------------------------airline状态栏
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
"设置中文帮助
set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
set laststatus=2 "状态栏插件
let g:airline#extensions#tabline#enabled = 1       "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '     "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'  "tabline中buffer显示编号
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"___________________________________________________________________________________
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"-----------------------------------------------------------------------------------插件安装

Plugin 'VundleVim/Vundle.vim'             "-- 插件管理
Plugin 'bling/vim-airline'                "-- 状态栏插件
Plugin 'altercation/vim-colors-solarized' "-- 颜色主题
Plugin 'tomasr/molokai'                   "-- 颜色主题
Plugin 'ctrlpvim/ctrlp.vim'               "-- CTRLP[文件搜索]
Plugin 'scrooloose/nerdcommenter'         "-- 快速高效注释
Plugin 'mattn/emmet-vim.git'              "-- 写HTML插件
Plugin 'bronson/vim-trailing-whitespace'  "-- TRAILING-WHITESPACE[行尾空格处理]
Plugin 'thinca/vim-quickrun'              "-- QUICKRUN[快速执行]
Plugin 'docunext/closetag.vim'            "-- CLOSETAG[成对标签补全]
Plugin 'terryma/vim-expand-region'        "-- 视图模式下可伸缩选中部分，用于快速选中某些块
Plugin 'kshenoy/vim-signature'            "-- 快速标记跳转 无编辑
Plugin 'terryma/vim-multiple-cursors'     "-- 多光标操作
Plugin 'junegunn/vim-easy-align'          "-- EASY-ALIGN[快速对齐]
Plugin 'vim-scripts/matchit.zip'          "-- MATCHIT[成对标签跳转]  无编辑
Plugin 'Raimondi/delimitMate'             "-- DELIMITMATE[符号自动补全]
Plugin 'kien/rainbow_parentheses.vim'     "-- 括号高亮
Plugin 'scrooloose/nerdtree'              "-- 目录树
Plugin 'Lokaltog/vim-easymotion'          "-- 跳转
Plugin 'SuperTab'                         "__  文本补全
Plugin 'vim-airline/vim-airline-themes'   "__ airline的色彩插件
Plugin 'tpope/vim-repeat'                 "__ 重复插件操作
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'majutsushi/tagbar'                "__ 大纲导航
Plugin 'mbbill/undotree'                  "-- 时光机
call vundle#end()
filetype plugin indent on

"---------------------------------------------------------------------------------配色
syntax on
let g:molokai_original = 1
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

"---------------------------------------------------------------------------------ctrl设置
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"--------------------------------------------------------------------funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']


"--------------------------------------------------------------------------------- NERDCOMMENTER注释
let g:NERDSpaceDelims=1


"----------------------------------------------------------------------------------TRAILING-WHITESPACE
map <leader><space> :FixWhitespace<cr>  "一键去除所有空格


"----------------------------------------------------------------------------------emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.


"-----------------------------------------------------------------------------------QUICKRUN快速执行
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>


"-----------------------------------------------------------------------------------CLOSETAG成对标签补全
let g:closetag_html_style=1


"-----------------------------------------------------------------------------------EXPAND-REGION
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

"-----------------------------------------------------------------------------------MULTIPLE-CURSORS[多光标操作]
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


"-----------------------------------------------------------------------------------EASY-ALIGN[快速对齐]
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

"-----------------------------------------------------------------------------------DELIMITMATE[符号自动补全]
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0

"-----------------------------------------------------------------------------------括号高亮
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-------------------------------------------------------------------------------目录树
" 配置F2快捷键开启
map <F2> :NERDTreeToggle<CR>
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au） autocmd VimEnter * NERDTree

" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧） let NERDTreeWinPos="right"

" 当打开 NERDTree 窗口时，自动显示 Bookmarks let NERDTreeShowBookmarks=1



"--------------------------------------------------------------------------------跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
"----------------------------------------------------------------------------------文本补全
let g:SuperTabRetainCompletionType=2



"----------------------------------------------------------------------------------themes
let g:airline_theme='molokai'
" badwolf 和dark差不多
 " 2 base16 银，紫
 " 3 behelit 浅蓝
 " 4 bubblegum 暗绿，粉。          推荐！
 " 5 dark 亮黄
 " 6 durant 比dark暗些
 " 7 hybrid 灰
 " 8 hybridline 绿，棕
 " 9 jellybeans 黑灰
" 10 kalisi 暗黄，绿
" 11 kolor 蓝色的
" 12 laederon 银，红
" 13 light 浅亮蓝，红，银
" 14 lucius 灰，银
" 15 luna 蓝绿色
" 16 molokai 棕，蓝，橙
" 17 monochrome
" 18 murmur 蓝，橙
" 19 papercolor 银，浅蓝
" 20 powerlineish 暗黄，橙
" 21 raven 灰
" 22 serene 黑
" 23 silver 太银了，深绿
" 24 simple 亮蓝
" 25 sol 银，深蓝
" 26 solarized 太多色
" 27 term 绿，蓝
" 28 tomorrow
" 29 ubaryd
" 30 understated
" 31 wombat 亮黄
" 32 zenburn 蓝，橙
"------------------------------------------ 大纲导航
nmap <F9> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
"------------------------------------- 时光机
nnoremap <F6> :UndotreeToggle<cr>
set undodir=~/.undodir/
set undofile
