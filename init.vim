"Configuration Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

let g:mapleader = "\<Space>"
autocmd!
syntax enable
syntax sync fromstart

"set nocompatible

let g:vim_tags_auto_generate = 0 " Disable tag generation on file save
set encoding=utf-8 nobomb        " Default encoding to UTF8
set synmaxcol=1200               " Syntax coloring lines that are too long just slows down the world
set nojoinspaces                 " Use only 1 space after "." when joining lines instead of 2
set nostartofline                " Don't reset cursor to start of line when moving around

set hlsearch                    " highlight the search
set ls=2                        " show a status line even if there's only one window

set wildmenu                    " show completion on the mode-line
set linespace=0                 " number of pixels between the lines
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
set wrap                        " wrap long lines
set linebreak                   " break lines at word end
set nobackup                    " don't want no backup files
set nowritebackup               " don't make a backup before overwriting a file
set noswapfile                  " no swap files
set hidden                      " hide buffers when abandoned

" Improve vim's scrolling speed
" It does not apply in neovim
" set ttyfast
" set ttyscroll=3
set lazyredraw

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" Auto-reload buffers when files are changed on disk
set autoread

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set foldnestmax=10

" Open all folds by default
set nofoldenable

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

set vb                          " disable alert sound
set showcmd                     " display incomplete commands
set showmatch                   " Show matching brackets.
set history=100                 " a ton of history

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set smarttab                    " sw at the start of the line, sts everywhere else
set scrolloff=0                 " keep a 5 line padding when moving the cursor
set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth
set switchbuf=""                " do not move focus/cursor to where the buffer is already open
set tagbsearch                  " use binary searching for tags
set shortmess=atI               " The 'Press ENTER or type command to continue' prompt is jarring and usually unnecessary.
"set t_Co=256                    " Use 256 colors for color theme

" Some files to ignore
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/resources/*
set wildignore+=node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store
set wildignore+=*.aux,tags,.*

"Some other adjustments
if exists("&breakindent")
  set breakindent showbreak=+++
elseif has("gui_running")
  set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ +++
endif


" Setting theme and gui font
if exists("&guifont")
  if has("mac")
    set guifont=Anonymous\ Pro\ for\ Powerline:h14,Inconsolata\ for\ Powerline:h14,Monaco:h14
  elseif has("unix")
    if &guifont == ""
      set guifont=bitstream\ vera\ sans\ mono\ 10
    endif
  elseif has("win32")
    set guifont=Consolas:h11,Courier\ New:h10
  endif
endif



if exists("+spelllang")
  set spelllang=es
endif

function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction


" MAPPINGS
" Disable arrows in the keyboard
map <Up>   <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l

"Exit from insert mode
inoremap jk <esc>

" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gA :OpenURL http://www.answers.com/<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

" remove search highlighting
nnoremap <leader>h :noh<cr>

" Expand %% to current directory http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%')<cr>
"
"Save files using sudo privileges
cnoremap w!! %!sudo tee > /dev/null %

nnoremap <silent> <Leader>tt :call TrimWhiteSpace()<CR>
"
"Setting the colorscheme
set background=dark
colorscheme PaperColor
"colorscheme 256_noir
 
"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"PLUGGIN CONFIGURATION
let g:netrw_list_hide = '.*\.swp$,^\.,^tags$'
let g:netrw_liststyle=1
let g:netrw_banner=0

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"" SISNE
nnoremap <leader>s2 :cd ~/Development/sisne<CR>:e.<CR>:pwd<CR>
nnoremap <leader>sa :cd ~/Development/sapec<CR>:e.<CR>:pwd<CR>

"" NEURONAS
nnoremap <leader>ne :cd ~/Development/neuronas<CR>:e.<CR>:pwd<CR>

""For spell checking
nmap <silent> <leader>ss :set spell! spelllang=es<CR>
nmap <silent> <leader>se :set spell! spelllang=en_us<CR>

""For change cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"
