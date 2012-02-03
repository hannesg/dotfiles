set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" yep, I want a mouse (sometimes)
set mouse=a
"" and my scripts are utf-8 encoded
scriptencoding utf-8

"" Numbering
set number                      " yep, I want line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=DarkBlue guibg=NONE

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Mapleader
let mapleader = ','

"" TABS!!!!
map <A-Left> :tabprev<CR>
map <A-Right> :tabnext<CR>
imap <A-Left> <C-\><C-O>:tabprev<CR>
imap <A-Right> <C-\><C-O>:tabnext<CR>

"" Display whitespace
set list
set listchars=eol:$,tab:>-,trail:‧,extends:>,precedes:<

"" me wants backups
"" set backup
"" me wants saved view state
au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

"" persitent undo
set undofile
set undolevels=100 "maximum number of changes that can be undone
set undoreload=1000 "maximum number lines to save for undo on a buffer reload

"" enough space
set history=100

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"set selectmode=key
"set keymodel+=startsel

"easy selecting with shift
map <S-Left> <Esc>vh
map <S-Right> <Esc>vl
map <S-Up> <Esc>vk
map <S-Down> <Esc>vj
imap <S-Left> <C-\><C-O>vh
imap <S-Right> <C-\><C-O>vl
imap <S-Up> <C-\><C-O>vk
imap <S-Down> <C-\><C-O>vj

"don't leave visual when shift-moving
vmap <S-Left> h
vmap <S-Right> l
vmap <S-Up> k
vmap <S-Down> j

"use alt-arrow for tab navigation:
map <A-Down> :tabedit<CR>
imap <A-Down> <C-O>:tabedit<CR>

map <A-Up> :q<CR>
imap <A-Up> <C-\><C-O>:q<CR>

"use control-c/x/v for X11 clipboard
vmap <C-c> "+y
map <C-c> "+y

vmap <C-x> "+c
map <C-x> "+c

map <C-v> "+gP
imap <C-v> <C-O>"+gP
vmap <C-v> "+gP

inoremap <C-w> <C-O>:w<CR>

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


"" don't put things anywhere
set backupdir=~/.vimdata/backup//
set dir=~/.vimdata/swap//
set viewdir=~/.vimdata/view//
set undodir=~/.vimdata/undo//

"" set statusline=%#StatColor#%F%=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y[%c,%l/%L]%*

au InsertLeave * hi TabLineSel cterm=NONE
au InsertEnter * hi TabLineSel cterm=Bold

hi TabLine ctermbg=None ctermfg=DarkBlue cterm=NONE
hi TabLineSel ctermbg=None cterm=NONE
hi TabLineFill ctermbg=None cterm=NONE


""
call pathogen#infect()
call pathogen#helptags()

color jellybeans

hi link IndentGuidesEven VertSplit
hi IndentGuidesOdd None


"" CTRLP {
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multi = '1t'

"" }

"" use local vimrc if available {
 if filereadable(expand("~/.vimrc.local"))
   source ~/.vimrc.local
 endif
" }
