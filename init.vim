" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

inoremap jj <esc>
set nu
set sm
set ai
set hlsearch
syntax on
set ic
set tabstop=4
set softtabstop=2
set shiftwidth=2
set autoindent
set modifiable
" 控制行
set linebreak
set textwidth=80
set wrap
" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

set showmatch

set cursorline
"set cuc
set listchars "html代码补全
"
"""""""""""""" 将空格键当作快捷键 """"""""""""""""""
let mapleader=" "
map <leader>wq :wq<CR>
map <leader>q :q<CR>
map <leader>w :w<CR>
map <leader>e :sp<CR>
map <leader>v :vsp<CR>
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>s :tabs<CR>
map <leader>o :tabo<CR>
map <leader>c :tabc<CR>
map <leader>ew :tabnew
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <leader>r :! 
map <leader>gr :GoRun<CR>
map <C-c> :set paste<CR>
map <C-x> :set nopaste<CR>

map io <C-x><C-o>

""""""""""""""""""""""目录树""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map ff :NERDTreeToggle<CR>


""""""""""""""""""""标签导航"""""""""""
"""""""""""状态栏优化

let g:airline_powerline_fonts                   = 1 " 使用 powerline 打过补丁的字体
let g:airline#extensions#tabline#enabled        = 1 " 开启 tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示 buffer 编号
let g:airline#extensions#ale#enabled            = 1 " enable ale integration

" 状态栏显示图标设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.crypt     = '?'
let g:airline_symbols.linenr    = '⭡'
let g:airline_symbols.branch    = '⭠'
" 切换 buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 关闭当前 buffer
noremap <C-p> :w<CR>:bd<CR>
" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"""""""主题
"let g:solarized_termtrans  = 1        " 使用 termnal 背
"let g:solarized_visibility = "high"   " 使用 :set list 显示特殊字符时的高亮级别
"colorscheme darkblue
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
colorscheme gruvbox	
set background=dark

"""""""markdown"""""""
map <leader>mak :MarkdownPreview<CR>
map <leader>mas :MarkdownPreviewStop<CR>
"禁用markdown的折叠
let g:vim_markdown_folding_disabled = 1


""""""彩虹括号""""""

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""缩进线""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

""""""vim-table-mode"""""
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
	  let mapping_pattern = '\V' . escape(a:mapping, '\')
	    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
		  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
		endfunction

		inoreabbrev <expr> <bar><bar>
		          \ <SID>isAtStartOfLine('\|\|') ?
				  \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
		inoreabbrev <expr> __
		          \ <SID>isAtStartOfLine('__') ?
		          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


""""""""nerdcommenter""""""""
filetype plugin on
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
"注释 <leader>cc
"取消注释 <leader>cu
"有格式的注释 <leader>cs
""""""""""vim-surround""""""""""
"更改"" 为 '' cs"'
""""""""""tagbar""""""""""
nmap <F8> :TagbarToggle<CR>
""""""""""coc.vim""""""""""
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"错误跳转
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"跳转到定义处
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
"提示所有使用处 提供跳转
nmap <silent> gr <Plug>(coc-references)
"使用K显示函数的需要的参数
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"重命名符号
nmap <leader>rn <Plug>(coc-rename)
"格式化代码块
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


"++++++++++++插件+++++++++++++++++++++"
"
call plug#begin('~/.vim/plugged')
""""""目录树
Plug 'preservim/nerdtree'
""""""状态栏优化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""""""代码对齐
Plug 'godlygeek/tabular'
"""""主题
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
""""""匹配括号
Plug 'jiangmiao/auto-pairs'
""""""vim-go""""""
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
""""""markdown""""""
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
""""""markdown-preview""""""
Plug 'iamcco/markdown-preview.vim'
""""""coc-nvim""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""""""彩虹括号""""""
Plug 'kien/rainbow_parentheses.vim'
""""""缩进线""""""
"Plug 'Yggdroot/indentLine'
""""""agit""""""
Plug 'cohama/agit.vim'
""""""vim-table-mode""""""
Plug 'dhruvasagar/vim-table-mode'
""""""vim-startify""""""
Plug 'mhinz/vim-startify'
""""""nerdcommenter""""""
Plug 'preservim/nerdcommenter'
""""""vim-surround""""""
Plug 'tpope/vim-surround'
""""""fzf""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
""""""gruvbox""""""
Plug 'morhetz/gruvbox'
""""""tagbar""""""
Plug 'preservim/tagbar'
call plug#end()
