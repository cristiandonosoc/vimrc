set rtp+=~/vimfiles/bundle/Vundle.vim/

call vundle#begin('~/vimfiles/')

" Plugin handler
Plugin 'VundleVim/Vundle.vim'
" Better filesystem management
Plugin 'scrooloose/nerdtree'
" Solarized colorscheme
Plugin 'altercation/vim-colors-solarized'
" Easier comments
Plugin 'tpope/vim-commentary'
" Autocomplete with C/C++ semantics
Plugin 'Valloric/YouCompleteMe'
" Easy scratch pad
Plugin 'mtth/scratch.vim'

call vundle#end()
