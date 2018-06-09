set ts=4

call plug#begin('~/.local/share/nvim/plugged')

Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'nikvdp/ejs-syntax' 

call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one


set hidden
set number
set noswapfile

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

let g:NERDTreeWinSize=20

map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set clipboard+=unnamedplus

set hidden

nnoremap <C-d> :bnext<CR>
nnoremap <C-f> :bprev<CR>

let g:AutoPairsFlyMode = 0
    let g:AutoPairsShortcutBackInsert = '<M-b>'

let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'    "enable all function in all mode.<Paste>
autocmd FileType html,css,jst EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

set expandtab
