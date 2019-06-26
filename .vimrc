:set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab

" Open vimrc
nnoremap <leader>v :e ~/Documents/Repos/dotfiles/.vimrc<CR>
nnoremap <leader>V :tabnew ~/Documents/Repos/dotfiles/.vimrc<CR>

" Config to switch pages
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

" Config to switch panes
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Find and replace word under cursor
nnoremap <C-f><C-r> :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

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
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Config for coloscheme
colorscheme gruvbox

" Config for Ag search
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --vimgrep'

nnoremap <C-f> :Ag<SPACE>
nnoremap <C-d><C-f> :Ag <C-r><C-w>
