set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set bs=2
set autoindent

" Enable autocompletion
set wildmode=longest,list,full

" Automatically remove trailing spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Space bar used for spaces
nnoremap <space> i<space><esc>

" Enter used for blank lines
nnoremap <enter> o<ESC>
nnoremap <s-enter> O<ESC>

" Open vimrc
nnoremap <leader>v :e ~/Documents/Repos/dotfiles/.vimrc<CR>
nnoremap <leader>V :tabnew ~/Documents/Repos/dotfiles/.vimrc<CR>

" Config to switch pages
nnoremap <c-j> 5j
nnoremap <c-k> 5k

" Config to switch panes
nnoremap <C-[> <C-W>h
nnoremap <C-]> <C-W>l

" Config to jump between the two most recent files
nnoremap <C-b> <C-^>

" Config to switch between buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Find and replace word under cursor
nnoremap <C-z><C-r> :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raimondi/delimitmate'

call plug#end()

" Config for fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :History/<CR>
nnoremap <C-f> :Rg<CR>

" Config for statusline
let g:airline#extensions#branch#enabled = 1

" Config for NERDtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

map <C-n> :NERDTreeToggle<CR>
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

" Config for coc
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
