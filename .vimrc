set runtimepath^=~/.vim/bundle/ctrlp.vim
set shiftwidth=2
set noswapfile
set tabstop=2
set expandtab
set autoindent
set cindent
set smartindent
set foldmethod=indent
set hidden
set wrap
set mouse=a
set laststatus=0
set linebreak
set shortmess+=I

call plug#begin()
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
call plug#end()

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd BufRead * normal! zR

nnoremap K <nop>

let g:netrw_localrmdir="rm -rf"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|class\|build\|dist\|target\|debug'

command! -bar -bang Q quit!
cabbrev q quit!

" let g:sierra_Pitch = 1
" colorscheme sierra

let g:afterglow_inherit_background=1
colorscheme afterglow

hi! link VertSplit Ignore
hi! link EndOfBuffer Ignore
set fillchars+=eob:\ " The trailing space is important
