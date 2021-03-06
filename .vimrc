" Setup file for GVIM
" by Geir Atle Hegsvold

" The leader key is used for activation for shortcuts.
" Default is \
let mapleader = "\<Space>"

" Pathogen - python plugin (https://github.com/tpope/vim-pathogen)
filetype off
execute pathogen#infect()
" Invoke :helptags on all non-$VIM doc directories in runtimepath
execute pathogen#helptags()

" Nerdtree (ctrl+n)
map <C-n> :NERDTreeToggle<CR>

" Enable syntax highlighting
syntax on
filetype indent plugin on

" Encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Update intervall for GitGutter
" More info: https://github.com/airblade/vim-gitgutter
set updatetime=250
let g:gitgutter_max_signs = 20000

" Code folding
set foldmethod=indent
set foldlevel=99

" Highlight current line
set cursorline

" Line numbering
set nu

" Menu language
set langmenu=en

" Set highlighting colors for a dark background
set background=dark

" Use white on black colors
hi Normal guifg=snow guibg=black

" No need to access the menus using <Alt> shortcut keys
set winaltkeys=no

" Allow backspacing over the start of insert
set backspace=2	

" Arrowkeys works in insertmode
set esckeys

" No minimum help window size
set helpheight=0

" Insert extra space after punctuation when joining lines
set joinspaces

" Always show status line
set laststatus=2

" Magic mode for regex patterns
set magic

" Check for modelines
set modeline

" Only check the last line for modelines
set modelines=1	

" Don't keep backups
set nobackup

" No temporary backups
set nowritebackup

" No warning beeps
set noerrorbells

" Don't highlight matches to search pattern
set nohlsearch

" Don't start in insertmode
"set noinsertmode

" Don't break lines
set nowrap

" Show line and column number of the cursor position
set ruler

" Use abbreviations where possible in output, and truncate file message
set shortmess=at

" Show (partial) command in status line
set showcmd

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" If in `Insert', `Replace' or `Visual' mode put a message on the last line
set showmode

" Files with these suffixes are ignored when multiple files match a wildcard
set suffixes=.bak.swp.o.~

" Builtin termcaps are searched before the external ones
set ttybuiltin

" More characters will be sent to the screen for redrawing
set ttyfast

" Visual bell only
set visualbell

" Allow arrowkeys to skip to next line when on the last/first character
set whichwrap=<,>,[,]

" I always use bash, and the following variable extends $VIM/syntax/sh.vim
" for that shell
let bash_is_sh = 1

" I want special highlighting for Tabs (highlighted as Todo) when
" editing sed scripts
let highlight_sedtabs = 1

" Go to the first line
map g 1G
map <kHome> 1G

" Go to the last line
map <kEnd> G

" Yank from current position to end of line
nmap Y y$

" Delete trailingspace
nmap <M-d> :%s/\s\+$//<CR>
vmap <M-d> :s/\s\+$//<CR>

" Plain text formatting
nmap <M-f> :%!fmt<CR>
vmap <M-f> !fmt<CR>

" Sort buffer
nmap <M-s> :%!sort -df<CR>
vmap <M-s> !sort -df<CR>

" Prep for Sesam test data
" 1: delete NIs, rdf:types and _<props>
map <M-1> :%s/.*-ni.*//g<CR>:%s/.*"rdf:type".*//g<CR>:%s/.*"_deleted".*//g<CR>:%s/.*"_hash".*//g<CR>:%s/.*"_previous".*//g<CR>:%s/.*"_ts".*//g<CR>:%s/.*"_updated".*//g<CR>

" 2: Strip away linefeeds
map <M-2> :%s/\n//g<CR>

" 3: Remove trailing comma
map <M-3> :%s/, \{-}}/}/g<CR>

" Format JSON
map <M-j> :%!jq --indent 2 .<CR>

" Format XML
map <M-x> :%!xmllint --format --recover -<CR>

" SQL Utils http://www.vim.org/scripts/script.php?script_id=492
let g:sqlutil_align_comma = 1
let g:sqlutil_align_where = 1
let g:sqlutil_align_first_word = 1

vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

"    mnemonic explanation
"    s - sql
"      f   - format
"      cl  - column list
"      cd  - column definition
"      cdt - column datatype
"      cp  - create procedure 

" Number of spaces that a <Tab> in the file counts for
set tabstop=4
set autoindent shiftwidth=2 softtabstop=2 cindent
set expandtab

" Options for specific file types
au BufNewFile,BufRead *.awk,*.b,*.c,*.h,*.vim	set autoindent cindent
au BufNewFile,BufRead *.lsp			set autoindent lisp
au BufNewFile,BufRead *.scm,*.cl		set autoindent lisp
							\ shiftwidth=2
							\ softtabstop=2
							\ tabstop=8
au BufNewFile,BufRead *.sed			set tabstop=1
au BufNewFile,BufRead *.sh			set autoindent
au BufNewFile,BufRead *.sim			set autoindent
							\ shiftwidth=4
							\ softtabstop=4
							\ tabstop=8
au BufNewFile,BufRead *termcap*			let is_termcap=1
au BufNewFile,BufRead *.tex			nmap <M-t> :!tex "%"<CR>
au BufNewFile,BufRead *.java			set autoindent
							\ shiftwidth=4
							\ softtabstop=4
							\ tabstop=4
au BufNewFile,BufRead *.xml,*.xsl,*.xslt,*.xsd,*.html,*.sgml,*.sgm,*.fo,*.json	set autoindent
										\ shiftwidth=2
										\ softtabstop=2
										\ tabstop=2

" This rc file is shared between a Unix and a Win32 VIM, so I don't
" want any <CR>s cluttering it up when editing it in Windows
au BufNewFile,BufRead _vimrc					set ff=unix

