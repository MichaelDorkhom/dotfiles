:set number relativenumber

" Open vimrc
nnoremap <leader>v :e ~/Documents/Repos/dotfiles/.vimrc<CR>
nnoremap <leader>V :tabnew ~/Documents/Repos/dotfiles/.vimrc<CR>

" Config to switch pages
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

" Config to switch panes
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'

call plug#end()

" Config for fuzzy search
nnoremap <C-p> :Files<CR>

" Config for statusline
let g:airline#extensions#branch#enabled = 1

" Config for NERDtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode="<Tab>"
let g:NERDTreeMinimalUI = 1

" Config for coloscheme
colorscheme gruvbox

" Config for Ag search
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --vimgrep'

nnoremap <C-f> :Ag<SPACE>
