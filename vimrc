" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
execute pathogen#infect()

set nocompatible        " use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set ruler               " show the current row and column

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
"set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should
"set runtimepath=$VIMRUNTIME     " turn off user scripts, https://github.com/igrigorik/vimgolf/issues/129

set mouse=a
set spell		
let g:lexical#spelllang = ['en_us']
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype plugin indent on      " load indent file for specific file type

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set encoding=utf-8
let g:airline_theme='violet'
let g:airline#extenstions#tabline#enabled = 1
let g:tex_flavor = 'latex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

  nnoremap <esc>^[ <esc>^[
"  let g:citation_vim_mode='zotero'
"  let g:citation_vim_zotero_path='/mnt/c/Users/avera/Zotero/'
"  let g:citation_vim_zotero_version=5
"  let g:citation_vim_collection" = 'your_zotero_collection'
"let g:citation_vim_cache_path='~/.vim/cache'
"let g:citation_vim_outer_prefix="["
"let g:citation_vim_inner_prefix="@"
"let g:citation_vim_suffix="]"
"let g:citation_vim_et_al_limit=2
"let g:citation_vim_reverse_order=0
" This code should go in your vimrc or init.vim
let g:UltiSnipsExpandTrigger       = '<c-s>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']          " using Vim
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
			    \ | call litecorrect#init()
  			    \ | call lexical#init()
  autocmd FileType tex    call pencil#init()
			    \ | call litecorrect#init()
  			    \ | call lexical#init()
  autocmd FileType text         call pencil#init()
			    \ | call litecorrect#init()
  			    \ | call lexical#init()
augroup END
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
setlocal fo+=aw
nnoremap <leader>x ZZ
