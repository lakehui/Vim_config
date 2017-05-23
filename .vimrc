" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("vim/vimrc.local")
  source /etc/vim/gvimrc.local
endif

set helplang=cn
set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^
			"命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoread		" Set to auto read when a file is changed from the outside

set nu
"colo asuldark
set t_Co=256
colorscheme desert

"自动加载当前目录到gvim
"cd %:h 

"设置缩进   重要
set expandtab   "把tab转化为4个空格"
set tabstop=4
set softtabstop=4
set shiftwidth=4    "设置4个空格的缩进
"set autoindent
set cindent         "设置使用 C/C++ 语言的自动缩进方式
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

"设置高亮搜索
":set hlsearch

"常用简写命令
nmap cd :cd
nmap ls :! ls

nmap gcc :! gcc
nmap gl :! gcc -lGL -lGLU -lglut
nmap cv :! g++ `pkg-config opencv --libs --cflags opencv`
nmap w :w
nmap wq :wq
nmap mk :! mkdir
nmap tch :! touch
nmap cp :! cp
nmap rm :! rm
nmap make :! make
nmap cf :cs find


"Ctags  自动搜索并加载tags
":ts 命令就能列出一个列表供用户选择。    
":tp 为上一个tag标记文件，
":tn 为下一个tag标记文件。当然， 若当前tags文件中用户所查找的变量或函数名只有一个，“:tp,:tn”命令不可用。
nmap ts :ts
nmap tp :tp
nmap tn :tn
set tags=tags
set tags+=./tags,../tags,./*/tags
set tags+=/home/fangjian/.vim/sourceCode/glibc-2.16.0/tags
set tags+=/home/fangjian/.vim/sourceCode/stdcpp_for_ctags/tags
"set tags+=/home/fangjian/.vim/sourceCode/opencv/tags
set tags+=/home/fangjian/.vim/sourceCode/ogre_src_v1-8-1/tags
set tags+=/home/fangjian/.vim/sourceCode/opengl/tags

filetype on				"开启文件类型侦测		
filetype plugin on			"根据侦测到的不同类型加载对应的插件
filetype indent on			"根据侦测到的不同类型采用不同的缩进格式
set completeopt=longest,menu		"取消补全内容以分割子窗口形式出现,只显示补全列表

"TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"WinManager F2 to FileExplorer|TagList
let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
let g:winManagerWidth = 30
let g:AutoOpenWinManager = 1
nmap <silent><F2> :WMToggle<cr>
"如果加载失败，在命令行下：sudo apt-get install exuberant-ctags

"Cscope
"s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"d: 查找本函数调用的函数
"c: 查找调用本函数的函数
"t: 查找指定的字符串
"e: 查找egrep模式，相当于egrep功能，但查找速度快多了
"f: 查找并打开文件，类似vim的find功能
"i: 查找包含本文件的文
set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscope
map <F5> :call Do_CsTag()<CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        let tagsdeleted=delete("./"."tags")
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        let csfilesdeleted=delete("./"."cscope.files")
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        let csoutdeleted=delete("./"."cscope.out")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
		"silent! execute "!ctags -R ."
        "silent! execute "!ctags -R --fields=+S."
		"silent! execute "!ctags -R --c-types=+p --fields=+S ."
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        silent! execute "!cscope -Rbkq -i cscope.files"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

"自动加载cscope.out
function! LoadCscope()
	let db = findfile("cscope.out", ".;")			"从当前目录往上找，直到找到 cscope.out 这个命令能到找到cscope.out的路径。
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocsverb 								" suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set csverb
	endif
endfunction
au BufEnter /* call LoadCscope()

""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete配置(相当有用)
"--c++-kinds=+p : 为标签添加函数原型(prototype)信息
"--fields=+iaS : 为标签添加继承信息(inheritance)，访问控制(access)信息，函数特征(function Signature,如参数表或原型等)
"--extra=+q : 为类成员标签添加类标识
""""""""""""""""""""""""""""""""""""""""""""""
map <C-F12> :! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set cindent
set nocompatible
filetype plugin on
set completeopt=menu,menuone
set nocp
let OmniCpp_DisplayMode = 1 		"使用“MyClass::”显示类的所有方法和属性，这样比较方便
let OmniCpp_MayCompleteDot = 1 		" autocomplete with .
let OmniCpp_MayCompleteArrow = 1 	" autocomplete with ->
let OmniCpp_MayCompleteScope = 1 	" autocomplete with ::
let OmniCpp_SelectFirstItem = 2 	" select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 	" search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 	" show function prototype (i.e. parameters) in popup window
" mapping
"如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
"如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
"如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
"如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>" 


"括号等自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
else
	return a:char
endif
endf

function CloseBracket()
if match(getline(line('.') + 1), '\s*}') < 0
 	return "\<CR>}"
else
 	return "\<Esc>j0f}a"
endif
endf

function QuoteDelim(char)
let line = getline('.')
let col = col('.')
if line[col - 2] == "\\"
 	"Inserting a quoted quotation mark into the string
 	return a:char
elseif line[col - 1] == a:char
 	"Escaping out of the string
 	return "\<Right>"
else
 	"Starting a string
 	return a:char.a:char."\<Esc>i"
endif
endf


"Grep
nnoremap <silent><F7> :Grep<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl.vim
":bn   打开当前buffer的下一个buffer		
":bp   打开当前buffer的前一个buffer
":ls    当前打开的buf
":e <filename> 打开文件
":b<tab>    自动补齐
":bd    删除buf
" d     删除光标所在的buffer
":b num   打开指定的buffer，num指的是buffer开始的那个数字，比如上图，我想打开list_audit.erb，输入:b7就ok了
""""""""""""""""""""""""""""""""""""""""""""""
"minibufepl操作命令 :e <filename>
nmap vim :e
nmap bd :bd
nmap <silent><F4> :bp<CR>
nmap <silent><F6> :bn<CR>
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1 
let g:miniBufExplModSelTarget=1 

"NERD_commenter 设定注释
map <silent><F10> <leader>cc
map <silent><F11> <leader>cu

"用空格键来开关折叠
set foldenable
set foldmethod=syntax
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"设定自动保存折叠
"au BufWinLeave *.* silent mkview
"au BufWinLeave *.* silent! loadview


func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= "`pkg-config opencv --cflags --libs`"
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
        exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc


func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        endif
endfunc

func! RunResult()
        exec "w"
        if search("mpi\.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "python"
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>

map <F6> :call RunResult()<CR>