" Abbreviations present in all contexts
ab iff< if and only if

" Abbreviations specific to certain file types
au BufNewFile,BufRead *.vim	ab abb< au BufNewFile,BufRead
au BufNewFile,BufRead *vimrc*	ab abb< au BufNewFile,BufRead

" python
au BufNewFile,BufRead *.py
	\ ab class<		class c:def __init__(self):passdef __str__(self):pass|
	\ ab ifname<	if __name__ == "__main__":|
	\ set expandtab

" docbook
au BufNewFile,BufRead *.xml,*.sgml,*.sgm
	\ ab article<   <?xml version="1.0" encoding="UTF-8"?><article xmlns="http://docbook.org/ns/docbook" version="5.0" xml:lang="en"><info><title>Article</title><author><firstname>Geir Atle</firstname><surname>Hegsvold</surname></author></info><section><title></title><para></para></section></article>|
	\ ab chapter<   <chapter><title></title></chapter>|
	\ ab sect<      <section><title></title><para></para></section>|
	\ ab sect1<     <sect1><title></title><para></para></sect1>|
	\ ab sect2<     <sect2><title></title><para></para></sect2>|
	\ ab sect3<     <sect3><title></title><para></para></sect3>|
	\ ab sect4<     <sect4><title></title><para></para></sect4>|
	\ ab para<      <para></para>|
	\ ab fp<        <formalpara><title></title></formalpara>|
	\ ab em<        <emphasis></emphasis>|
	\ ab il<        <itemizedlist><listitem><para></para></listitem></itemizedlist>|
	\ ab ol<        <orderedlist><listitem><para></para></listitem></orderedlist>|
	\ ab li<        <listitem><para></para></listitem>|
	\ ab ex<        <example><title></title><mediaobject><textobject></textobject><caption></caption></mediaobject></example>|
	\ ab fig<       <figure><title></title><mediaobject><imageobject><imagedata fileref="" format="PNG"/></imageobject><caption></caption></mediaobject></figure>|
	\ ab table<     <table frame="all"><title></title><tgroup cols="3" colsep="1" rowsep="1"><colspec align="left"   colname="c1" colwidth="1*" /><colspec align="center" colname="c2" colwidth="2*" /><colspec align="right"  colname="c3" colwidth="1*" /><thead><row><entry>C1</entry><entry>C2</entry><entry>C3</entry></row></thead><tfoot><row><entry>F1</entry><entry>F2</entry><entry>F3</entry></row></tfoot><tbody><row><entry>c1</entry><entry>c2</entry><entry>c3</entry></row></tbody></tgroup></table>|
	\ ab colspec<   <colspec align="left"   colname="c1" colwidth="1*" />|
	\ ab spanspec<  <spanspec spanname="hspan" namest="c1" nameend="c2" align="center" />|
	\ ab row<       <row><entry></entry></row>|
	\ ab entry<     <entry></entry>|
	\ ab xref<      <xref linkend="" />|
	\ ab glossdiv<  <glossdiv><title></title><glossentry><glossterm></glossterm><glossdef><para>|
	\ ab glossent<  <glossentry><glossterm></glossterm><glossdef><para></para></glossdef></glossentry>

" xslt
au BufNewFile,BufRead *.xsl,*.xslt
	\ ab apply<     <xsl:apply-templates select="" />|
	\ ab template<  <xsl:template match=""></xsl:template>|
	\ ab foreach<   <xsl:for-each select=""></xsl:for-each>

" xsd
au BufNewFile,BufRead *.xsd
	\ ab schema<    <?xml version="1.0" encoding="utf-8"?><xs:schema targetNamespace="http://heim.ifi.uio.no/gahegsvo/rpg/RPGDoc" xmlns="http://heim.ifi.uio.no/gahegsvo/rpg/RPGDoc" xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" version="1.0"></xs:schema>|
	\ ab include<   <xs:include schemaLocation=""/>|
	\ ab el<        <xs:element name="" type=""/>|
	\ ab elref<     <xs:element ref="" minOccurs="0" maxOccurs="1"/>|
	\ ab ct<        <xs:complexType name=""><xs:sequence><xs:element ref="" minOccurs="0" maxOccurs="1"/></xs:sequence></xs:complexType>

" Colors 8-15 are high intensity colors:
"
"  8: black, 9: red, 10: green, 11: yellow, 12: blue, 13: magenta
" 14: cyan, 15: white
"
if exists("is_highintensity")
    hi Comment    term=bold                          ctermfg=12 guifg=#80a0ff
    hi Constant   term=underline                     ctermfg=9  guifg=#ffa0a0
    hi Identifier term=underline cterm=NONE          ctermfg=14 guifg=#40ffff
    hi Operator   term=bold      cterm=bold gui=bold ctermfg=11 guifg=gold
    hi PreProc    term=underline                     ctermfg=13 guifg=#ff80ff
    hi Statement  term=bold      cterm=bold gui=bold ctermfg=11 guifg=#ffff60
    hi Type       term=underline cterm=bold gui=bold ctermfg=10 guifg=#60ff60
    hi Special	  term=bold							 ctermfg=8	guifg=Orange

    hi Error cterm=reverse ctermbg=white ctermfg=darkred guibg=Red guifg=White
endif

" Use css when converting to HTML
let html_use_css = 1

" Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        "set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if !exists("g:spf13_no_big_font")
            if LINUX() && has("gui_running")
                set guifont=Andale\ Mono\ Regular\ 8,Menlo\ Regular\ 10,Consolas\ Regular\ 10,Courier\ New\ Regular\ 10
            elseif OSX() && has("gui_running")
                set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
            elseif WINDOWS() && has("gui_running")
                set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
            endif
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

