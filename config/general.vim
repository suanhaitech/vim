
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


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/mysnippets"]
let g:UltiSnipsSnippetDirectories=["../mysnippets", "../bundle/vim-snippets/UltiSnips"]
" let g:UltiSnipsSnippetDirectories=["../bundle/vim-snippets"]

" 代码自动补全 
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

" Several modern GUI editors list your open buffers as tabs along the top or bottom of your screen
Plugin 'fholgado/minibufexpl.vim'

" markdown
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1

" latex
Plugin 'vim-latex/vim-latex'
let g:Imap_UsePlaceHolders = 0

" latex 预览
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" let g:livepreview_engine = 'livepreview_engine', ['pdflatex', 'xelatex']
" let g:tex_flavor = "xelatex"
" let g:tex_flavor = "latex"

" markdown 预览
Plugin 'iamcco/markdown-preview.nvim' 


call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


