set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin('~/.vim/bundle')

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
" OpenGL syntax
Plugin 'tikhomirov/vim-glsl'
" Text-templates
Plugin 'aperezdc/vim-template'
" Typescript
Plugin 'leafgarland/typescript-vim'

call vundle#end()

filetype plugin indent on
