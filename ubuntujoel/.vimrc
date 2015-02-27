" To use this, copy it to:
"    for Unix and OS/2: ~/.vimrc
"    for Amiga: s:.vimrc
"    for MS-DOS and Win32: $VIM\_vimrc
"    for OpenVMS: sys$login:.vimrc " convert tab characters to 4 space chars
"
" allow backspacing over everything while in insert mode
set backspace=indent,eol,start 

" Set indenting to hard tabs (nospaces and use 4 chars)
set shiftwidth=4
set tabstop=4
set expandtab                                            
set autoindent
set smartindent 

"set number  " show line numbers
set ruler  " show current row and column

set history=100  " set # of lines of command line history to keep
set showcmd  " display incomplete commands
set incsearch  " do incremental searching
set smartcase  " ignore case for lower-case searches

" In many terminal emulators the mouse works just fine, so enable it
if has('mouse')
    set mouse=a
endif

" Some Linux distributions set filetype in /etc/vimrc.                          
" Clear filetype flags before changing runtimepath to force Vim to reload them. 
filetype off                                                                    
filetype plugin indent off                                                      
set runtimepath+=$GOROOT/misc/vim                                               
filetype plugin indent on                                                       
syntax on                
set colorcolumn=80
set hlsearch
set nofoldenable  "Open all folds at startup

" Plugin - Pathogen
" Manage vim plugins
"filetype plugin on
"filetype indent on
"call pathogen#infect()  "Which is correct: 'call' or 'execute'?
"syntax on
"filetype plugin indent on                                                       
"call pathogen#helptags()

" Plugin - python-mode
" Check syntax for Python
" (For python only: Use the more advanced python-mode instead of syntastic.)
" WARNING: Do not use python-mode with jedi-vim, they conflict.
" (As soon as you write a file, it runs python-mode. No setup needed here.)

" Plugin - syntastic
" Check syntax for various languages
" (For python only: Use the more advanced python-mode instead of syntastic.)
"let g:syntastic_python_checkers = ['go']
"let g:syntastic_quiet_messages = { "type": "style" }  "Disable style checks

" Plugin - nerdtree
"let loaded_nerd_tree=1  "Disable nerd tree

" Plugin - python compiler
"autocmd BufNewFile,BufRead *.py compiler python
