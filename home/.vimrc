set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" no, i don't want swap files
set noswapfile

"" yep, I want a mouse (sometimes)
set mouse=a
"" and my scripts are utf-8 encoded
scriptencoding utf-8

"" draw a column at the textwidth and at 80 chars width, so I can wrap long 
"" lines like this one.
set colorcolumn=+0,80

"" Numbering
set number                      " yep, I want line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=DarkBlue guibg=NONE

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=eol,start  " backspace through everything in insert mode

"" Searching
set incsearch                   " incremental searching

"" Mapleader
let mapleader = ','

"" TABS!!!!
map <C-h> :tabprev<CR>
map <C-l> :tabnext<CR>
imap <C-h> <C-\><C-O>:tabprev<CR>
imap <C-l> <C-\><C-O>:tabnext<CR>

"" Display whitespace
set list
set listchars=eol:$,tab:>-,trail:‧,extends:>,precedes:<
"" enough space
set history=100

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"" indent guides :)
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

"" just insert the longest common match:
set completeopt=menu,longest,preview

imap <C-Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-X>\<lt>C-I>"<CR>
imap <C-Up> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-X>\<lt>C-I>"<CR>

"" ignore some common things
set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.luac " Lua byte code
set wildignore+=*.pyc " Python byte code
set wildignore+=.rbx " rbx byte code


"" set statusline=%#StatColor#%F%=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y[%c,%l/%L]%*

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'jellybeans'
Bundle 'ctrlp'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mbbill/undotree'

color jellybeans

"" use local vimrc if available {
 if filereadable(expand("~/.vimrc.local"))
   source ~/.vimrc.local
 endif
" }
