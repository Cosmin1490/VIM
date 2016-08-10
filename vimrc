
let g:ycm_global_ycm_extra_conf = '~/VIM/ycm_extra_conf.py'
let g:neobundle#install_process_timeout = 2500

set nocp
" ----------- NeoBundle Configuration ----------------------------------

   filetype off                  " required!

   set rtp+=~/VIM/bundle/neobundle.vim/
   call neobundle#begin(expand('~/VIM/bundle/'))
   NeoBundleFetch 'Shougo/neobundle.vim'

   NeoBundle 'scrooloose/syntastic'

   NeoBundle 'ervandew/supertab'
   NeoBundle 'SirVer/ultisnips'
   NeoBundle 'honza/vim-snippets'
   NeoBundle 'Valloric/listtoggle'
   NeoBundle 'Valloric/YouCompleteMe' , {
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --tern-completer',
        \ 'unix'    : './install.sh --clang-completer --tern-completer',
        \ 'windows' : './install.sh --clang-completer --tern-completer',
        \ 'cygwin'  : './install.sh --clang-completer --tern-completer'
        \ }
     \ }

   NeoBundle 'altercation/vim-colors-solarized'
   NeoBundle 'scrooloose/nerdtree'
   NeoBundle 'jistr/vim-nerdtree-tabs'
   NeoBundle 'Xuyuanp/nerdtree-git-plugin'
   NeoBundle 'majutsushi/tagbar'
   NeoBundle 'tpope/vim-commentary'

   NeoBundle 'Quramy/vison'
   NeoBundle 'Quramy/tsuquyomi'

   NeoBundle 'gregsexton/MatchTag'
   NeoBundle 'bronson/vim-trailing-whitespace'

   NeoBundle 'matchit.zip'

   NeoBundle 'wesQ3/vim-windowswap'
   NeoBundle 'zhaocai/GoldenView.Vim'
   NeoBundle 'bling/vim-airline'
   NeoBundle 'vim-airline/vim-airline-themes'

   NeoBundle 'airblade/vim-gitgutter'
   NeoBundle 'tpope/vim-fugitive.git'

   NeoBundle 'godlygeek/tabular.git'

   NeoBundle 'ctrlpvim/ctrlp.vim'
   NeoBundle 'FelikZ/ctrlp-py-matcher'

   NeoBundle 'derekwyatt/vim-scala'
   NeoBundle 'mustache/vim-mustache-handlebars'
   NeoBundle 'tfnico/vim-gradle'
   NeoBundle 'kchmck/vim-coffee-script'
   NeoBundle 'groenewege/vim-less'
   " NeoBundle 'skammer/vim-css-color'
   NeoBundle 'hail2u/vim-css3-syntax'
   NeoBundle 'leafgarland/typescript-vim'

   NeoBundle 'Shougo/unite.vim'
   NeoBundle 'Shougo/vimproc.vim', {
   \ 'build' : {
   \     'windows' : 'tools\\update-dll-mingw',
   \     'cygwin' : 'make -f make_cygwin.mak',
   \     'mac' : 'make',
   \     'linux' : 'make',
   \     'unix' : 'gmake',
   \    },
   \ }

   NeoBundle 'Cosmin1490/cbalanUltiSnips'

   call neobundle#end()          " required!

" ----------- Main Configuration ----------------------------------

set nocompatible                         "don't need to keep compatibility with Vi
filetype plugin indent on                "enable detection, plugins and indenting in one step
syntax on                                "Turn on syntax highlighting
set ruler                                "Turn on the ruler
set number                               "Show line numbers

set background=dark                      "make vim use colors that look good on a dark background

set showcmd                              "show incomplete cmds down the bottom
set showmode                             "show current mode down the bottom
set foldenable                           "enable folding
set showmatch                            "set show matching parenthesis
set noexrc                               "don't use the local config

set incsearch                            "find the next match as we type the search
set hlsearch                             "hilight searches by default
set ignorecase                           "ignore case when searching
set smartcase                            "smart case when searching

set shiftwidth=2                         "number of spaces to use in each autoindent step
set tabstop=2                            "two tab spaces
set softtabstop=2                        "number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                            "spaces instead of tabs for better cross-editor compatibility
set smarttab                             "use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set shiftround                           "when at 3 spaces, and I hit > ... go to 4, not 5
set nowrap                               "no wrapping

set backspace=indent,eol,start           "allow backspacing over everything in insert mode
set cindent                              "recommended seting for automatic C-style indentation
set autoindent                           "automatic indentation in non-C files
set copyindent                           "copy the previous indentation on autoindenting

set noerrorbells                         "don't make noise
set wildmenu                             "make tab completion act more like bash
set wildmode=list:longest                "tab complete to longest common string, like bash
set wildignorecase                       "tab complete is now case insensitive

set hidden                               "allow hiding buffers with unsaved changes
set cmdheight=2                          "make the command line a little taller to hide 'press enter to viem more' text

set clipboard=unnamed                    "Use system clipboard by default
set novisualbell
set laststatus=2

set history=1000                         " remember more commands and search history
set undolevels=1000                      " use many muchos levels of undo
set title                                " change the terminal's title

set nobackup
set noswapfile

set tags=tags;/

if filereadable("cbalan_vim_first_time")
  finish
