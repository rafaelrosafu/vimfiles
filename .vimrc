" Based on @mislav post http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                  " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                       " display incomplete commands
filetype plugin indent on         " load file type plugins + indentation

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2 shiftwidth=2        " a tab is two spaces (or set this to 4)
set expandtab                     " use spaces, not tabs (optional)
set backspace=indent,eol,start    " backspace through everything in insert mode

"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

" My customizations
set ls=2                          " always show status bar
set number                        " show line numbers
set cursorline                    " display a marker on current line
colorscheme railscasts            " set colorscheme

set completeopt=menuone,longest   " simple autocomplete for anything
set wildmode=list:longest,full    " autocomplete for paths and files
set wildignore+=.git              " ignore these extensions on autocomplete

set hidden                        " change buffers without warnings even when there are unsaved changes

set backupdir=/tmp                " directory used to save backup files
set directory=/tmp                " directory used to save swap files

set t_Co=256                      " forces terminal to use 256 colors

silent! set guifont=Source\ Code\ Pro:h16 " tries to use Source Code Pro font
if &guifont != 'Source\ Code\ Pro:h16'    " if it doesn't work fall back to Monospace
    set guifont=Monospace\ 13
endif

let os = substitute(system('uname -s'), "\n", "", "")
if os == "Darwin"
  set fu                          " set fullscreen mode, works on Mac OS Mountain Lion
endif

call pathogen#infect()            " initializes pathogen to manage plugins

syntax enable                     " Setup Solarized theme
set background=dark               " https://github.com/altercation/vim-colors-solarized
let g:solarized_termcolors=256
colorscheme solarized

map <F2> :NERDTreeTabsToggle<CR>

" Add Ctrl+C, Ctrl+X, Ctrl+V keys to copy/cut/paste action
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
