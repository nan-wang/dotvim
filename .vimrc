"filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
"call pathogen#incubate()
call pathogen#helptags()

"=======================================
"SETUPS FOR PYTHON
"refer to http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
"" code folding
set foldmethod=indent
set foldlevel=99
"" code indent
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 textwidth=79

"" move windows with Ctrl + <move_ment>
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

"" snippets
"let g:snips_author = 'Nan Wang'

"" Task lists
map <leader>td <Plug>TaskList
 
"" Revision history
map <leader>g :GundoToggle<CR>

"" Syntax highlighting and gramma check
""" syntax highlighing
syntax on                           
""" try to detect filetypes
filetype on                          
""" enable loading indent file for filetype
" Conflicts with lux21 for unknown reasons.
"filetype plugin indent on    
""" check the consistence with pep-8
let g:pep8_map='<leader>8'

"" Tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingTabLiteral = '<c-t>'
""" use pydoc with <leader>pw
set completeopt=menuone,longest,preview

"" Code navigation
""" buffer plug-in minibufexpl
""" use :b<num> to switch between buffers
map <leader>gt :bNext<CR>
map <leader>Gt :bPrevious<CR>

""" fuzzy text file search with comment-t

""" NERDTree
map <leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
""" refactorying and go to with ropevim
map <leader>j :RopeGotoDefinition<CR>
map <leader>mv :RopeRename<CR> 

""" search with ack
nmap <leader>a <Esc>:Ack!

""" git
"Gblame: This allows you to view a line by line comparison of who the last person to touch that line of code is.
"Gwrite: This will stage your file for commit, basically doing git add <filename>
"Gread: This will basically run a git checkout <filename>
"Gcommit: This will just run git commit. Since its in a vim buffer, you can use keyword completion (Ctrl-N), like test_all<Ctrl-N> to find the method name in your buffer and complete it for the commit message. You can also use + and - on the filenames in the message to stage/unstage them for the commit.
"call fugitive#statusline()

"" Test
""" Django
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
""" Django
"export DJANGO_SETTINGS_MODULE=project.settings

""" pytest
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

""" virtual-env
"""" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
    "project_base_dir = os.environ['VIRTUAL_ENV']
    "sys.path.insert(0, project_base_dir)
    "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    "execfile(activate_this, dict(__file__=activate_this))
"EOF

"=======================================
"LATEX-SUITE
""IMPORTANT: win32 users will need to have 'shellslash' set so can be called correctly
set shellslash
""set <S-F1> to <S-F4> function
""set g:Tex_HotKeyMapping = 'section,paragraph,eqnarray,quotation'
let g:Tex_FormatDependency_pdf = 'dvi'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'pdflatex --shell-escape -synctex=1 --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_DefaultTargetFormat = 'pdf'

""Setting for LaTex
au FileType latex setlocal textwidth=79 autoindent
let g:Tex_ViewRule_dvi = 'evince'
let g:Tex_ViewRule_pdf = 'evince'
let g:tex_flavor = 'latex'

""Mapping \la to run !latex %
noremap <leader>la :!latex %<CR>
noremap <leader>ld :!evince %:r.dvi<CR>
set fileformat=unix

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

"In addition, the following settings could go in your ~/.vim/ftplugin/tex.vim
"file:  >
    "" this is mostly a matter of taste. but LaTeX looks good with just a bit
    "" of indentation.
    "set sw=2
    "" TIP: if you write your \label's as \label{fig:something}, then if you
    "" type in \ref{fig: and press <C-n> you will automatically cycle through
    "" all the figure labels. Very useful!
    "set iskeyword+=:
"========================================
"VIMWIKI
let g:vimwiki_list = [{'path': '~/PhD/Notes/NoteBook/', 'path_html': '~/PhD/Notes/NoteBookExport/'}]

"Set temporary file folder
set directory=~/vimtmp
set backupdir=~/vimtmp
let g:yankring_history_dir='~/vimtmp'

"========================================
"<plug-in>for AuthorInfo
nmap <F4> :AuthorInfoDetect<cr> 
let g:vimrc_author="Nan Wang"
let g:vimrc_email="nan.wang.28@gmail.com"
let g:vimrc_homepage="http://www.rub.de/ini/PEOPLE/nan"

"========================================
"taglist is missing
"<plug-in>for taglist
map <F10> :call Do_CsTag()<CR>
function Do_CsTag()
		let dir = getcwd()
		if filereadable("tags")
			let tagsdeleted=delete("./"."tags")
		endif
		if(executable('ctags'))
				silent! execute "!ctags -R --c-types=+p --fields=+S *"
				silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
                silent! execute "!ctags -R --python-kinds=-i --fields=+iaS --extra=+q ."
		endif
endfunction
"<F8> run TlistToggle 
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Ctags_Cmd='ctags --recurse'
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=0
let Tlist_Inc_Winwidth=0

"Solarized
set background=dark
colorscheme solarized

"Miscellous
set autoindent

"Evernote
let g:evervim_devtoken='S=s9:U=10bd03:E=14a9b8a1a25:C=14343d8ee28:P=1cd:A=en-devtoken:V=2:H=a453e954ba950e13c2ea03e1d71917e4'
