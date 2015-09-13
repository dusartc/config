" VIM Configuration - Clement Dusart
" annule retro compatibilité
set nocompatible

" Activation de pathogen
call pathogen#infect()
call pathogen#helptags()

" -- Affichage
set title
set number
set ruler
set wrap
set scrolloff=3

" -- Recherche
set ignorecase
set smartcase
set incsearch
set hlsearch

" -- beep
set visualbell
set noerrorbells

" -- backspace
set backspace=indent,eol,start

" cache les fichiers lors d'ouvertures d'autres fichiers
set hidden

" plantage de choux
syntax enable

" comportement specifiques aux fichiers
filetype on
filetype plugin on
filetype indent on

" join the dark side, we have cookies
set background=dark
" colorscheme solarized

" adieu touches directionnelles, ce fut un honeur de combattre a vos cotes
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" leader key
"let mapleader=","

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

