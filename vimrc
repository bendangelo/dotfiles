set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set suffixesadd+=.rb
"set mouse=a
" Auto indent
filetype indent on
filetype plugin indent on
set list listchars=tab:»·,trail:·
set autowrite

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
let g:solarized_termcolors=256
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,.git,*.meta

set pastetoggle=<F10>
set number
set noswapfile
set autoindent
set hlsearch
set ignorecase
set smartcase
set nobackup
set laststatus=2
set ttimeoutlen=50
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
set smarttab
set expandtab
set shiftwidth=2
set complete=.,b,u,]

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufReadPost *.cpp,*.h,*.lua,*.cs set shiftwidth=4|set softtabstop=4
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.cginc,*.shader setfiletype hlsl

  " automatic formatting
  autocmd BufWritePre *.slim,*.rb :%s/\s\+$//e
  autocmd FileType make setlocal noexpandtab

augroup END

" gvim
if has('gui_running')
    set go-=T
    set guifont=Liberation\ Mono\ 8
    set go-=r
    set go-=L
endif

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'beyondmarc/hlsl.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'tpope/vim-rails'
Plugin 'wellle/targets.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'henrik/vim-qargs'
Plugin 'tpope/vim-sensible'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'L9'
Plugin 'justinmk/vim-sneak'
Plugin 'tyru/open-browser.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-operator-user'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'mileszs/ack.vim.git'
Plugin 'vim-scripts/a.vim'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'benmills/vimux'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'danielbmarques/vim-ditto'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
call vundle#end()

let g:ctrlp_custom_ignore = {
            \ 'dir': 'bower_components\|build\|dist\|docs\|export\|node_modules\|DS_Store\|git\|Temp\|Builds',
            \ 'file': '\.meta$'
            \ }
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_depth = 5

" RSpec.vim mappings
map zc :call RunCurrentSpecFile()<CR>
map zn :call RunNearestSpec()<CR>
map zj :call RunLastSpec()<CR>
map za :call RunAllSpecs()<CR>

let g:rspec_command = 'call VimuxRunCommand("rspec {spec}\n")'

function! VimuxSlime()
  call VimuxSendText(@v)
 endfunction

 " If text is selected, save it in the v buffer and send that buffer it to tmux
 vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

 " Select current paragraph and send it to tmux
"  nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

" Leader shortcuts
" most recently used files
nnoremap zr :CtrlPMRUFiles<CR>

map <F5> :CtrlPClearAllCaches<CR>
nmap <Space> :CtrlP<CR>

nnoremap <leader>aa :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>at :AT<CR>

nnoremap <leader><leader> <C-^>

noremap g/ :Ack <cword><cr>

nmap c_ ct_
nmap c- ct-
nmap c) ct)
nmap c] ct]
nmap c} ct}
nmap c. ct.
nmap c" ct"
nmap c' ct'
nmap c, ct,
nmap c/ ct/
nmap c; ct;
nmap c: ct:
nmap c< ct<
nmap c> ct>

nmap d_ dt_
nmap d- dt-
nmap d) dt)
nmap d] dt]
nmap d} dt}
nmap d. dt.
nmap d" dt"
nmap d' dt'
nmap d, dt,
nmap d/ dt/
nmap d; dt;
nmap d: dt:
nmap d< dt<
nmap d> dt>

vmap gy "+y
nmap gp "+p
nmap gP "+P
nmap gy "+y
vmap gp "+p
vmap gP "+P
nmap zp "0p
nmap zP "0P

map <leader>s :so $MYVIMRC<CR>
map <leader>ev :vs $MYVIMRC<CR>
map <leader>ez :vs ~/.zshrc<CR>
map <leader>eb :vs ~/dotfiles/bash/bash_aliases<CR>
map <leader>eg :vs ~/.gitconfig<CR>
map <leader>es :vs ~/.ssh/config<CR>
map <leader>ea :vs ~/.agignore<CR>
map <leader>eh :vs /etc/hosts<CR>
map <leader>et :vs ~/.tmux.conf<CR>
map <leader>ei :vs .gitignore<CR>

map <leader>ed :vs config/database.yml<CR>
map <leader>er :vs config/routes.rb<CR>
map <leader>eG :vs Gemfile<CR>
map <leader>ep :vs package.json<CR>

" fugitive shortcuts
map gb :Gblame<CR>

" format the entire file
nmap <leader>fe ggVG=
map <Leader>fa ggVG

" Change color
nnoremap <leader>cg :color gruvbox<CR>
nnoremap <leader>ch :color hybrid<CR>
nnoremap <leader>cr :color railscasts<CR>
nnoremap <leader>cd :color desertEx<CR>
nnoremap <leader>cw :color badwolf<CR>
nnoremap <leader>cm :color babymate256<CR>

" Open links
map <leader>od :OpenBrowser https://github.com/DarkstarProject/darkstar<CR>

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Shortcuts
nmap gR :NERDTreeFind<CR>
nmap gr :NERDTreeToggle<CR>
nmap <silent> z/ :nohlsearch<CR>

" force save
cmap w!! w !sudo tee % >/dev/null

imap jk <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap <Tab> <c-w><c-w>
noremap <S-Tab> <c-w>W
nmap Y y$
nmap zh ^
nmap zl $
vmap zh ^
vmap zl $
map Q @@

nnoremap K :!open dict:///<cword><cr>

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" strip all trailing whitespace in the current file
nnoremap <leader>fw :%s/\s\+$//<cr>:let @/=''<CR>
" reselect the text that was just pasted
nnoremap gV `[v`]
nnoremap =p `[v`]=

if executable("ag")
    let g:ackprg = 'ag --nogroup --nocolor --column'

    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor\ -U

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U --hidden'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 1
endif

colorscheme default
set background=dark

au BufReadPost *.hxp set syntax=haxe
au BufReadPost *.hx set syntax=haxe
au BufReadPost *.md set syntax=markdown
au BufReadPost *.less set syntax=less
au BufReadPost *.coffee set syntax=coffee
au BufReadPost *.slim set syntax=slim
" reload file on vim focus and buf enter
au CursorHold * checktime

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" scss linter not working atm
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ['c#'] }
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

let g:vim_markdown_folding_disabled=1

let g:online_thesaurus_map_keys = 0
" Lookup current word
nnoremap gl :OnlineThesaurusCurrentWord<CR>
let NERDTreeIgnore = ['\.meta$']


" Ditto
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

nmap <leader>di <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

nmap <silent> <leader>d <Plug>DashSearch

map <leader> *<C-O>:%s///gn<CR>
set clipboard=unnamed

" omnisharp
let g:OmniSharp_selector_ui = 'ctrlp'
set noshowmatch
set completeopt=longest,menuone

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    " autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " automatic syntax check on events (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    "show type information automatically when the cursor stops moving
    " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    " autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>

augroup END
