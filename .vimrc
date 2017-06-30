set number 
set numberwidth=2
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 200)   "�Զ�͸��

set encoding=utf-8
set langmenu=zh_CN.UTF-8
" ���ô��ļ��ı����ʽ  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
"------------------------------------------------------------------------------------airline״̬��
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8 
"�������İ���
set helplang=cn
"����Ϊ˫�ֿ���ʾ�������޷�������ʾ��:��
set ambiwidth=double
set laststatus=2 "״̬�����
let g:airline#extensions#tabline#enabled = 1       "tabline�е�ǰbuffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_sep = ' '     "tabline��δ����buffer���˵ķָ��ַ�
let g:airline#extensions#tabline#left_alt_sep = '|'  "tabline��buffer��ʾ���
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"___________________________________________________________________________________
set nocompatible              
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"-----------------------------------------------------------------------------------�����װ

Plugin 'VundleVim/Vundle.vim'             "-- �������
Plugin 'bling/vim-airline'                "-- ״̬�����
Plugin 'altercation/vim-colors-solarized' "-- ��ɫ����
Plugin 'tomasr/molokai'                   "-- ��ɫ����
Plugin 'ctrlpvim/ctrlp.vim'               "-- CTRLP[�ļ�����]
Plugin 'tacahiroy/ctrlp-funky'            "-- ģ��������ǰ�ļ������к���
Plugin 'scrooloose/nerdcommenter'         "-- ���ٸ�Чע��
Plugin 'mattn/emmet-vim.git'              "-- дHTML���
Plugin 'bronson/vim-trailing-whitespace'  "-- TRAILING-WHITESPACE[��β�ո���]
Plugin 'thinca/vim-quickrun'              "-- QUICKRUN[����ִ��]
Plugin 'docunext/closetag.vim'            "-- CLOSETAG[�ɶԱ�ǩ��ȫ]
Plugin 'terryma/vim-expand-region'        "-- ��ͼģʽ�¿�����ѡ�в��֣����ڿ���ѡ��ĳЩ��
Plugin 'w0rp/ale'                         "-- �﷨���
Plugin 'kshenoy/vim-signature'            "-- ���ٱ����ת �ޱ༭
Plugin 'terryma/vim-multiple-cursors'     "-- �������
Plugin 'junegunn/vim-easy-align'          "-- EASY-ALIGN[���ٶ���]
Plugin 'vim-scripts/matchit.zip'          "-- MATCHIT[�ɶԱ�ǩ��ת]  �ޱ༭
Plugin 'Raimondi/delimitMate'             "-- DELIMITMATE[�����Զ���ȫ]
Plugin 'kien/rainbow_parentheses.vim'  "-- ���Ÿ���
Plugin 'scrooloose/nerdtree'             "-- Ŀ¼��
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'rking/ag.vim'                "-- ���Կ��������������룬�����ļ�, ģ��ƥ��, ������ʽ,����ctrlp
Plugin 'Lokaltog/vim-easymotion'     "-- ��ת
"-------------------------------------------------------------------------------------------------
call vundle#end()            
filetype plugin indent on 

"_____________________________________--����ģʽ���˸��������ʱ
set nocompatible  "ȥVI�ļ���
set backspace=indent,eol,start
"-------------------------------------
set guifont=Anonymice_Powerline:h14:cANSI:qDRAFT "����

syntax on
let g:molokai_original = 1
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark 
colorscheme molokai
"-----------------------------------------------------ctrl����
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
"-------------------------------------------------------ctrlp-funky����
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']
"------------------------------------------------------------------------------------ NERDCOMMENTERע��
let g:NERDSpaceDelims=1
"-------------------------------------------------------------------------------------TRAILING-WHITESPACE
map <leader><space> :FixWhitespace<cr>  "һ��ȥ�����пո�
"-------------------------------------------------------------------------------------emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
"---------------------------------------------------------------------------------------QUICKRUN����ִ��
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>
"-----------------------------------------------------------------------------------CLOSETAG�ɶԱ�ǩ��ȫ
let g:closetag_html_style=1
"-----------------------------------------------------------------------------------EXPAND-REGION
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
"-----------------------------------------------------------------------------------�﷨���]

"--------------------------------------------------------------------MULTIPLE-CURSORS[�������]
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"--------------------------------------------------------------------EASY-ALIGN[���ٶ���]
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
"--------------------------------------------------------------------- DELIMITMATE[�����Զ���ȫ]
" for python docstring ", �ر�����
au FileType python let b:delimitMate_nesting_quotes = ['"']
" �ر�ĳЩ�����ļ����Զ���ȫ
"au FileType mail let b:delimitMate_autoclose = 0
"----------------------------------------------------------------------���Ÿ���
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

" ����������, ��ֹ��ɫ���ų���, ����ʶ��
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"-------------------------------------------------------------------------Ŀ¼��
" ����F2��ݼ�����
map <F2> :NERDTreeToggle<CR>
" �� vim ������ʱ��Ĭ�Ͽ��� NERDTree��autocmd ������дΪ au�� autocmd VimEnter * NERDTree

" �� NERDTree �Ĵ��������� vim ���ڵ��ҲࣨĬ��Ϊ��ࣩ let NERDTreeWinPos="right"

" ���� NERDTree ����ʱ���Զ���ʾ Bookmarks let NERDTreeShowBookmarks=1
"------------------------------------------------------------------govo
"<Leader>l����limelight����
nmap <Leader>l :Goyo<CR>
xmap <Leader>l :Goyo<CR>
"---------------------------------------------------------------- ��ת
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" �ظ���һ�β���, ����repeat���, ��ǿ��
map <Leader><leader>. <Plug>(easymotion-repeat)

