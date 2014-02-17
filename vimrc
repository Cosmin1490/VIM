
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" ----------- Vundle Configuration ----------------------------------
                                              
   filetype off                  " required!
   
   set rtp+=~/.vim/bundle/vundle/
   call vundle#rc()
   
   Bundle 'gmarik/vundle'
   Bundle 'scrooloose/nerdtree'   
   Bundle 'majutsushi/tagbar'
"   Bundle 'scrooloose/syntastic'
   Bundle 'Valloric/YouCompleteMe'

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


" ----------- Colors Configuration ----------------------------------

" ----------- NERDTree Configuration ----------------------------------

autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <F9> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeChDirMode = 2



" ----------- TagBar Configuration ----------------------------------

nmap <F8> :TagbarToggle<CR>


" ----------- TagList Configuration ----------------------------------

"let Tlist_Use_Right_Window = 1
"autocmd vimenter * TlistToggle
"let Tlist_Display_Prototype = 1


" ----------- Syntastic Configuration ----------------------------------

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1


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