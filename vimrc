set number

"Vim-plug section
call plug#begin('~/.vim/plugged')

"Misc
Plug 'scrooloose/nerdtree'
"https://github.com/junegunn/vim-plug
Plug 'junegunn/vim-easy-align'
Plug 'flazz/vim-colorschemes'
Plug 'valloric/youcompleteme'

"apt install fzf
"fzf#install() makes sure that you have the latest binary, but it's optional, so you can omit it if you use a plugin manager that doesn't support hooks.
"https://github.com/junegunn/fzf#using-linux-package-managers
"https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"language support
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'

"Syntax hacks
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'raimondi/delimitmate'

"Website stuff
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'

"Git commit browser
Plug 'junegunn/gv.vim'

"gdb debugger
""https://github.com/cpiger/NeoDebug
Plug 'cpiger/NeoDebug'

"gcc automation
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'
"https://github.com/skywind3000/asynctasks.vim

"python indent aid
Plug 'tweekmonster/braceless.vim'

"Hexa-decimal editor
"https://github.com/Shougo/vinarise.vim
"https://github.com/Shougo/deorise.nvim
Plug 'Shougo/deorise.nvim', { 'do': ':UpdateRemotePlugins' }

"Make the yanked region apparent
"https://github.com/machakann/vim-highlightedyank
Plug 'machakann/vim-highlightedyank'

"diffdir
"usage: :DirDiff <dir1><dir2>
Plug 'will133/vim-dirdiff'

call plug#end() 
"TODO: . ~/.vim || :so %
"TODO: :PlugInstall
"UPDATE: :PlugUpdate
"sudo apt install vim-nox

"More .vim scripts
"https://github.com/vim-scripts
"https://vimawesome.com/
