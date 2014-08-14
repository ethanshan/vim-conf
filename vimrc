""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author    : Ethan Shan
" Date      : 2012-08-13
" Version   : 0.1.0
" History   : 2012-08-13    Create
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get my os type
function! MySys()
  if has("win32")
    return "win32"
  elseif has("unix")
    return "unix"
  else
    return "mac"
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode...
set nocompatible

" Set shell to bash
if MySys() == "unix" || MySys() == "mac"
  set shell=bash
else
  set shell=E:cygwinsh
endif

" Sets how many lines of history VIM har to remember
set history=5120

" Show line number
set nu

" Sets mouse active
if has('mouse')
    set mouse=a
endif

" Always show current position
set ruler

" No backup
set nobackup

" Always show statusline
set laststatus=2

" Always show cursor line
set cursorline

" Set command line two lines high
set ch=2

" Command line auto complete
set wildmenu
set completeopt=longest,menu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color and Font
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme desert
" colorscheme murphy
" colorscheme torte
colorscheme darkblue


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set default filetype
set ffs=unix,dos,mac

" File encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
" set termencoding=

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4

" Sets Text, Tab and indent
" set expandtab
set shiftwidth=8
set tabstop=8
set smarttab
set ai
set si
set cindent

" Set syntax on
syntax enable
syntax on

" When editing a file, always jump to the last known cursor position.     
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).                                 
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.                                           
autocmd BufReadPost *                                                     
  \ if line("'\"") > 1 && line("'\"") <= line("$") |                      
  \   exe "normal! g`\"" |                                                
  \ endif                                                                 

" Ignore case when searching
set ignorecase

" Highlight search things
set hlsearch
  
" Make search act like search in modern browers
set incsearch

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful Map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show calendar
map ca :Calendar<cr>

" Fast saving
map ss :w<cr>

" Fast quit
map qq :q<cr>
map qa :qa<cr>

" current line comment
map ,c cc<ESC>I/* */<ESC>^la

" set mouse mode, use to copy and paste
map mv :set mouse=v<cr>
map ma :set mouse=a<cr>

" not exit, use shell
nnoremap <silent> <F5> :shell<CR> 

" Use Space to fold code
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mini buffer explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplUseSingleClick = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TlistToggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Open=0
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
let Tlist_Exits_OnlyWindow=1
" let Tlist_WinWidth=30


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Grep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :Grep<CR> 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => BufExplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1
let g:bufExplorerSortBy='mru'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => winmanager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :WMToggle<CR>
map <c-w><c-t> :WMToggle<cr> 
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
let g:winManagerWindowLayout="TagList|BufExplorer"
let g:persistentBehaviour=0
let g:winManagerWidth=50
let g:defaultExplorer=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tags=tags;
" Mars_42_A31
set tags=/home/shanxiaoxi/code/mars42/android4.2/frameworks/tags,/home/shanxiaoxi/code/mars42/android4.2/device/softwinner/fiber-common/prebuild/packages/TvdSettings/tags;
set tags+=/home/shanxiaoxi/code/sugar42/lichee/out/android/common/buildroot/external-toolchain/arm-linux-gnueabi/libc/usr/include/tags;
set autochdir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4> :NERDTree<CR>
let NERDTreeIgnore=['.*\.o$','.*\.ko$']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OmniCppComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conque !!have error together with taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ConqueTerm_CWInsert = 1
" let g:ConqueTerm_InsertOnEnter = 1

"+------------------------------------------------------------------------------+
"| => DrawIt                                                                            
"|    \di: start  \ds: stop 
"+------------------------------------------------------------------------------+
