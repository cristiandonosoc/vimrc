"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is my own custom version of this vimrc, more documented
" and with some features added/disabled
"
" Cristián Donoso (cristiandonosoc@gmail.com)
"
" Original Author (whose my vimrc is based on):
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Original Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

set synmaxcol=128

" Enable filetype plugins
filetype on
" Automatic filetype plugins are loading
filetype plugin on
" Automatic filetype indenting
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :WS sudo saves the file
" (useful for handling the permission-denied error)
command WS w !sudo tee % > /dev/null

set tags=./.tags,./tags                     " Use a dot tags file
set viminfo^=!                              " Save uppercase variables

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
" This options will always try to keep this amount of lines over and below the cursor
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Show line numbers
set number

" Show cursor line
set cursorline

" Show cursor column
set cursorcolumn

" Turn on the WiLd menu (list of options being available for complete)
set wildmenu
" Functionality for tab at option autocomplete
" First tabs completes as much as it can and show options
" Further tabs iterate over options
set wildmode=list:longest,full

" Ignore compiled files on wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current line, character and % in status bar
set ruler

" Height of the command bar (in lines)
set cmdheight=1

" A buffer becomes hidden when it is abandoned
" Normal behaviour is to close the buffer (ie. prompt to save changes)
" set hidden

" Configure backspace so it acts as it should act
" start: delete before the start of insert (so annoying if off)
" eol: deletes from the start of a line to end of the previous
" indent: deletes over autoindent (yet to see what exactly this is)
set backspace=eol,start,indent

" Set which characters wraps lines: jump over eols
" set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
" Ignore case if all lower, but don't ignore is there is upper
set smartcase

" Results remain highlighted for last search
" Can be dismissed by :hlnosearch (reseted after another search)
set hlsearch

" Makes search act like search in modern browsers
" Matches as it searches
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" This enables that special characters (such as *) don't have to be escaped
set magic

" Show matching brackets when text indicator is over them
" Briefly jumps the cursor when inserting a matching bracket
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells novisualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Margin to the left of line numbers used to indicate folding
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Consolas:h10
    set guioptions-=T           " Include window toolbar
    set guioptions-=e           " Add tab pages
    set t_Co=256                " Number of colors in the terminal
    set guitablabel=%M\ %t      " Tab Name formatting
else
  set term=xterm-256color
endif

" Solarized color scheme enable (put solarized.vim in .vim/colors)
set background=dark
try
    colorscheme solarized
catch
    colorscheme desert
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac
set fileformat=unix

" We highlight the extra whitespaces after a line
"highlight ExtraWhitespace ctermbg=blue guibg=lightgreen
"match ExtraWhitespace /\s\+$/
"autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO(Cristian): Research folding
"set foldenable              " Enable folding
"set foldlevelstart=10       " Open folds of 10 levels or less at start
"set foldnestmax=10          " 10 nested folds max
" space opens/closes folds
"nnoremap <space> za
"set foldmethod=indent       " Vim folds on indentation


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
" Set a write backup. This means that if writing fails, we can roll back
set writebackup

" Enables swap files in order to undo work
" TODO(Cristian): Set external swap directory that remains file
"                 so we can undo between instances of vim
set swapfile

" Where to put swap, backup and undo files
if isdirectory(expand('~/.vim/cache'))
  if &directory =~# '^\.,'
    set directory^=~/.vim/cache/swap
  endif
  if &backupdir =~# '^\.,'
    set backupdir^=~/.vim/cache/backup
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    set undodir^=~/.vim/cache/undo
  endif
endif
if exists('+undofile')
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces,
set tabstop=2       " Amount of spaces in a tabSpaces in a tab
set softtabstop=2   " Tab Extension When Editing
set expandtab       " Tabs are spaces
set tabstop=2       " Amount of spaces in a tabSpaces in a tab
set shiftwidth=2    " The >> and << space value. Auto-indent works this way

set autoindent      " Try to copy the indent of the previous line
set smartindent     " Indent better with scopes

" Wrap lines after the buffer width is reached
set wrap

set tabpagemax=15

set showmode        " Always show the mode
set showcmd         " Show command while it is being written

set display+=lastline       " If wrap set, display last line
set virtualedit=block       " Move freely in visual block
set linebreak               " Wrap at spaces characters
set nojoinspaces            " One space after sentences

set splitright              " We always split to the right :)

" Better unprintable characters
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  let &listchars="tab:\u25b8 ,trail:\u2423,nbsp:\u26ad,eol:\u00ac,extends:\u21c9,precedes:\u21c7"
  let &fillchars="fold:\u00b7"
  let &showbreak="\u00bb "
endif



""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Repeat with <leader>j and <leader>k
vnoremap <silent> <leader>j :call VisualSelection('f', '')<CR>
vnoremap <silent> <leader>k :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" B and E move to beggining/end of line respectively
nnoremap B ^
nnoremap E $

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :nohlsearch<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>          " Open a new tab
map <leader>to :tabonly<cr>         " Close all other tabs
map <leader>tc :tabclose<cr>        " Close current tab
map <leader>tm :tabmove             " Ask for how many tabs move current tab

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Opens the vim page for the current buffer's path
map <leader>td :tabedit <c-r>=expand("%:p:h")<cr>/<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <A-j> mz:m+<cr>`z
nmap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <A-j>
  nmap <D-k> <A-k>
  vmap <D-j> <A-j>
  vmap <D-k> <A-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"

" Open the error window
map <leader>cc :botright copen<cr>
" Not sure what this is...
" TODO(Cristian): Find out what this command does
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>       " Next error
map <leader>p :cp<cr>       " Previous error


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=es,en                         " Spelling languages
set spellsuggest=10                         " Number of spelling suggestions
"set spellfile=~/.vim/spell/mine.utf-8.add   " Spell file for additions

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s           " Next spell error
map <leader>sp [s           " Previous spell error
map <leader>sa zg           " Add word to dictionary
map <leader>s? z=           " Proposals for words (not very friendly, but works)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :vs ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :vs ~/buffer.md<cr>

" Toggle paste mode on and off (useful when pasting code snippets)
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apparently enables us to call command line argumenst from VimScript
" ie: :call CmdLine('echo $PATH') is equal to :!echo $PATH
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Function used to make some editing over some selectec text in visual mode.
" Used all throughout this vimrc
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
" TODO(Cristian): See if this functionality is wanted
"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"     buffer #
"   else
"     bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"     new
"   endif
"
"   if buflisted(l:currentBufNum)
"     execute("bdelete! ".l:currentBufNum)
"   endif
"endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" We execute pathogen to load the plugins
try
  execute pathogen#infect()
catch
endtry

" Recommended plugins
" - nerdtree: *Much* better directory traversing
" - supertab: easy out-of-the-box autocomplete
" - tcomment: commenting/uncommenting
" - vim-airline: cooler status bar

