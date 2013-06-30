"call pathogen#infect()
filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()

"=======================================
"SETUPS FOR PYTHON
"refer to http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
"" code folding
set foldmethod=indent
set foldlevel=99

"" move windows with Ctrl + <move_ment>
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

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
filetype plugin indent on    
""" check the consistence with pep-8
let g:pep8_map='<leader>8'

"" Tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
""" use pydoc with <leader>pw
set completeopt=menuone,longest,preview

"" Code navigation
""" buffer plug-in minibufexpl
""" use :b<num> to switch between buffers

""" fuzzy text file search with comment-t

""" refactorying and go to with ropevim
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR> 

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
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

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

""MiKTex
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

""Mapping \la to run !latex %
noremap <leader>la :!latex %<CR>
noremap <leader>ld :!yap %:r<CR>
set fileformat=unix

"========================================
"VIMWIKI
let g:vimwiki_list = [{'path': '~/PhD/Notes/NoteBook/', 'path_html': '~/PhD/Notes/NoteBookExport/'}]

"Set temporary file folder
set directory=~/vimtmp
set backupdir=~/vimtmp
let g:yankring_history_dir='~/vimtmp'

"========================================
"<plug-in>for AuthorInfo
let g:vimrc_author="Nan Wang"
let g:vimrc_email="nan.wang.28@gmail.com"
let g:vimrc_homepage="http://www.rub.de/ini/PEOPLE/nan"

"========================================
"taglist is missing