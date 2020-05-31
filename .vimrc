"""""""""""""" .vimrc """"""""""""""""""""""""""""""""""""""""""""""
" Heavily based on James Tomasinos .vimrc
" https://github.com/jamestomasino/dotfiles
"
"""""""""""""" BUNDLES """""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-multiple-cursors'       " multiple cursor support

call plug#end()

"""""""""""""" FUNCTIONS """""""""""""""""""""""""""""""""""""""""""
"""""""""""""" AUTOCMD """""""""""""""""""""""""""""""""""""""""""""

if has('autocmd')
    augroup type_make
        autocmd!
        autocmd filetype make setlocal noexpandtab
        autocmd filetype make setlocal softtabstop=4
        autocmd filetype make setlocal shiftwidth=4
        autocmd filetype make setlocal tabstop=4
    augroup END
endif


"""""""""""""" SETTINGS """"""""""""""""""""""""""""""""""""""""""""
" miscelanious settings {{{
filetype plugin indent on       " Automatically detect file types.
syntax on                       " Syntax highlighting
set encoding=utf-8
scriptencoding utf-8
" }}}


" ag support {{{
if executable("ag")
    set grepprg=ag\ --ignore\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" sets {{{
set autoindent                  " Indent at the same level of the previous line
set backspace=indent,eol,start  " Backspace for dummies
set background=dark             " use dark theme
set backup                      " Backups are nice ...
set backupdir=./.backup,.,/tmp
set clipboard^=unnamed,unnamedplus
"set colorcolumn=80
"set cursorline                  " Highlight current line
set expandtab
set fileencoding=utf-8
set foldlevelstart=20
set foldmethod=manual
set hidden                      " Allow buffer switching without saving
set history=1000                " Store a ton of history (default is 20)
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set incsearch                   " Find as you type search
set lazyredraw
set linespace=0                 " No extra spaces between rows
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set mouse=                      " Automatically disable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set noshowcmd                   " Don't show the current command
set nowrap                      " Do not wrap long lines
set relativenumber number       " Use relative line numbers
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set shiftwidth=2
set showmatch                   " Show matching brackets/parenthesis
set showmode                    " Display the current mode
set softtabstop=2
set splitbelow                  " Puts new split windows to the bottom of the current
set splitright                  " Puts new vsplit windows to the right of the current
set tabpagemax=15               " Only show 15 tabs
set tags=./tags,tags;$HOME
set virtualedit=onemore         " Allow for cursor beyond last character
set winminheight=0              " Windows can be 0 line high

colorscheme monokai
" }}}


" Statusline {{{
if has('statusline')
    set laststatus=2
    set statusline=
    set statusline+=%#Search#\ %n\ 
    set statusline+=%#PmenuSel#
    set statusline+=%#CursorLine#
    set statusline+=\ %f\ 
    set statusline+=%h%m%r%w
    set statusline+=%=
    set statusline+=\ %y\ 
    set statusline+=%#Menu#
    set statusline+=\%{&fileencoding?&fileencoding:&encoding}
    set statusline+=\[%{&fileformat}\]\ 
    set statusline+=%#PmenuSel#
    set statusline+=\%p%%
    set statusline+=\%l:%c
    set statusline+=\ 
endif
" }}}


"""""""""""""" MAPPINGS """"""""""""""""""""""""""""""""""""""""""""
" clear search results {{{
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" }}}

"""""""""""""" LOCAL OVERRIDES """""""""""""""""""""""""""""""""""""

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" vim: set sw=4 sts=4 et tw=78 nospell:
