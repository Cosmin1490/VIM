

source $ADMIN_SCRIPTS/master.vimrc

let g:ycm_global_ycm_extra_conf = '~/VIM/ycm_extra_conf.py'

set nocp
" ----------- Vundle Configuration ----------------------------------
                                              
   filetype off                  " required!
   
   set rtp+=~/VIM/bundle/Vundle.vim/
   call vundle#begin("~/VIM/bundle")
   
   Plugin 'gmarik/Vundle.vim'
   Plugin 'scrooloose/nerdtree'   
   Plugin 'majutsushi/tagbar'
   Plugin 'scrooloose/syntastic'
   Plugin 'Valloric/YouCompleteMe'
   Plugin 'SirVer/ultisnips'
   Plugin 'altercation/vim-colors-solarized'
   Plugin 'jistr/vim-nerdtree-tabs'
   Plugin 'kien/ctrlp.vim'

   call vundle#end()             " required!
   filetype plugin indent on     " required!

   "
   "  Brief help
   " :BundleList          - list configured bundles
   " :BundleInstall(!)    - install (update) bundles
   " :BundleSearch(!) foo - search (or refresh cache first) for foo
   " :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
   "
   " see :h vundle for more details or wiki for FAQ
   " NOTE: comments after Bundle commands are not allowed.

" ----------- Main Configuration ----------------------------------


set nocompatible                         "don't need to keep compatibility with Vi
filetype plugin indent on                "enable detection, plugins and indenting in one step
syntax on                                "Turn on syntax highlighting
set ruler                                "Turn on the ruler
set number                               "Show line numbers
"set cursorline                           "underline the current line in the file
"set cursorcolumn                         "highlight the current column. Visible in GUI mode only.
 
set background=dark                      "make vim use colors that look good on a dark background
 
set showcmd                              "show incomplete cmds down the bottom
set showmode                             "show current mode down the bottom
set foldenable                           "enable folding
set showmatch                            "set show matching parenthesis
set noexrc                               "don't use the local config
 
set incsearch                            "find the next match as we type the search
set hlsearch                             "hilight searches by default
set ignorecase                           "ignore case when searching
 
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
 
set hidden                               "allow hiding buffers with unsaved changes
set cmdheight=2                          "make the command line a little taller to hide 'press enter to viem more' text
 
set clipboard=unnamed                    "Use system clipboard by default
set smartcase
set noerrorbells
set novisualbell
set laststatus=2

" ----------- Colors Configuration ----------------------------------

"colorscheme lucius
"LuciusDarkHighContrast
let g:solarized_termcolors=256
colorscheme solarized


" ----------- NERDTree Configuration ----------------------------------

"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
map <F9> :NERDTreeTabsToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeChDirMode = 2


" ----------- TagBar Configuration ----------------------------------

nmap <F8> :TagbarToggle<CR>

" ----------- KeyMapping Configuration ----------------------------------

nnoremap <UP> ""
nnoremap <Down> ""
nnoremap <Left> ""
nnoremap <Right> ""

nmap <C-t> :tabnew<CR>
nmap <F2> :tabprevious<CR>
nmap <F3> :tabnext<CR>

nmap <A-1> :tabmove 0<CR>
nmap <A-2> :tabmove 1<CR>
nmap <A-3> :tabmove 2<CR>
nmap <A-4> :tabmove 3<CR>


" ----------- TagList Configuration ----------------------------------

"let Tlist_Use_Right_Window = 1
"autocmd vimenter * TlistToggle
"let Tlist_Display_Prototype = 1


" ----------- Syntastic Configuration ----------------------------------

let g:syntastic_mode_map = {'mode' : 'passive',
				\ 'active_filetypes': [],
				\ 'passive-filetypes': []}

"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_enable_signs=1


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

function OnStartup()
  execute 'copen'
  execute 'TagbarToggle'
  execute 'NERDTreeTabsToggle'
  call feedkeys("\<C-W>")
  call feedkeys("\<C-W>")
endfunction

function OnShutdown()
  execute 'cclose'
  execute 'TagbarToggle'
  execute 'NERDTreeTabsToggle'
endfunction

command! OnStartup call OnStartup()
command! OnShutdown call OnShutdown()
nmap <F4> :OnStartup<CR>
nmap <F5> :OnShutdown<CR>
autocmd vimenter * OnStartup
"autocmd tabenter * OnStartup
"autocmd tableave * OnShutdown

" ----------- DIFF Configuration ----------------------------------

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" ----------- Ultisnips + YCM Configuration ----------------------------------


let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>

let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
