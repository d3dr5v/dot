set runtimepath+=~/@/dot/.vim
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
nnoremap <silent> <C-p> :Files<CR> " ctrl p file search

let g:netrw_localrmdir="rm -rf"

command! -bar -bang Q quit!
cabbrev q quit!

hi! link VertSplit Ignore
hi! link EndOfBuffer Ignore
set fillchars+=eob:\ " The trailing space is important






if exists('$TMUX')
    let session_name = system("tmux display-message -p '#S'")
    let session_name = substitute(session_name, '\n', '', 'g')

    if session_name == 'r'
        colorscheme red
    elseif session_name == 'g'
        colorscheme green
    elseif session_name == 'b'
        colorscheme blue
    elseif session_name == 'y'
        colorscheme yellow
    elseif session_name == 'p'
        colorscheme purple
    else
        colorscheme white
    endif
else
  colorscheme white
endif







