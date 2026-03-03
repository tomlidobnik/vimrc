set nocompatible
syntax on
filetype plugin indent on

if has('termguicolors')
  set termguicolors
endif

set laststatus=2
set number
set relativenumber
set cursorline
set nowrap
set scrolloff=8
set sidescrolloff=8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set signcolumn=yes
set showmatch
set cmdheight=1
set completeopt=menuone,noinsert,noselect
set noshowmode
set pumheight=10
set conceallevel=0
set concealcursor=
set lazyredraw
set synmaxcol=300
set fillchars=eob:\
let s:undodir = expand('~/.vim/undodir')
if !isdirectory(s:undodir)
  call mkdir(s:undodir, 'p')
endif
set nobackup
set nowritebackup
set noswapfile
set undofile
let &undodir = s:undodir
set updatetime=300
set timeoutlen=500
set ttimeoutlen=0
set autoread
set noautowrite

set hidden
set noerrorbells
set backspace=indent,eol,start
set noautochdir
set iskeyword+=-
set path+=**
set selection=inclusive
set mouse=a
if has('clipboard')
  set clipboard+=unnamedplus
endif
set modifiable
set encoding=utf-8
set listchars=tab:»\ ,trail:·,nbsp:␣

set splitbelow
set splitright

set wildmenu
set wildmode=longest:full,full
set redrawtime=10000
set maxmempattern=20000
set statusline=%{mode()}\ %f\ %h%m%r%=%y\ [%{&fileencoding}]\ %l:%c\ %p%%

let mapleader = ' '
let maplocalleader = ' '

nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

nnoremap <silent> <Esc> :nohlsearch<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

xnoremap <silent> <C-j> :m '>+1<CR>gv=gv
xnoremap <silent> <C-k> :m '<-2<CR>gv=gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

vnoremap < <gv
vnoremap > >gv

nnoremap J mzJ`z

nnoremap <silent> x "_x
xnoremap <silent> x "_x
vnoremap <silent> x "_x
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

if has('clipboard')
  nnoremap y "+y
  nnoremap Y "+Y
  vnoremap y "+y
endif

" COLORSCHEME BELOW

" Copyright (c) 2016-present Sven Greb <development@svengreb.de>
" This source code is licensed under the MIT license found in the license file.

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "nord"
set background=dark

let s:nord0_gui = "#2E3440"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord3_gui_bright = "#616E88"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"

let s:nord1_term = "0"
let s:nord3_term = "8"
let s:nord5_term = "7"
let s:nord6_term = "15"
let s:nord7_term = "14"
let s:nord8_term = "6"
let s:nord9_term = "4"
let s:nord10_term = "12"
let s:nord11_term = "1"
let s:nord12_term = "11"
let s:nord13_term = "3"
let s:nord14_term = "2"
let s:nord15_term = "5"

let g:nord_bold = get(g:, "nord_bold", 1)
let s:bold = (g:nord_bold == 0) ? "" : "bold,"

let g:nord_underline = get(g:, "nord_underline", 1)
let s:underline = (g:nord_underline == 0) ? "NONE," : "underline,"

let g:nord_italic = get(g:, "nord_italic", (has("gui_running") || $TERM_ITALICS == "true"))
let s:italic = (g:nord_italic == 0) ? "" : "italic,"

let g:nord_uniform_status_lines = get(g:, "nord_uniform_status_lines", 0)

let g:nord_bold_vertical_split_line = get(g:, "nord_bold_vertical_split_line", 0)
let g:nord_cursor_line_number_background = get(g:, "nord_cursor_line_number_background", 0)

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  let cmd = ""
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    let cmd = cmd . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    let cmd = cmd . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
call s:hi("Cursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", "NONE", "NONE", "NONE", "NONE", "")
call s:hi("Error", s:nord4_gui, s:nord11_gui, "", s:nord11_term, "", "")
call s:hi("iCursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:nord3_gui, "NONE", s:nord3_term, "NONE", "", "")
call s:hi("MatchParen", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("NonText", s:nord2_gui, "", s:nord3_term, "", "", "")
call s:hi("Normal", s:nord4_gui, "NONE", "NONE", "NONE", "", "")
call s:hi("Pmenu", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("PmenuSbar", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "", "")
call s:hi("PmenuSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("PmenuThumb", s:nord8_gui, s:nord3_gui, "NONE", s:nord3_term, "", "")
call s:hi("SpecialKey", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("SpellBad", s:nord11_gui, s:nord0_gui, s:nord11_term, "NONE", "undercurl", s:nord11_gui)
call s:hi("SpellCap", s:nord13_gui, s:nord0_gui, s:nord13_term, "NONE", "undercurl", s:nord13_gui)
call s:hi("SpellLocal", s:nord5_gui, s:nord0_gui, s:nord5_term, "NONE", "undercurl", s:nord5_gui)
call s:hi("SpellRare", s:nord6_gui, s:nord0_gui, s:nord6_term, "NONE", "undercurl", s:nord6_gui)
call s:hi("Visual", "", s:nord2_gui, "", s:nord1_term, "", "")
call s:hi("VisualNOS", "", s:nord2_gui, "", s:nord1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:nord1_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord8_gui, s:nord5_gui, s:nord3_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord7_gui, s:nord6_gui]
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
if g:nord_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:nord4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
endif
call s:hi("Folded", s:nord3_gui, s:nord1_gui, s:nord3_term, s:nord1_term, s:bold, "")
call s:hi("FoldColumn", s:nord3_gui, s:nord0_gui, s:nord3_term, "NONE", "", "")
call s:hi("SignColumn", s:nord1_gui, "NONE", s:nord1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:nord8_gui, "", s:nord8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:nord1_gui, "", s:nord1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nord4_gui, s:nord11_gui, "NONE", s:nord11_term, "", "")
call s:hi("ModeMsg", s:nord4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("Question", s:nord4_gui, "", "NONE", "", "", "")
if g:nord_uniform_status_lines == 0
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
else
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:nord0_gui, s:nord13_gui, s:nord1_term, s:nord13_term, "", "")
call s:hi("WildMenu", s:nord8_gui, s:nord1_gui, s:nord8_term, s:nord1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:nord6_gui, s:nord10_gui, s:nord6_term, s:nord10_term, s:underline, "")
call s:hi("Search", s:nord1_gui, s:nord8_gui, s:nord1_term, s:nord8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineFill", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nord4_gui, "", "NONE", "", "NONE", "")

if g:nord_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:nord2_gui, s:nord0_gui, s:nord3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:nord2_gui, s:nord1_gui, s:nord3_term, s:nord1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Character", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("Comment", s:nord3_gui_bright, "", s:nord3_term, "", "NONE", "")
call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
call s:hi("Conditional", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Constant", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("Decorator", s:nord12_gui, "", s:nord12_term, "", "", "")
call s:hi("Define", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Delimiter", s:nord6_gui, "", s:nord6_term, "", "", "")
call s:hi("Exception", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Float", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("Function", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("Identifier", s:nord4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Keyword", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Label", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Number", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("Operator", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("PreProc", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("Repeat", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Special", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("SpecialComment", s:nord8_gui, "", s:nord8_term, "", "NONE", "")
call s:hi("Statement", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("StorageClass", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("String", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("Structure", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Tag", s:nord4_gui, "", "", "", "", "")
call s:hi("Todo", s:nord13_gui, "NONE", s:nord13_term, "NONE", "", "")
call s:hi("Type", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("Typedef", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc
hi! link Variable Identifier
