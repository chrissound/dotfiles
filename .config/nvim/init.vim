set nocompatible
set nopaste
syntax on

set autoindent
filetype plugin indent on

set t_Co=256
set background=dark
set inccommand=nosplit

let mapleader=" "

""" (old fzf)
"map <leader>fr :History<cr>
"map <leader>/ :Rg<cr>
"map <leader>* :Rg <C-R><C-W><cr>
"map <leader>pf :GFiles<cr>
""" (old fzf)

""" (new fzf-lua)
map <leader>fr  :FzfLua oldfiles<cr>
map <leader>/   :FzfLua grep_project<cr>
map <leader>* :FzfLua grep_cWORD<cr>
map <leader>pf  :FzfLua git_files<cr>

""" (new fzf-lua)


map <leader>hii :lua fzfInsertHaskellImport()<cr>
map <leader>nhi ?import <cr>
map <leader>h_ :norm cw_
map <leader>fs :w<cr>
map <leader>wF :silent execute '!gnome-terminal -- zsh -i -c "cd ' shellescape(expand("%:h")) '; vim -c silent\!:Gcd' shellescape(expand("%:p")) '; zsh -i"' <cr>
map <leader>gs :silent execute '!zsh -i -c "mg &\!"' <cr>
"map <leader>pf :Files <C-R>=expand('%:h')<CR><CR>


"function VarDumpLineToggle()
"  echom "Var dump toggle"
"	let t1 = 'var_dump('
"	let t2 = ');'
"	execute "normal ^i" . t1
"	execute "normal A" . t2
"endfunction
"map <leader>d :call VarDumpLineToggle()<CR>
"map <leader>g s/var_dump(// | :s/);$//g<CR>

set showtabline=2
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
" breaks gnome-terminal, not even sure it's used for anything
"set title
set linebreak
set cursorline
set cursorcolumn 

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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ %l\:%c\ CWD:\ %r%{getcwd()}%h\ 

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
Plug 'preservim/nerdcommenter'
" vnmap <M-;> :!whoami<CR>
nnoremap <M-;> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <M-;> :call nerdcommenter#Comment(0,"toggle")<CR>

let MRU_Max_Entries = 2000
let MRU_Max_Menu_Entries = 40
let MRU_Window_Height = 40

Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'

Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'neovimhaskell/haskell-vim'
Plug 'yegappan/mru'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'LnL7/vim-nix'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'masukomi/vim-markdown-folding'
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'dunstontc/projectile.nvim'
"Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug '907th/vim-auto-save'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'RRethy/vim-illuminate'

" Rust
Plug 'racer-rust/vim-racer'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"
Plug 'romainl/vim-qf'
Plug 'm1foley/vim-expresso'
Plug 'github/copilot.vim'


"Plug 'ycm-core/YouCompleteMe'
call plug#end()

"" ***
"" ultisnips
"" ***

let g:UltiSnipsExpandTrigger="<c-z>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

"" ***
"" /ultisnips
"" ***

let g:deoplete#enable_at_startup = 1

set termguicolors
colorscheme gruvbox

function DynamicColorThemeSwitch(timer_id)
  let l:hour = strftime('%H')

  if (l:hour < 18) && (l:hour > 3)
    set background=light
  else
    set background=dark
  endif
endfunction

"autocmd FocusLost,FocusGained * call DynamicColorThemeSwitch()
"run every 10 mins repeatedly
call timer_start(1000 * 60 * 10, function('DynamicColorThemeSwitch'), {'repeat': -1})
call DynamicColorThemeSwitch(0)

"colorscheme deep-space
"colorscheme nightfly
"
"night:
"colorscheme slate
"colorscheme nightfly
"
"day
"colorscheme zellner
"colorscheme zellner
"set background=light

if has("autocmd")
  filetype plugin indent on
endif

let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:vim_json_conceal=0
let g:vim_json_syntax_conceal = 0

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


fun! NavigateToGhcidError()
  execute "normal! :e ". system('head -n 1 /tmp2/err.ghcid | cut -d":" -f1 | tr -d "\n"') . "<CR>"
  execute "normal! ". system('head -n 1 /tmp2/err.ghcid | cut -d":" -f2 | tr -d "\n"') . "gg<CR>"

  execute "normal! :echo ". system('head -n 1 /tmp2/err.ghcid | cut -d":" -f1 | tr -d "\n"')
  " execute ("normal! :echo ". system('echo hello'))
endfun

command! NavigateToGhcidError call NavigateToGhcidError()
map <leader>ge :NavigateToGhcidError<cr>

command! -bang -nargs=? Fzfabc
  \ call fzf#vim#grep(
  \   'cat /home/chris/.config/projectilecli/dirs.txt', 1,
  \  <bang>0)

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:neoformat_enabled_haskell = ['brittany']

" https://vi.stackexchange.com/questions/26035/fzf-vim-how-to-configure-the-maximum-amount-of-files-stored-in-recent-files-hist
:set viminfo=!,'10000,<50,s10,h,:10000


" let g:airline#extensions#tabline#enabled = 1


" guard for distributions lacking the persistent_undo feature.
if has('persistent_undo')
    " define a path to store persistent_undo files.
    let target_path = expand('~/.config/nvim/vim-persisted-undo/')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif

    " point Vim to the defined undo directory.
    let &undodir = target_path

    " finally, enable undo persistence.
    set undofile
  endif

autocmd TermOpen * startinsert

lua require('myConfig')

"vim-illuminate
augroup illuminate_augroup
    autocmd!
    ""autocmd VimEnter * hi illuminatedWord guibg=#ffffff cterm=underline gui=underline
    autocmd VimEnter * hi illuminatedWord guibg=#555555 cterm=underline gui=underline
    
augroup END
