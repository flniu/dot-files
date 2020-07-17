" My vimrc for Mac/Linux/Windows * GUI/Console
" Author: Francis Niu (https://github.com/flniu)
" Last Change: 2020-07-17

" Global variables {{{
let $MYVIMRC = '~/.config/nvim/init.vim'
if !exists($TMP)
  let $TMP = '~/.tmp'
endif
"}}}

" Plugins {{{
call plug#begin()

" Color schemes
Plug 'flniu/f-vim-colors'
" Syntax and settings for plain text
Plug 'flniu/txt.vim'

call plug#end()

"}}}

" Display {{{
set shortmess=atI
set number
set statusline=%f\ %m%r[%{strftime('%Y%m%d',getftime(expand('%')))}]%=%{GetFileEditSetting()}\ %9(%l/%L%),%-3v\ %P
function! GetFileEditSetting() "{{{
  let misc = (&ar ? 'ar,' : '') . (&paste ? 'p,' : '')
  let fencstr = (empty(&fenc) ? &enc : &fenc) . (&bomb ? '.BOM' : '')
  let textmode = (&et ? '-' : '|') . &ts . (&sts ? '.' . &sts : '') .
        \ (!empty(&inde) ? 'e' : &cin ? 'c' : &si ? 's' : &ai ? 'a' : 'n') . &sw .
        \ (&wrap ? 'z' : '-') . &tw .
        \ (&ic ? (&scs ? 'S' : 'I') : 'C')
  return misc . '[' . fencstr . ',' . strpart(&ff,0,1) . '][' . &ft . ',' . textmode . ']'
endfunction "}}}
set laststatus=2
set lazyredraw
set list
set listchars=tab:\|\ ,trail:-,nbsp:_,precedes:<,extends:>
set scrolloff=5
if has('folding')
  set foldcolumn=1
endif
"}}}

" Encoding & multi-byte support {{{
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1
set ambiwidth=double
set formatoptions+=mM
"}}}

" GUI & Terminal {{{
try
  colors molokai
catch
  colors desert
endtry
"}}}

" Key-mappings {{{
" Make j/k behave like gj/gk but 1j/1k behave as normal
noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')
" Yank from cursor to end of line
noremap gy y$
noremap gc "*y$
" Double ESC to stop highlighting
nmap <ESC><ESC> :noh<CR>
" Jump diffs
nmap <S-F7> [c
nmap <F7> ]c
" Scroll screen left/right
nmap <A-Left> zH
nmap <A-Right> zL
" Increase/Decrease indent
nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
" Jump tabs
nmap <C-Tab> gt
nmap <C-S-Tab> gT
" Jump or List buffers
nmap <F2> :bp<CR>
nmap <F3> :bn<CR>
nmap <F4> :ls<CR>
" Horizontal & Vertical split
nmap <Leader>hs :split<CR>
nmap <Leader>vs :vsplit<CR>
nmap <Leader>hn :new<CR>
nmap <Leader>vn :vnew<CR>
" Shortcut keys, press K on each command/option to find its meaning
" if K cannot locate an option, use :h 'option' instead
nmap <Leader>dt :diffthis<CR>
nmap <Leader>du :diffupdate<CR>
nmap <Leader>tn :tabnew<CR>
nmap <Leader>ar :set autoread!<CR>
nmap <Leader>pa :set paste!<CR>
nmap <Leader>et :set expandtab!<CR>
nmap <Leader>li :set list!<CR>
nmap <Leader>sp :set spell!<CR>
" Toggle line number & relative line number
nmap <Leader>nu :set nu!<CR>
nmap <Leader>rn :set rnu!<CR>
" Toggle cursor cross(column+line)
nmap <Leader>cr :set cuc! cul!<CR>
" Toggle textwidth & wrap
nmap <Leader>tw :let &tw = (&tw > 0 ? 0 : 78)<CR>
nmap <Leader>wr :set wrap!<CR>
" Toggle hex-editing
nmap <Leader>xxd :call XxdToggle()<CR>
function! XxdToggle() "{{{
  let mod = &mod
  if getline(1) =~ "^000000"
    exe '%!xxd -r'
    set ft=
    doautocmd filetypedetect BufReadPost
  else
    exe '%!xxd'
    set ft=xxd
  endif
  let &mod = mod
endfunction "}}}
" Trim text: replace full-width space, remove trailing spaces, remove blank lines
nmap <Leader>tt :%s/\%u3000/ /ge <Bar> %s/\s\+$//e <Bar> g/^$/d<CR>
" Add comma, Add quotation and comma
nmap <Leader>ac :%s/^.\+$/\0,/e<CR>
nmap <Leader>qc :%s/^.\+$/'\0',/e<CR>
vmap <Leader>ac :s/^.\+$/\0,/e<CR>
vmap <Leader>qc :s/^.\+$/'\0',/e<CR>
" Change fileencoding, Toggle BOM
nmap <Leader>eu :set fenc=utf-8<CR>
nmap <Leader>eg :set fenc=cp936<CR>
nmap <Leader>el :set fenc=latin1<CR>
nmap <Leader>bm :set bomb!<CR>
" Change fileformat
nmap <Leader>fd :set ff=dos<CR>
nmap <Leader>fu :set ff=unix<CR>
nmap <Leader>fm :set ff=mac<CR>
" Search visual selected text
vmap <silent> // y/<C-R>=substitute(escape(@",'\\/.*^$~[]'),'\n','\\n','g')<CR><CR>
" Search conflicts
nmap <Leader>cf /<<<<\+\\|====\+\\|>>>>\+<CR>
" Save with sudo
cmap w!! w !sudo tee >/dev/null %
"}}}

" Commands {{{
" Edit/Source vimrc
command! EVIMRC e $MYVIMRC
command! SOVIMRC so $MYVIMRC
" cd current path
command! CDC cd %:p:h
" Shortcut commands
command! -nargs=? FT set ft=<args>
command! -nargs=1 TS set ts=<args> sw=<args>
command! -nargs=1 TSI set ts=<args> sw=<args> fdm=indent
" Reverse lines in range
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1
" Group-by lines and count
command! -range=% Count <line1>,<line2>sort | <line1>,<line2>s#\(^.\+$\)\(\n^\1$\)*#\=submatch(1)."\t".((len(submatch(0))+1)/(len(submatch(1))+1))#
" Write temp file, optional file extension name
command! -nargs=? WT call WriteTempFile(<f-args>)
function! WriteTempFile(...) "{{{
  let old_filename = expand('%')
  let new_filename = $TMP . '/' . strftime("%Y%m%d%H%M%S") . '.' . (a:0 >= 1 ? a:1 : 'tmp')
  if empty(old_filename)
    exe 'write ' . new_filename
  else
    exe '!mv ' . old_filename . ' ' . new_filename
    exe 'edit ' . new_filename
  endif
endfunction "}}}
command! -range=% FormatJSON <line1>,<line2>!python -m json.tool
"}}}

" Autocmds {{{
" last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" timestamp
au BufWritePre,FileWritePre * call SetTimeStamp()
function! SetTimeStamp() "{{{
  if line('$') > 10
    1,10s/Last Change:\s.*$/\=strftime("Last Change: %Y-%m-%d")/e
  else
    %s/Last Change:\s.*$/\=strftime("Last Change: %Y-%m-%d")/e
  endif
endfunction "}}}
"}}}

" vim:et:ts=2:sw=2:fdm=marker:
