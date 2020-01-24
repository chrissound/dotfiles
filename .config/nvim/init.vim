set nocompatible
set nopaste
syntax on

set autoindent
filetype plugin indent on

set t_Co=256
set background=dark

let mapleader=","

"function VarDumpLineToggle()
"  echom "Var dump toggle"
"	let t1 = 'var_dump('
"	let t2 = ');'
"	execute "normal ^i" . t1
"	execute "normal A" . t2
"endfunction
"map <leader>d :call VarDumpLineToggle()<CR>
"map <leader>g s/var_dump(// | :s/);$//g<CR>

set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase

set foldmethod=indent
set foldlevelstart=20

set nobackup
set noswapfile

set number
set ruler
set hlsearch
set showmatch

"set pastetoggle=<leader>p
set showmode

nmap <C-j> 4j
nmap <C-k> 4k

vnoremap <C-c> <Esc>

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" autocmd vimenter * NERDTree

cnoremap suw w !sudo tee % >/dev/null

"" xclip
"map <Leader>y :w !xclip<CR><CR>
"vmap <Leader>y :w !xclip<CR><CR>

""Syntactic
""map <Leader>s :SyntasticToggleMode<CR>
""
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 0
""let g:syntastic_check_on_open = 0
""let g:syntastic_check_on_wq = 0
""let g:syntastic_sh_shellcheck_args = "-x"

"" clear search highlight when pressing escape
nnoremap <silent> <esc> :noh<cr><esc>
set clipboard=unnamed,unnamedplus
set guicursor=

nnoremap - :Ranger<CR>

call plug#begin()
Plug 'yegappan/mru'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'LnL7/vim-nix'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'masukomi/vim-markdown-folding'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

if has("autocmd")
  filetype plugin indent on
endif

let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
