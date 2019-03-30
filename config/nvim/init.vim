" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" encoding is utf-8
set encoding=utf-8
set fileencoding=utf-8

" ..............................................................................
" Plugins!
" let Vundle manage Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Shougo/deoplete.nvim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/goyo.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround' " ys, cs, ds + text object + symbol
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'zchee/deoplete-jedi'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'christoomey/vim-system-copy'  " cpi'/cpiw/cv

call vundle#end()
" ..............................................................................

filetype plugin indent on

" theme
"colorscheme BlackSea
colorscheme CandyPaper
" .............................................................................
" Code Foldin

" Enable folding
set foldmethod=indent
set foldlevel=99

 " Enable folding with the spacebar (leader is space, gives problem, argh)
 "nnoremap <space> za

" enable this to see docstring
let g:SimpylFold_docstring_preview=1
" .............................................................................
" Space is easier to hit :}
let mapleader = " "
set ai
set backspace=indent,eol,start
set et
set hlsearch
set ic
set incsearch
set is
set nobackup
set nowritebackup
set nu
set path+=**
set ruler
set si
set sm
set sta
set sw=4
set ts=4
set wildmenu
syn on
" .............................................................................
" Handle white spaces
" Highlight White spaces with Red
highlight WhitespaceEOL ctermbg=red guibg=red

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

match WhitespaceEOL /\s\+$/
" ..............................................................................
"
" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>
"
" .............................................................................


let g:deoplete#enable_at_startup = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#enable_smart_case = 1
" .............................................................................


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
highlight ColorColumn ctermbg=8
set autochdir       " change buffer dir as per file location
set autowrite		" Automatically save before commands like :next and :make
set colorcolumn=80  " Set the color column to 80 characters
set expandtab       " Convert tab to spaces
set hidden          " Hide buffers when they are abandoned
set hlsearch        " Highlight Search
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
set laststatus=2    " Always show status line
set linebreak       " Only break line when I press Enter
set makeprg=g++\ %  " Configuration for :make in vim
set mouse=a		    " Enable mouse usage (all modes)
set nolist          " List disables line break
set noswapfile      " prevent vim from creating swp file
set pastetoggle=<F4>    " Toggle paste
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smartcase		" Do smart case matching
set smarttab        " Makes tabs insert "indents" at the beginning of the line
set t_Co=256        " Use 256 colours (Use this setting only if your terminal supports 256 colours)
set tw=79           " Automatic word wrapping at 79
set wrap            " Set wrapping of words



" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

set listchars=eol:•,tab:→\ ,trail:␣,extends:↷,precedes:↶,nbsp:⁔
set list
" .............................................................................

" have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" have Vim load indentation rules and plugins
" according to the detected file type.
if has("autocmd")
  filetype plugin indent on
endif
" .............................................................................

" file-based configuration of tab space, shift width
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype yml setlocal ts=2 sw=2 expandtab
au BufNewFile,BufRead *.py set fileformat=unix
" .............................................................................

" some commands from vim
command! -nargs=* -complete=file Gcheckout :!git checkout %
command! -nargs=* -complete=file GDiff :!git diff %
" command! -nargs=* -complete=file Ar :!sudo /etc/init.d/apache2 restart
command! -nargs=* -complete=file Rs :!export SRCPATH=%:p:h && export DESTPATH=${SRCPATH/static_media/static} && stylus % && mv %:r.css $DESTPATH
command! -nargs=* -complete=file Cp :!export SRCPATH=%:p:h && export DESTPATH=${SRCPATH/static_media/static} && cp % $DESTPATH


" Useful for sorting includes, imports, namespaces and other declaration groups.
" With this enabled, you can just insert your statement anywhere and just press ,s
nmap <leader>s {jv}k:sort<CR>
nmap <leader>o :set paste!<CR>         " Toggles paste mode
nmap <leader>l :setlocal number!<CR>   " Toggles line numbers
nmap <leader>q :nohlsearch<CR>         " Clear highlight search
nmap <leader>h :nohl<CR>         " Clear highlight search
hi Search cterm=NONE ctermfg=black ctermbg=blue "search color
nmap <leader>e :NERDTreeToggle<CR>     " Toggle NerdTree
vmap <leader>cc :s/^/#/<cr>
vmap <leader>cr :s/^#//<cr>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

au FileType make set noet

" Copy to clipboards * and +
vmap "+y :!xclip -f -selection clip
map "+p :r!xclip -o -sel clip

" Readmes autowrap text:
autocmd BufRead,BufNewFile *.md,*.tex set tw=79

" Get line, word and character counts with F3:
map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
map <F4> :setlocal spell! spelllang=en_us<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" Shortcutting split navigation, saving a key press:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" C-T for new tab
 nnoremap <C-t> :tabnew<cr>

" Plugins Installations and Configurations

" Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0
let g:airline_powerline_fonts = 1

" Ctrl-P Buffers
set runtimepath^=~/.vim/bundle/ctrlp.vim
nmap ; :CtrlPBuffer<CR>
nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-b> :bprev<CR>

" Vim Powerline configurations
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Markdown made easy
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
" line break
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
" bold
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
" strike through
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
" emphasis/italic
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
" title header
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
" image link
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
" url link
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
" header 1
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><Esc>kA
" header 2
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><Esc>kA
" header 3
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><Esc>kA
" line
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype markdown,rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype markdown,rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype markdown,rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

autocmd Filetype python,py inoremap ,d <Esc>o<Esc>i'''<Enter><Enter>'''<Esc>k
" Allow saving of files when I forget to start vim with sudo.
cmap w!! w !sudo tee > /dev/null %
