set number 
set numberwidth=2
"au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 200)   "自动透明
set ts=4
set expandtab 
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
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
Plugin 'tacahiroy/ctrlp-funky'            "-- 模糊搜索当前文件中所有函数
Plugin 'scrooloose/nerdcommenter'         "-- 快速高效注释
Plugin 'mattn/emmet-vim.git'              "-- 写HTML插件
Plugin 'bronson/vim-trailing-whitespace'  "-- TRAILING-WHITESPACE[行尾空格处理]
Plugin 'thinca/vim-quickrun'              "-- QUICKRUN[快速执行]
Plugin 'docunext/closetag.vim'            "-- CLOSETAG[成对标签补全]
Plugin 'terryma/vim-expand-region'        "-- 视图模式下可伸缩选中部分，用于快速选中某些块
Plugin 'w0rp/ale'                         "-- 语法检查
Plugin 'kshenoy/vim-signature'            "-- 快速标记跳转 无编辑
Plugin 'terryma/vim-multiple-cursors'     "-- 多光标操作
Plugin 'junegunn/vim-easy-align'          "-- EASY-ALIGN[快速对齐]
Plugin 'vim-scripts/matchit.zip'          "-- MATCHIT[成对标签跳转]  无编辑
Plugin 'Raimondi/delimitMate'             "-- DELIMITMATE[符号自动补全]
Plugin 'kien/rainbow_parentheses.vim'  "-- 括号高亮
Plugin 'scrooloose/nerdtree'             "-- 目录树
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'rking/ag.vim'                "-- 可以快速批量搜索代码，搜索文件, 模糊匹配, 正则表达式,搭配ctrlp
Plugin 'Lokaltog/vim-easymotion'     "-- 跳转
"-------------------------------------------------------------------------------------------------
call vundle#end()            
filetype plugin indent on 

"_____________________________________--插入模式下退格键不好用时
set nocompatible  "去VI的兼容
set backspace=indent,eol,start
"-------------------------------------
set guifont=Anonymice_Powerline:h14:cANSI:qDRAFT "字体

syntax on
let g:molokai_original = 1
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark 
colorscheme solarized
"-----------------------------------------------------ctrl设置
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
"-------------------------------------------------------ctrlp-funky设置
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']
"------------------------------------------------------------------------------------ NERDCOMMENTER注释
let g:NERDSpaceDelims=1
"-------------------------------------------------------------------------------------TRAILING-WHITESPACE
map <leader><space> :FixWhitespace<cr>  "一键去除所有空格
"-------------------------------------------------------------------------------------emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
"---------------------------------------------------------------------------------------QUICKRUN快速执行
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
"-----------------------------------------------------------------------------------语法检查]

"--------------------------------------------------------------------MULTIPLE-CURSORS[多光标操作]
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"--------------------------------------------------------------------EASY-ALIGN[快速对齐]
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
"--------------------------------------------------------------------- DELIMITMATE[符号自动补全]
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0
"----------------------------------------------------------------------括号高亮
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
"-------------------------------------------------------------------------目录树
" 配置F2快捷键开启
map <F2> :NERDTreeToggle<CR>
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au） autocmd VimEnter * NERDTree

" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧） let NERDTreeWinPos="right"

" 当打开 NERDTree 窗口时，自动显示 Bookmarks let NERDTreeShowBookmarks=1
"------------------------------------------------------------------govo
"<Leader>l触发limelight功能
nmap <Leader>l :Goyo<CR>
xmap <Leader>l :Goyo<CR>
"---------------------------------------------------------------- 跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

