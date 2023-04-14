
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set number
set nrformats=
set textwidth=80
set nocompatible
set formatoptions+=m

autocmd Filetype cpp setlocal ts=2 sw=2 expandtab
autocmd Filetype h setlocal ts=2 sw=2 expandtab

hi Comment ctermfg=LightBlue
" Add 'k' to the list to enable dictionary completion source
set complete+=k
set complete+=t
"autocmd FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.md'
set dict+=~/.vim/words/cmake.md
set dict+=~/.vim/words/why.md
set dict+=~/.vim/words/moab.md

set encoding=utf-8
set fileencodings=utf-8,GBK 

" Syntax highlighting and validate
syntax enable " syntax highlighting 

filetype on
filetype plugin on " try to detect filetypes
filetype indent plugin on " enable loading indent filesfor filetypes
language en_US.utf8

"forbiden generate swap file 
set noswapfile

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
nnoremap <F2>:set nonumber!<CR>:set foldcolumn=0<CR>


" Indent guides 
set cc=80
let g:indent_guides_guide_size=1


nmap <F3> i<C-R>=strftime("%Y.%m.%d")<CR><Esc>
imap <F3> <C-R>=strftime("%Y.%m.%d")<CR>

nmap <F4> i<C-R>=strftime("%H:%M:%S")<CR><Esc>
imap <F4> <C-R>=strftime("%H:%M:%S")<CR>

"nmap <F5> i<C-R>=strftime("%Y.%m.%d %a, %H:%M:%S")<CR><Esc>
"imap <F5> <C-R>=strftime("%Y.%m.%d %a, %H:%M:%S")<CR>

" matchit
runtime macros/matchit.vim

" Vundle set up
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"------------------------------------------------------------------------------
" let Vundle manage Vundle, required
"------------------------------------------------------------------------------
Plugin 'VundleVim/Vundle.vim'
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" ultisnips 
"------------------------------------------------------------------------------
Plugin 'SirVer/ultisnips'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" Snippets
"------------------------------------------------------------------------------
Plugin 'honza/vim-snippets'
" let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/mysnippets"]
" let g:UltiSnipsSnippetDirectories=["../mysnippets", "../bundle/vim-snippets/UltiSnips"]
" let g:UltiSnipsSnippetDirectories=["../bundle/vim-snippets"]
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" YouCompleteMe 
"------------------------------------------------------------------------------
Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_confirm_extra_conf = 0
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" Several modern GUI editors list your open buffers as tabs along the top or bottom of your screen
Plugin 'fholgado/minibufexpl.vim'
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" markdown
"------------------------------------------------------------------------------
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" latex
"------------------------------------------------------------------------------
Plugin 'vim-latex/vim-latex'
let g:Imap_UsePlaceHolders = 0
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" latex-live-preview 
"------------------------------------------------------------------------------
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" let g:livepreview_engine = 'livepreview_engine', ['pdflatex', 'xelatex']
" let g:tex_flavor = "xelatex"
" let g:tex_flavor = "latex"
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" markdown-preview 
"------------------------------------------------------------------------------
Plugin 'iamcco/markdown-preview.nvim' 
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" jedi-vim
"------------------------------------------------------------------------------
Plugin 'davidhalter/jedi-vim'
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" syntastic
"------------------------------------------------------------------------------
Plugin 'vim-syntastic/syntastic'
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" C/C++ checker
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['gcc']

" Python checker
let g:syntastic_python_checkers = ['flake8']
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------
Plugin 'preservim/nerdtree'
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" vim-airline
"------------------------------------------------------------------------------
Plugin 'vim-airline/vim-airline'
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" vim-airline-themes
"------------------------------------------------------------------------------
Plugin 'vim-airline/vim-airline-themes'
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" vim-fugitive
"------------------------------------------------------------------------------
Plugin 'tpope/vim-fugitive'
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" vim-doge: 代码文档自动插入 
"------------------------------------------------------------------------------
Plugin 'kkoomen/vim-doge'
"------------------------------------------------------------------------------


call vundle#end()            " required

filetype plugin indent on    " required

execute pathogen#infect()
