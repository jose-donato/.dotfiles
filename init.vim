call plug#begin("~/.vim/plugged")
	" Plugin Section
	Plug 'dracula/vim'
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
	"Plug 'iamcco/coc-tailwindcss',  {'do': 'npm install --frozen-lockfile && npm run build'}
	Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
call plug#end()
"Config Section

"THEME
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme dracula

"TREE AND ICONS
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>



"INTEGRATED TERMINAL
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"SHORTCUTS
" use alt+arrow to move between split/vsplit panels
tnoremap <C-Left> <C-\><C-n><C-w>h
tnoremap <C-Down> <C-\><C-n><C-w>j
tnoremap <C-Up> <C-\><C-n><C-w>k
tnoremap <C-Right> <C-\><C-n><C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l


"FIND
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
