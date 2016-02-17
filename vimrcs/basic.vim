"
"Maintener
"    Rodrigo Zani <rodrigo.zhs@gmail.com>
"
"Version
"    0.1
"
"Sections
"    -> General
"    -> User Interface
"    -> Search Settings
"    -> Color and fonts
"    -> Text and indent
"    -> Split Management
"    -> Auto Commands

" ------------------------------------------------------------
"  => General
" ------------------------------------------------------------

" Sets how many lines of history Vim has to remember
set history=500

" The default leader is '\', but comma is much better
let mapleader=","
let g:mapleader=","

" Make it easy save files
nmap <Leader>w :w!<cr>

" Make it easy close files
nmap <Leader>q :q<cr>

" Make it easy redo changes
nmap <C-y> :redo<cr>

" :W sudo saves the file 
" " (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Make it easy to edit the .vii/vimrcs/basic.vim
nmap <Leader>eb :tabedit ~/.vii/vimrcs/basic.vim<cr>

" Make it easy to edit plugins file
nmap <Leader>ep :tabedit ~/.vii/vimrcs/plugins.vim<cr>

" Make it easy to edit Hosts file
nmap <Leader>eh :tabedit /etc/hosts<cr>



" ------------------------------------------------------------
"  => User Interface
" ------------------------------------------------------------

" Show line number, switch between 'number' and 'nonumber'
set nonumber

" Set to auto read when a file is changed from the outside
set autoread

" Turn on wildmenu - more comfortable command line completion
set wildmenu
set wildmode=longest:full,full

" Make backspace behave like every other editor
set backspace=indent,eol,start

" Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Remove space when window split
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R



" ------------------------------------------------------------
"  => Search Settings
" ------------------------------------------------------------

" Ignore case sensitive
set ignorecase

" Try to be smart about case
set smartcase

" Highlight search results
set hlsearch

" Increment highlight when search
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Make easy to search
" nmap <space> /
" nmap <C-space> ?

" Disabled highlight
nmap <Leader><space> :nohlsearch<cr> 


" ------------------------------------------------------------
"  => Color and fonts
" ------------------------------------------------------------

set t_CO=256

" Sets the background color
set background=dark

" Try to select colorscheme
try
    let g:sierra_Twilight = 1
    colorscheme sierra
catch
endtry

" Enable syntax highlight
syntax enable

" Line column style
hi LineNr ctermfg=grey ctermbg=bg guifg=grey guibg=bg

" Padding left
set foldcolumn=1
hi foldcolumn guibg=bg ctermbg=bg

" Slit separator color
hi vertsplit guifg=grey guibg=bg ctermfg=grey ctermbg=bg
hi StatusLineNC guifg=black guibg=grey ctermfg=black ctermbg=grey


" ------------------------------------------------------------
"  => Text and inden
" ------------------------------------------------------------

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent
set ai 

"Smart indent
set si

"Wrap lines
set wrap


" ------------------------------------------------------------
"  => Split Management
" ------------------------------------------------------------

" Open file below when vsp
set splitbelow

" Open file right when sp
set splitright

" Vertical split map
nmap <Leader>v :vsp<cr>

"Horizontal split map
nmap <Leader>h :sp<cr>

" Lazy way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <Leader>bd :bd<cr>gT

" Close all the buffers
map <Leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <Leader>tn :tabnew<cr>
map <Leader>to :tabonly<cr>
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove 

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry


" ------------------------------------------------------------
"  => Auto Commands
" ------------------------------------------------------------

" Automatically source the Vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost basic.vim source ~/.vimrc
augroup END

