inoremap jj <esc>
set nu
set sm
set ai
set hlsearch
syntax on
set ic
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent


 """"""""""""""" 将空格键当作快捷键 """"""""""""""""""
let mapleader=" "
map <leader>wq :wq<CR>
map <leader>q :q<CR>
map <leader>w :w<CR>
map <leader>u :sp<CR>
map <leader>r :vsp<CR>
map <leader>a <C-w>
map <leader>j :! 
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>s :tabs<CR>
map <leader>o :tabo<CR>
map <leader>c :tabc<CR>
map <leader>ew :tabnew



"############ 插件 #######################################

"************ nerdtree树 ************************
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map ff :NERDTreeToggle<CR>

"************ 状态栏 ********************
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"********** python代码补全 *********************
filetype plugin on

let g:pydiction_location = 'D:\我的应用\Neovim\share\nvim\runtime\complete-dict'

















" Vim support file to switch on loading indent files for file types
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2008 Feb 22

if exists("did_indent_on")
  finish
endif
let did_indent_on = 1

augroup filetypeindent
  au FileType * call s:LoadIndent()
  func! s:LoadIndent()
    if exists("b:undo_indent")
      exe b:undo_indent
      unlet! b:undo_indent b:did_indent
    endif
    let s = expand("<amatch>")
    if s != ""
      if exists("b:did_indent")
	unlet b:did_indent
      endif

      " When there is a dot it is used to separate filetype names.  Thus for
      " "aaa.bbb" load "indent/aaa.vim" and then "indent/bbb.vim".
      for name in split(s, '\.')
	exe 'runtime! indent/' . name . '.vim'
      endfor
    endif
  endfunc
augroup END