endif

" ----------- Colors Configuration ----------------------------------

colorscheme solarized

" ----------- GoldenView Configuration ----------------------------------

let g:goldenview__enable_at_startup = 0
let g:goldenview__enable_default_mapping = 0

nmap <silent> <C-J>  <Plug>GoldenViewNext
nmap <silent> <C-K>  <Plug>GoldenViewPrevious

nmap <silent> <C-L>  <Plug>GoldenViewSplit
nmap <silent> <C-H>  <Plug>GoldenViewSwitchMain
nmap <silent> <F6>   <Plug>GoldenViewSwitchToggle

nmap <silent> <Leader>gv :ToggleGoldenViewAutoResize<CR>


" ----------- NERDTree Configuration ----------------------------------

nnoremap <leader>f :NERDTreeTabsFind<CR>
map <F8> :NERDTreeTabsToggle<CR>

let g:NERDTreeMapJumpNextSibling='<C-N>'
let g:NERDTreeMapJumpPrevSibling='<C-P>'
let g:NERDTreeChDirMode = 2
let g:NERDTreeHighlightCursorLine = 1

" ----------- TagBar Configuration ----------------------------------

nmap <F9> :TagbarToggle<CR>
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
    \ }
let g:tagbar_type_tf = {
    \ 'ctagstype' : 'tf',
    \ 'kinds'     : [
        \ 'c:class',
        \ 'm:member'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'c' : 'class'
    \ },
    \ 'scope2kind' : {
        \ 'class' : 'c'
    \ },
    \ 'ctagsbin'  : 'tftags.py',
    \ 'ctagsargs' : 't'
\ }
" ----------- DelimitMate Configuration ----------------------------------

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" ----------- KeyMapping Configuration ----------------------------------

nnoremap <UP> ""
nnoremap <Down> ""
nnoremap <Left> ""
nnoremap <Right> ""

nmap <C-t> :tabnew<CR>
nmap <F2> :tabprevious<CR>
nmap <F3> :tabnext<CR>

" ----------- Syntastic Configuration ----------------------------------
"
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>

let g:syntastic_mode_map = {'mode' : 'passive',
        \ 'active_filetypes': ['scala'],
        \ 'passive-filetypes': []}

let g:syntastic_html_tidy_exec = "/usr/local/Cellar/tidy-html5/5.1.25/bin/tidy"

if !exists('g:syntastic_html_tidy_ignore_errors')
  let g:syntastic_html_tidy_ignore_errors = []
endif

let g:syntastic_html_tidy_ignore_errors += [
  \   '> proprietary attribute "',
  \   'trimming empty <'
  \ ]

if !exists('g:syntastic_html_tidy_blocklevel_tags')
  let g:syntastic_html_tidy_blocklevel_tags = []
endif

let g:syntastic_html_tidy_blocklevel_tags += [
  \ 'ng-include',
  \ 'ng-form'
  \ ]

let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_typescript_tslint_exec="./node_modules/tslint/bin/tslint"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_check_on_wq = 0

" ----------- Cscope Configuration ----------------------------------

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif



" ----------- Startup Configuration ----------------------------------

autocmd FileType qf wincmd J

function OnStartup()
  execute 'TagbarOpen'
  execute 'NERDTreeTabsOpen'
  call feedkeys("\<C-W>")
  call feedkeys("\<C-W>")
endfunction

function OnShutdown()
  execute 'TagbarClose'
  execute 'NERDTreeTabsClose'
endfunction

command! OnStartup call OnStartup()
command! OnShutdown call OnShutdown()
nmap <F4> :OnStartup<CR>
nmap <F5> :OnShutdown<CR>

autocmd vimenter * if !argc() | execute 'OnStartup' | endif

" ----------- Makefile ------------------------------------------------------

nnoremap <Leader>mr :make run<CR>
nnoremap <Leader>mc :make clean<CR>

" ----------- ListToggle Configuration ----------------------------------

nnoremap <Leader>z :pclose<CR>:cclose<CR>
let g:lt_location_list_toggle_map = '<leader>x'
let g:lt_quickfix_list_toggle_map = '<leader>c'

" ----------- Ultisnips + YCM Configuration ----------------------------------

nnoremap <Leader>y :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>pc :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>pt :YcmCompleter GetType<CR>
nnoremap <Leader>pr :YcmCompleter GoToReferences<CR>

let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.']
            \ }

let g:ycm_confirm_extra_conf = 0

let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0

let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_show_diagnostics_ui = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----------- Window Navigation And StatusLine Configuration ---------------------------------

let g:airline#extensions#tabline#enabled = 1

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
function! WindowNumber()
  let str=tabpagewinnr(tabpagenr())
  return str
endfunction

" ----------- CTRLP Configuration -------------------------------------------

let g:ctrlp_max_files=0
let g:ctrlp_match_window = 'results:100'
let g:ctrlp_match_fund = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .vagrant
      \ --ignore .gradle
      \ --ignore .idea
      \ --ignore .ecbuild
      \ --ignore ecbuild
      \ --ignore build
      \ --ignore bower_components
      \ --ignore node_modules
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/build/*,*/.ecbuild/*,*/ecbuild/*

" ----------- Quickfix Window Configuration ---------------------------------

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
