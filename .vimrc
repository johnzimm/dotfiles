" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Pathogen
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" tabs
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2
set autoindent
set cindent
set smartindent

" colors
set background=dark


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
" set number      " show line numbers (using vim-numbertoggle plugin)
set title       " show title in console title bar
set sm          " show matching braces
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin on
  filetype indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " Highlighting
  autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
  au BufNewFile,BufRead *.thtml :set ft=php  " php highlighting for cake templates
  au BufNewFile,BufRead *.ctp :set ft=php  " php highlighting for cake templates
  au BufNewFile,BufRead *.html :set ft=php  " php highlighting for on html files (I have php in my html files)
  au BufNewFile,BufRead *.tpl   :set ft=html " html highlighting for smarty templates

endif " has("autocmd")

if version>=600
    syntax enable          " syntax highlighing

    if has("gui_running")
        set guifont=Courier   " use this font 
        set lines=50      " height = 50 lines
        set columns=100       " width = 100 columns
        " set background=dark " adapt colors for background
        set selectmode=mouse,key,cmd
        set keymodel=
        " colorscheme slate
    else
        " set background=dark   " adapt colors for dark background
        " colorscheme elflord   " use this color scheme
    endif

    set background=dark
    " let g:solarized_termcolors=256  " need to do this if not using solarized for terminal
    " let g:solarized_termtrans=1
    " let g:solarized_contrast="normal"
    " colorscheme solarized
    colorscheme elflord

    " Filetypes (au = autocmd)
    au FileType help set nonumber      " no line numbers when viewing help
    au FileType help nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType help nnoremap <buffer><bs> <c-T>   " Backspace to go back

    " When using mutt, text width=72
    "au filetype mail set textwidth=72
    "au filetype tex set textwidth=72
    "au BufRead mutt*[0-9] set tw=72

    " Automatically chmod +x Shell and Perl scripts
    au BufWritePost   *.sh             !chmod +x %
    au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

    " vim-less plugin
    nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
endif

" Keyboard mapping for numeric keypad
imap <Esc>OM <c-m>
 map <Esc>OM <c-m>
imap <Esc>OP <nop>
 map <Esc>OP <nop>
imap <Esc>OQ /
 map <Esc>OQ /
imap <Esc>OR *
 map <Esc>OR *
imap <Esc>OS -
 map <Esc>OS -

imap <Esc>Ol +
imap <Esc>Om -
imap <Esc>On ,
imap <Esc>Op 0
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Oz 0

" Skeletons
"  - list filetypes:
"    :echo glob($VIMRUNTIME . '/ftplugin/*.vim')
"    :echo glob($VIMRUNTIME . '/syntax/*.vim')
au BufNewFile .gitignore :silent! exec ":0r "."~/.vim/"."skeletons/"."gitignore"
au BufNewFile *          :silent! exec ":0r "."~/.vim/"."skeletons/".&ft

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Modeline
set modeline
set modelines=5
