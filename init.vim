" Простая конфигурация NeoVim для пользователей с русско-английской клавиатурой
" Как правило, русскоязычных (duh)
" Минималистичная, минимум плагинов, но с развёрнутым описанием каждой функции, настройки и команды

" Работает для NeoVim 0.4.4. Без компиляции,
" готовый пакет из репозитория пакетов Linux-подобных систем.
" Чистый конфиг, без использования менеджеров плагинов.

" Цветовые схемы вручную копировал в папку ~/.config/nvim/
" Также, ручками добавил
" lightline и NERDTree в ~/.config/nvim/pack/plugins/start,
" а NERDCommenter в ~/.config/nvim/plugin
"
" vim-gitgutter, latexlivepreview и ещё пару плагинов
" установил в ~/.config/nvim/pack

""
"""" -----------------------
""" Общее между Vim и NeoVim
"""" -----------------------
""

" Прежде, чем начнём, отключим обратную совместимость с vi,
" старой версией Vim'а. Вообще, наличие файлов
" ~/.vimrc или .config/nvim/init.vim
" по умолчанию выключает её, но на всякий случай
" полезно явным образом это указать
set nocompatible

" И ещё одна маленькая настройка для того,
" чтобы плагины (NERDTree, NERDCommenter, lightline и прочие)
" вообще работали
filetype plugin indent on

" -----------------------------
" --- Частичная русификация ---
" -----------------------------

" >>> Решение 1, в лоб

" Работа с вводом (INSERT) без переключения раскладки
noremap ш i
noremap Ш I
noremap ф a
noremap Ф A
noremap щ o
noremap Щ O

" Работа с заменой (REPLACE) без переключения раскладки
noremap к r
noremap К R

" Работа с режимом выделения (VISUAL) без переключения раскладки
noremap м v
noremap М V

" Работа с поиском:
" следующее и предыдущее совпадение без переключения раскладки
noremap т n
noremap Т N

" Копировать, удалить и вставить без переключения раскладки
noremap н y
noremap Н Y
noremap в d
noremap В D
noremap ч x
noremap Ч X
noremap з p
noremap З P

" Перемещения к началу/концу слов без переключения раскладки
noremap ц w
noremap Ц W
noremap у e
noremap У E
noremap и b
noremap И B

" Некоторые прочие русские буквы
noremap а f
noremap А F
noremap е t
noremap Е T
noremap ё `
noremap Ё ~
noremap й q
noremap Й Q
noremap п g
noremap П G
noremap С C
noremap с c
noremap я z
noremap Я Z

" Тут важен именно map, чтобы в дальнейшем
" можно было убрать стандартное действие
" (удаление символа/строки и переход в режим INSERT)
map ы s
map Ы S

" Одинарные кавычки: ' в режиме ввода (INSERT) по нажатию Ctrl+э
inoremap <C-э> '

" Двойные кавычки: " в режиме INSERT по нажатию Ctrl+Shift+Э
" Решётка/хэштег: # в режиме INSERT по нажатию Ctrl+Shift+Три

" Меньше-больше/угловые скобки: < и > в режиме INSERT дают
" Ctrl+Shift+б и Ctrl+Shift+ю соответственно

"" Квадратные скобки так не работают:
"" noremap <C-х> [
"" noremap <C-ъ> ]
" ...потому что конфликтуют с управляющими последовательностями ANSI

" НО, можно использовать Compose key
" См. https://ru.wikipedia.org/wiki/Compose
" Тут больше символов указано: https://fsymbols.com/keyboard/linux/compose/

" Так, [ и ] можно ввести с помощью Compose+(+( и Compose+)+) соответственно
" А { и } можно вводить с помощью Compose+-+( и Compose+-+) соответственно

" <<<

" >>> Решение 2, сторонняя программа для переключения xkb layout
" https://github.com/grwlf/xkb-switch

" Поскольку русское символы нужны лишь во режиме INSERT,
" можно назначить отдельные команды для входа и выхода в этот режим
" с переключением текущей раскладки (предполагается, что EN)
" на русскую при входе, и сменой на английскую при выходе из режима
" К примеру, использовать Ctrl+l

" <<<

" >>> Решение 3, встроенные раскладки в Vim
" https://habr.com/ru/post/98393/

" !!!
" Работает даже для голого терминала (tty), без графического окружения
" (Без DE и WM, без Xorg/Wayland)
" !!!

" Переключение между кириллицей и латиницей Ctrl+^ в режиме INSERT
" (Просто Ctrl+6-ка в английской раскладке)

" При этом, сохраняются все английские настройки для других режимов,
" как будто используем английскую раскладку, хотя в режиме INSERT набираем текст по-русски

" Подключение встроенного файла с русской йцукен клавиатурой.
" Возможные варианты: russian-%вариация%:
" jcuken, jcukenwin, jcukenwintype, jcukenmac, typograph, yawerty, dvorak
" set keymap=russian-jcukenwin

" Все доступные раскладки лежат тут - %папка с конфигами Vim%/keymap/

" Чтобы вставка и поиск работали, как надо
" set iminsert=0
" set imsearch=0

" Чтобы можно было так же нажимать Ctrl-l для переключения, помимо Ctrl+^
" inoremap <C-l> <C-^>

" Дополнительная подсветка для курсора, чтобы различать режимы
" highlight lCursor guifg=NONE guibg=Cyan

" -----------------------------
" --- Привычные комбинации ----
" --- клавиш для редакторов ---
" --- вне терминала -----------
" -----------------------------

" Ctrl+s для сохранения файла и возврата в нормальный режим (NORMAL)
"   из NORMAL
nnoremap <C-s> :w<CR>
"   из INSERT
inoremap <C-s> <Esc>:w<CR>
"   из VISUAL
vnoremap <C-s> <Esc>:w<CR>

" Ctrl+c для закрытия текущего файла, находясь в режиме NORMAL
nnoremap <C-c> :q<CR>

" Ctrl+z для отмены изменений и Ctrl+x для возврата к изменениям
" в режимах NORMAL, VISUAL и INSERT
nnoremap <C-z> :undo<CR>
vnoremap <C-z> <Esc>:undo<CR>
inoremap <C-z> <Esc>:undo<CR>i

" Ctrl+a для выделения всего файла в режиме NORMAL
" nnoremap <C-a> :1<CR>VG

" Двигать текущую строку в режиме NORMAL
" вверх и вниз по нажатию Ctrl+Shift+Вверх/Вниз,
" где Вверх/Вниз это соответствующие стрелки на клавиатуре
nnoremap <silent> <C-S-Up> :m .-2<CR>
nnoremap <silent> <C-S-Down> :m .+1<CR>

" Аналогично, но уже для режима VISUAL
" перемещение нескольких строк за раз
vnoremap <silent> <C-S-Up> :m '<-2<CR>gv
vnoremap <silent> <C-S-Down> :m '>+1<CR>gv

" Ctrl+backspace для удаления слова
" до курсора в режиме INSERT
" ( принимается за Backspace)
inoremap <C-h> <Esc>vbc

" Ctrl+delete для удаления слова
" после курсора в режиме INSERT
inoremap <C-Del> <Esc>lvec
" inoremap <C-Del> <C-o>lvec
" https://vim.fandom.com/wiki/Quick_generic_option_toggling

" -----------------------------
" --- Комментирование
" --- и раскомментирование
" --- строк в NERDCommenter
" -----------------------------

" Убираем стандартные сочетания клавиш
let g:NERDCreateDefaultMappings = 0

" Добавляем пробел после комментария
let g:NERDSpaceDelims = 1

" Используем компактный синтаксис
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Разрешаем комментировать пустые строки
let g:NERDCommentEmptyLines = 1

" Эта настройка будет удалять лишние пробелы после крайнего
" непробельного символа в строке после раскомментирования
" Лучше выключить, потому что эта Vim конфигурация и так сама
" чистит файл (см. функция на ~528 строке)
let g:NERDTrimTrailingWhitespace = 0

" Разрешаем проверку на то, закомментирована строка или нет
let g:NERDToggleCheckAllLines = 1

" Комментировать и раскомментировать строку
" в режиме NORMAL по нажатию Ctrl+/
nmap <C-_> <Plug>NERDCommenterToggle

" Аналогично, но для режима VISUAL
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Аналогично, но для INSERT
" imap <C-_> <Esc><Plug>NERDCommenterTogglella

" По какой-то причине, Vim видит нажатие Ctrl+/, как Ctrl+_
" Подробнее смотри тут: https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim

" -----------------------------
" --- Настройка отступов, -----
" --- переносов и табуляции ---
" -----------------------------

" Табуляция, использование 4-х пробелов вместо \t
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Настройка табуляции для отдельных типов файлов
autocmd FileType json setlocal ts=2 sw=2
autocmd FileType html setlocal ts=2 sw=2
autocmd FileType md setlocal ts=2 sw=2
autocmd FileType markdown setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType yml setlocal ts=2 sw=2

" Перенос слов без разрывов между ними (строго по пробелам)
set linebreak

" Включение визуального переноса слов на другую строку (soft wrap)
set wrap

" Иногда, нужно добавлять ещё и nolist, чтобы это сработало:
" set nolist

" Принудительный перенос от 120 символов (hard wrap)
" Если наберётся 120 символов до конца экрана -
" то перенесёт на следующую строку следующее слово,
" а иначе, сработает soft wrap выше и разместит новое
" слово в той же строке, но визуально разобьёт их на две
" set tw=120
"
" Выключение hard wrap
set textwidth=0
set wrapmargin=0

" set nowrap           " do not automatically wrap on load
" set formatoptions-=t " do not automatically wrap text when typing
" See: https://stackoverflow.com/questions/1290285/why-cant-i-stop-vim-from-wrapping-my-code

" Установка smartindent и autoindent для табуляции
set smartindent

" autoindent: новые строчки копируют отступы прежних
" Иногда плохо срабатывает при вставке, можно закомментировать
" set autoindent

" Менять уровень табуляции для режима VISUAL по нажатию > и <
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" -----------------------------
" --- Автодополнения в --------
" --- режиме INSERT -----------
" -----------------------------

" ~~~
" Простое дополнение
" ~~~

" Дополняет слово, ориентируясь на слова в текущем файле
" Ctrl+n - следующий вариант
" Ctrl+p - предыдущий
" После нажатия любой комбинации выше можно использовать
" стрелки Вверх/Вниз для перебора вариантов

" ~~~
" Расширенное дополнение
" ~~~

" Нажать Ctrl+x, а затем нажать Ctrl + нужный способ
" Способов много, см.: https://vim.fandom.com/wiki/Any_word_completion

" Наиболее полезные:
" - Ctrl+f - файловое дополнение
"
" - Ctrl+l - дополнение всей строки
"   (если есть похожая строка в файле)
"
" - Ctrl+o - омнидополнение функций (omnifunc)
"   (по синтаксису текущего типа файла)

" Авто-дополнение слов по словарю (ru / en)
" ctrl+n и ctrl+p в любом файле
set complete+=kspell

" Чтобы меню возникало всегда, и по умолчанию не автодополняло
set completeopt=longest,menu
" :help completeopt

" ~~~~~~~~~
" Перешёл на https://github.com/ervandew/supertab
" ~~~vvv~~~

" " Настраиваем 'умное' автодополнение по нажатию Tab:
" " - если нечего дополнять, то используем Tab, как обычно
" function! SmartTabComplete()
"
"     " Если меню с выбором уже открылось, перейти к следующему варианту
"     if pumvisible()
"         return "\<C-n>"
"     endif
"
"     " Содержимое текущей строки
"     let l:line = getline('.')
"
"     " Берём подстроку от начала текущей строки
"     " и до положения курсора, но можно написать
"     " и col('.') + 1, чтобы брать чуть больше
"     let l:substr = strpart(l:line, -1, col('.'))
"
"     " Проверяем,состоит ли строка только из пробельных символов
"     let l:substr = matchstr(l:substr, '[^ \t]*$')
"
"     if (strlen(l:substr) == 0)                          " nothing to match on empty string
"         return "\<Tab>"
"     endif
"
"     let l:has_period = match(l:substr, '\.') != -1      " position of period, if any
"     let l:has_slash = match(l:substr, '\/') != -1       " position of slash, if any
"
"     if (!l:has_period && !l:has_slash)
"         return "\<C-x>\<C-n>"                         " existing text matching
"     elseif (l:has_slash)
"         return "\<C-x>\<C-f>"                         " file matching
"     else
"         return "\<C-x>\<C-o>"                         " plugin matching
"     endif
" endfunction
" " Взято с: https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
" " Дополнил с помощью: https://stackoverflow.com/questions/9751540/omnicomplete-in-vim-with-shift-tab-not-working
"
" " Заменил <C-r>= перед названием функции
" " на <expr> перед Tab, и удалил <CR> на конце
" " (по сравнению с примерами по ссылкам выше)
" inoremap <expr><Tab> SmartTabComplete()
"
" " Обратный скролл вариантов Tab на Shift+Tab (в том числе отмена первого изменения)
" inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-n>"
"
" Выбор дополнения по нажатию Enter, вместо перевода строки
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ~~~^^^~~~
" Перешёл на https://github.com/ervandew/supertab
" ~~~~~~~~~

" Вручную настраиваем типы файлов для дополнения omnifunc
" (например: js, php, ruby, html, c, css, python)
"autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
"autocmd FileType css setl ofu=csscomplete#CompleteCSS
"autocmd FileType js setl ofu=javascriptcomplete#CompleteJS
"autocmd FileType php setl ofu=phpcomplete#CompletePHP
"autocmd FileType c setl ofu=ccomplete#CompleteCpp
"autocmd FileType py setl ofu=pythoncomplete#CompletePython

" Или же включаем для всех доступных типов файлов
set omnifunc=syntaxcomplete#Complete

" Включаем автодополнение на основе знаний
" Vim/NeoVim и плагинов о синтаксисе текущего формата файла
" и использующегося в нём языка программирования
inoremap <C-space> <C-x><C-o>

" Подробнее про автодополнения можно узнать, загуглив 'vim completion'
" Ещё, можно установить YouCompleteMe или SuperTab.
" Или даже поставить coc.nvim, как LSP, то есть универсальный протокол
" для языкового сервера. Он вообще для настройки NeoVim (и не только)
" под IDE для любых языков
" Я установил пока что только SuperTab :)

" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE

" -----------------------------
" --- Курсор и мышь -----------
" -----------------------------

" Работа с мышью
"   оставить только прокрутку
" set mouse-=a
"   прокрутка + корректное выделение
" set mouse=n
"   полностью включить
"   (при выделении мышью будет временно
"   переходить в режим VISUAL)
" set mouse=a

set mouse=a

" Показывать позицию курсора справа внизу (обычно, панель находится там)
set ruler

" Гибридная нумерация строк слева:
" номер текущей строки + относительные номера строк сверху и снизу
set number relativenumber

" Всегда иметь визуальные отступы в 5 строк
" от верхнего и нижнего края экрана Vim до курсора.
set scrolloff=5

" Подсвечивать строку на которой находится курсор
set cursorline

" Прекратить подсвечивать её при переходе в режим INSERT
autocmd InsertEnter,InsertLeave * set cursorline!

" Показывать колонну на 120 символе строк (по счёту)
"set colorcolumn=120

" Показывать колонну на 80, 120, 160 и последующих символах строк (по счёту)
"let &colorcolumn="80,120,".join(range(160,999),",")

" Может не работать для каждого терминала, так что лучше
" посмотреть, как сделать это для вашего вот здесь:
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes

" Или, использовать NeoVim, в котором этот пункт работает сразу, «из коробки»

" -----------------------------
" --- Настройка NERDTree: -----
" --- файловый менеджер -------
" --- внутри Vim --------------
" -----------------------------

" Окно NERDTree управляется так же,
" как и другие окна в Vim, используя
" Ctrl+w или режим комманд (EX)
"
" Закрыть его можно, нажав q

" Автооткрытие окна NERDTree
" при запуске Vim
" autocmd VimEnter * NERDTree

" Автооткрытие окна NERDTree,
" при открытии директории в Vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
    \ if argc() == 1
    \ && isdirectory(argv()[0])
    \ && !exists("s:std_in")
    \ | exe 'NERDTree' argv()[0]
    \ | wincmd p | ene
    \ | exe 'cd '.argv()[0]
    \ | endif

" Автозакрытие окна NERDTree,
" если сам Vim уже закрыли
autocmd BufEnter *
    \ if (winnr("$") == 1
    \ && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree())
    \ | q | endif

" Открыть/закрыть окно NERDTree
" по нажатию , в режиме NORMAL
nmap <silent> , :NERDTreeToggle<CR>

" Показываем скрытые файлы (.что-то)
let g:NERDTreeShowHidden = 1

" Показываем нумерацию папок и файлов
let g:NERDTreeShowLineNumbers = 1

" -----------------------------
" --- Плагин для markdown -----
" --- предпросмотра -----------
" -----------------------------

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'epiphany'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

let s:mkdp_is_toggled = 0

nmap <F7> <Plug>MarkdownPreviewToggle

" function! s:BufExitMarkdownPreview()
"     if (s:mkdp_is_toggled == 1)
"         :MarkdownPreviewStop
"         let s:mkdp_is_toggled = 0
"     endif
" endfunction
"
" augroup Preview
"     autocmd!
"     autocmd FileType markdown,md,mkd
"         \ :nmap <F7> <Plug>MarkdownPreviewToggle
"         \ | let s:mkdp_is_toggled = ((s:mkdp_is_toggled + 1) % 2)
"     autocmd BufWinLeave * call s:BufExitMarkdownPreview()
" augroup END

" -----------------------------
" --- Плагин для latex --------
" --- предпросмотра -----------
" -----------------------------

autocmd FileType tex nmap <F7> <Plug>LLPStartPreview
autocmd FileType plaintex nmap <F7> <Plug>LLPStartPreview
autocmd FileType latex nmap <F7> <Plug>LLPStartPreview

let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 0
" let g:livepreview_use_biber = 1

" -----------------------------
" --- Плагин vim-gitgutter ----
" --- для подсвечивания -------
" --- изменений в файлах ------
" -----------------------------

" См.: https://github.com/airblade/vim-gitgutter

" let g:gitgutter_set_sign_backgrounds = 1
" set signcolumn=yes

" -----------------------------
" --- Плагин для --------------
" --- оборачивания блоков -----
" --- текста с помощью ()"" ---
" --- ``''<>[]{} и прочих -----
" -----------------------------

" TODO: check out https://github.com/tpope/vim-sexp-mappings-for-regular-people
" noremap s <nop>  " (см выше)
" TODO: check out https://github.com/tpope/vim-sexp-mappings-for-regular-people
"
" s for surround, maybe?
" so, just regex the selected area like so .*, and then replace it with proper
" symbols.
"
" for example, s( will do — :'<,'>s/.*/(&)/

" ОЧЕНЬ важное и полезное смысловое изменение для NeoVim:
" См.: https://github.com/rhysd/vim-operator-surround
" + https://github.com/kana/vim-operator-user

" s, как surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" Убираю стандартное поведение s с удаления символа и вставки на:
map <silent>s <Plug>(operator-surround-append)

" if you use vim-textobj-multiblock
" nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" 
" " if you use vim-textobj-anyblock
" nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
" nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
" 
" " if you use vim-textobj-between
" nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
" nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)

" -----------------------------
" --- Рукотворный плагин ------
" --- для напоминаний о -------
" --- необходимости коммита ---
" -----------------------------

" Why are you not committing?
let g:YUNOcommit_after = 300
let s:max_writes = get(g:, 'YUNOcommit_after', 300)

let s:branch = ''
let s:commit = ''
let s:writes = 0

function! s:checkCommits()

    let gitdir = system('git rev-parse --git-dir > /dev/null 2>&1 | printf "$?"')

    if gitdir != 0
        return
    endif

    let branch = system('git rev-parse --abbrev-ref HEAD')
    let commit = system('git rev-parse --verify HEAD')

    if s:branch !=# branch || s:commit !=# commit
        let s:writes = 0
    endif

    let s:branch = branch
    let s:commit = commit

    " TODO: make an addition, with random lines
    " TODO: use only if inside the git repo
    if s:writes >= s:max_writes
        echohl Todo
        redraw
        echo '→ THE TIME TO COMMIT HAS COME'
        echohl None
    endif

    if s:branch !~# '^fatal'
        let s:writes = s:writes + 1
    endif
endfunction

augroup YUNOcommit
    autocmd!
    autocmd BufWritePost * call s:checkCommits()
augroup END

" -----------------------------
" --- Прочие сочетания --------
" --- клавиш ------------------
" -----------------------------

" Чтобы можно было сохранить файл, который может
" редактировать root пользователь.
" Введи :w!! и нажми Enter/Return в нормальном режиме -
" Vim подставит нужную команду и сохранит файл
cnoremap w!! w !sudo tee > /dev/null %

" Копирование от текущего символа до конца строки
" в режиме NORMAL при нажатии Shift+Y
" (Как Shift+D, только не удаляет скопированные символы)
nnoremap Y y$

" По той же причине убираю Shift+K, чтобы было удобнее делить строки
" в режиме NORMAL и VISUAL
nnoremap K i<CR><Esc>El
" vnoremap K '<,'>s/\ /^v^m/g<CR><Esc>
" https://stackoverflow.com/questions/624821/vim-split-line-command
" K — for cracK (opposite of Join)
" Or, just breaK.

" Перемещение Вверх/Вниз на один абзац текста
" во всех режимах при нажатии Ctrl+Вверх/Вниз
noremap <silent> <C-Up> {
noremap <silent> <C-Down> }

" Перемещение к началу/концу строки по нажатию Shift+Влево/Вправо
" в режимах NORMAL, INSERT и VISUAL
nnoremap <S-Left> ^
vnoremap <S-Left> ^
inoremap <S-Left> <Esc>^i
nnoremap <S-Right> $
vnoremap <S-Right> $
inoremap <S-Right> <Esc>$a

" Превратить выделенные строки в TODO-list в GitHub-markdown (- [ ])
" в режиме VISUAL по нажатию Ctrl+t
vnoremap <silent> <C-t> :<C-u>'<,'>g/^[\-\ ]*/s//\='- [ ] '/<CR><Esc>

" Превратить выделенные строки в ненумерованный список (- )
" в режиме VISUAL по нажатию Ctrl+l
vnoremap <silent> <C-l> :<C-u>'<,'>g/^[\-\ ]*/s//\='- '/<CR><Esc>

" Пронумеровать выделенные строки в режиме VISUAL по нажатию Ctrl+e
vnoremap <silent> <C-e> :<C-u>let i=1 \| '<,'>g/^\d*\.\{0,1}[\-\ ]*/s//\=i.'. '/ \| let i=i+1<CR><Esc>

" Выделить текст, сделав его жирным. В режиме VISUAL по нажатию Ctrl+b
" Пока что не работает, надо улучшить :)
" vnoremap <silent> <C-b> :<C-u>'<,'>s/^/\*\*/ \| gv \| '<,'>s/$/\*\*/<CR><Esc>

" В режиме NORMAL: добавление двух строк ниже, переход к последней
" и включение режима INSERT
nnoremap <expr>o "o\<Esc>o"

" В режиме NORMAL: добавление двух строк ниже, переход к последней,
" добавление строки ниже и включение режима INSERT
nnoremap <expr>O "o\<Esc>o\<Esc>O"

" Поиск по выделенному тексту из режима VISUAL по нажатию /
vnoremap / "ay/<C-R>=escape(@a,'/\')<CR><CR>
" \V

" Обмен клавишами с tmux: там я использую Ctrl+w
" в качестве префикса (управляющего сочетания)
" А Ctrl+b не жалко менять, потому что это сочетание
" по умолчанию прокручивает содержимое файла вниз
" на высоту текущего экрана, а я использую Shift+Вниз
" для этой же цели намного чаще, причём это сочетание
" тоже настроено по умолчанию
nmap <C-b> <C-w>

" Функция, убирающая лишние пробелы на концах строк,
" лишние строки в файле, а также лишние строки под конец файла
function! CleanupBeforeWrite()

    " Запоминаем позицию курсора
    let l:line = line('.')
    let l:col = col('.')

    " Убрать лишние пробелы на концах строк
    " % перед s означает, что нужно сразу во всём файле заменять
    :%s/\s\+$//e

    " Добавить пустые строки под конец файла
    " (нужно, чтобы правильно их усечь до одной впоследствии)
    :$s/$/\=repeat("\r", 5)/e

    " Убрать лишние пустые строки в избыточном количестве
    :%s/\n\{5,}/\r\r/e

    " Странно, но при замене \r - это newline,
    " а \n - это null.
    " https://stackoverflow.com/questions/3965883/vim-replace-character-to-n
    " https://unix.stackexchange.com/questions/247329/vim-how-to-replace-one-new-line-n-with-two-ns

    " Оставляем только одну пустую строку под конец файла
    :$-1,$s/\n//e

    " Возвращаем курсор в исходное положение
    call cursor(l:line, l:col)

endfunction

" Автовызов функции выше перед сохраненем файла
" autocmd BufWritePre * call CleanupBeforeWrite()

" Или, вызов по нажатию Ctrl+l.
" Чистит, а затем сохраняет изменения в файл
" nnoremap <silent> <C-l> :call CleanupBeforeWrite()<CR>:w<CR>
"
" А лучше, поставить вместо раздражающей (меня) Shift+S
nnoremap <silent> S :call CleanupBeforeWrite()<CR>:w<CR>
"   из VISUAL
vnoremap <silent> S <Esc>:call CleanupBeforeWrite()<CR>:w<CR>gv

" Прыжки между местами, в которых недавно были изменения.
nnoremap <silent> <C-h> g;
nnoremap <silent> <C-l> g,

" nnoremap <C-h> ^
" vnoremap <C-h> ^
" inoremap <C-h> <Esc>^i
" — Потому что Backspace интерпретируется NeoVim, как .
" А это значит, что в режиме INSERT будет конфликт.

" Перемещение Вверх/Вниз на один абзац текста
" во всех режимах при нажатии Ctrl+k/j
noremap <silent> <C-k> {
noremap <silent> <C-j> }
" Больше про прыжки:
" https://vim.fandom.com/wiki/Jumping_to_previously_visited_locations
" https://medium.com/breathe-publication/understanding-vims-jump-list-7e1bfc72cdf0
" https://github.com/arp242/jumpy.vim

" Копирование при удалении в режиме visual
vnoremap <silent> x ygvx
vnoremap <silent> X ygvX
" А на d пусть будет без копирования
" vnoremap <silent> d ygvd
" vnoremap <silent> D ygvD
vnoremap <silent> c ygvc
vnoremap <silent> C ygvC

" -----------------------------
" --- Прочие настройки --------
" -----------------------------

" Сделать размер истории последних изменений
" для undo/redo равным 1000
set undolevels=1000
set history=1000

" «Умный» поиск:
" - при вводе только маленьких (строчных) букв
"   ищет регистро-независимо
" - а если введена хотя бы одна большая (заглавная/прописная)
"   буква, то будет искать регистро-зависимо
set ignorecase
set smartcase

" Выделять частичные совпадения сразу.
" Полезно выключить для корректной замены (:substitute)
" в режиме VISUAL
"set incsearch

" Оставляет подсветку после завершения поиска.
" Чтобы очистить прошлый поиск :let @/ = ''
" Включить
" set hlsearch
" Выключить
set nohlsearch
" Временно выключить
" :noh

" Чтобы можно было использовать Backspace
" для удаления в режиме INSERT
set backspace=indent,eol,start

" Чтобы по нажатию на стрелки Влево/Вправо или h/l,
" перемещаться с конца строки на начало следующей
" и с начала строки в конец предыдущей.
" https://superuser.com/questions/35389/in-vim-how-do-i-make-the-left-and-right-arrow-keys-change-line
set whichwrap+=<,>,h,l,[,]

" Настройка копирования из буфера Vim
" в системный/внешний буфер и обратно
"if has('unnamed')
"    set clipboard=unnamed
"endif
if has('unnamedplus')
    set clipboard=unnamedplus
endif

" Если не сработал предыдущий пункт,
" В терминале набери vim --version,
" И если там будет -clipboard, а не +clipboard,
" то нужно будет скомпилировать Vim самостоятельно с такой опцией
"
" Или же, устанавливаем xclip или xsel
" (apt install xclip,
" pacman -S xclip
" и т.п. в других дистрибутивах)
" И копируем в xclip или xsel после копирования в Vim:
" https://vi.stackexchange.com/questions/7399/extract-the-result-of-a-shell-command-to-a-variable-in-a-vimrc-file
let xclip=system('which xclip | wc -l')
let xsel=system('which xsel | wc -l')

if xsel != 0
    autocmd TextYankPost * call system('xsel -bi', @0)
elseif xclip != 0
    autocmd TextYankPost * call system('xclip', @0)
else
    echom 'ОШИБКА: в системе нет ни xclip, ни xsel'
endif

" Вставить текст из xclip в Vim в режиме NORMAL
" (Лучше не использовать, а просто переходить в режим
" INSERT и уже там копировать по нажатию Ctrl+v или Ctrl+Shift+V)
"nnoremap p :r!xclip -o<CR>

" Копирование в xclip на F7
" Вставка из xclip на Shift+F7
"map <F7> :w !xclip<CR><CR>
"vmap <F7> "*y
"map <S-F7> :r!xclip -o<CR>

" Автообновление, при изменении файла извне
set updatetime=250
" set updatetime=1000
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
" CursorMoved, CursorMovedI

" Автоматическое добавление пустой строки
" под конец файла средствами Vim, если таковая отсутствует
" (Не всегда работает, поэтому использую самописную
" функцию CleanupBeforeWrite, описанную выше)
"set endofline
"set fixendofline

" Автоматическое открывание новых окон вниз
" Под окнами я имею в виду разделение экрана, как в tmux
" Например, открыть терминал в окне, это :terminal или :term
"set splitbelow

" Сделать окно терминала высотой в 12 строк.
" Высота строк окна терминала равна высоте строки в Vim.
" Эти настройки применимы только для терминала в Vim, но не в NeoVim
if has('termwinsize')
    set termwinsize=12x0
endif

if has('termsize')
    set termsize=12x0
endif

" Не обновлять экран во время исполнения скриптов и макросов,
" чтобы экран не мерцал и не подвисал на больших файлах
set lazyredraw

" Ускорить вывод символов на экран
set ttyfast

" Использовать расширенный синтаксис регулярных выражений по умолчанию
set magic

" Показывать автодополнение в режиме команд
" (EX, :) в виде меню
set wildmenu
set wildchar=<Tab>

" https://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
" :help wildmode
" set wildmode=longest,list,full
" set wildmode=longest,full

" Игнорировать эти форматы файлов в меню
set wildignore+=*.so,*.swp,*.zip,*.gz,*.xz,*.pyc,*.db,*.sqlite,*.jpg,*.png

" Ограничить максимальное число вкладок до 10
set tabpagemax=10

" Не сбрасывать скопированное после вставки:
xnoremap p pgvy
xnoremap P Pgvy

" Открытие нового файла в вертикальном разделении окна справа
" https://stackoverflow.com/questions/7912060/vim-how-can-i-open-a-file-at-right-side-as-vsplit-from-a-left-side-nerdtree-pan
set splitright

" Выключить звуки и мерцание экрана при ошибках
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Также может сработать:
" set belloff=all

" Отключение бэкапных файлов Vim, ведь скорее всего,
" весь код уже в какой-нибудь VCS: mercury или git
" ЕСЛИ ВЫ РАБОТАЕТЕ ПО SSH, ТО ЛУЧШЕ ЗАКОММЕНТИРОВАТЬ,
" потому что соединение может внезапно оборваться
" и вы потеряете все последние изменения
set nobackup
set nowb
set noswapfile

" Установка UTF-8 стандартной кодировкой для файлов
set encoding=utf8

" Использование формата Unix (LF) по умолчанию
set ffs=unix,dos,mac

" Установка интерпретатора Python3,
" использующегося в системе по умолчанию
let g:python3_host_prog='/usr/bin/python3'

" -----------------------------
" --- Больше красок -----------
" -----------------------------

" 256 цветов (Использовать RGB)
set t_Co=256

" Тот же параметр, но вне графического сервера (Xorg, Wayland)
" if !has('gui_running')
"     set t_Co=256
" endif

" Включение подсветки синтаксиса
syntax enable

" Включение цветов в терминале
if has('termguicolors')
    set termguicolors
endif

" Чиним отображение цветов в Alacritty
" if &term == 'alacritty'
"     let &term='xterm-256color'
" endif

" А лучше, чиним вообще везде:
let &term='xterm-256color'

" И в tmux
" if &term == 'tmux'
"     let &term='xterm-256color'
" endif

" Альтернативный вариант починки (Отстой)
" let &t_8f = '\<Esc>[38;2;%lu;%lu;%lum'
" let &t_8b = '\<Esc>[48:2;%lu;%lu;%lum'

" Изменение цветовой палитры редактора на тёмную
set background=dark
" А можно и на светлую, light

" ~~~
" Настройки для вашей темы для кода
" Я использую Gruvbox:
" - Dark Hard от Morhetz
" - Или её адаптацию под цветовую палитру Material Design
" ~~~

" Другие интересные темы:
" - Solarized Light/Dark
" - New Moon (от Tania Rascia), есть только Dark
" - Monokai (и её вариации)
" - Atom One Dark
" - Darcula, есть только Dark
" - Base16 вариации всех тем выше

" Есть GruvBox, поддерживаемая сообществом:
" https://github.com/gruvbox-community/gruvbox
" Потому что Morhetz прекратил коммитить в свой
" основной репозиторий с gruvbox

colorscheme gruvbox_community
"gruvbox
" let g:gruvbox_background = 'dark'
let g:gruvbox_community_background = 'dark'

" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_contrast_light='hard'

" ~~~
" Настройки для lightline, альтернативного плагина
" для статусной полосы внизу окна Vim
" https://github.com/itchyny/lightline.vim
" Можно добавить встроенными средствами Vim:
" https://vimhelp.org/repeat.txt.html#packages
" ~~~

" В настройках lightline (autoload/lightline.vim) я перенёс вкладки (tabline)
" на статусную строку, см.: https://github.com/itchyny/lightline.vim/issues/313
" Поэтому тут я убираю стандартную tabline
set showtabline=0

" Убрать дублирующее описание режима в командной строке под полосой
" Но оставить размер текущего выделения в режиме VISUAL
set showcmd
set noshowmode

" Показываем линию статуса
set laststatus=2

" Включаем нужную подсветку синтаксиса
" (.vim файл, предоставленный моей цветовой схемой, в папке airline)
" У вашей цветовой схемы такого отдельного файла может не быть :)
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_community'
"'gruvbox'

" Не делать комментарии курсивными в gruvbox_material
" let g:gruvbox_material_disable_italic_comment = 1

" Чтобы показывать в номере столбца не только номер байта,
" но и номер символа, относительно начала строки.
" Будет отображаться как: ${номер байта}-${номер символа}
"
" Дело в том, что символы в UTF-8 занимают два байта,
" а в других кодировках может быть и больше,
" поэтому важно отобразить и номер байта и номер символа.
" Смотри: https://stackoverflow.com/questions/13544640/vim-how-does-the-statusline-v-work
"
" В lightline/autoload/lightline.vim нужно примерно на 109 строчке заменить
" внутри 'component' и внутри 'column' с '%c' на '%c%V'

" ~~~
" Другие варианты statusline/statusbar (статусная панель внизу):
" - Мега-плагин airline со всем-всем:
"   https://github.com/vim-airline/vim-airline
"
" - Плагин, чтобы показывать в командной строке все буфферы Vim:
"   https://github.com/bling/vim-bufferline
" Буффер в Vim это ~= файл. Подробнее про схожесть и различия можно посмотреть
" тут: https://dev.to/iggredible/using-buffers-windows-and-tabs-efficiently-in-vim-56jc
"
" - Вообще заменить табы на буфферы (не про статусбар, но прикольно):
"   https://github.com/ap/vim-buftabline | https://vimawesome.com/plugin/buftabline
"
" - Сделать простую самому:
"   https://kadekillary.work/post/statusline-vim/
" Как пример:
" set laststatus=2
" set statusline=
" set statusline+=\ %l
" set statusline+=\ %*
" set statusline+=\ ‹‹
" set statusline+=\ %f\ %*
" set statusline+=\ ››
" set statusline+=\ %m
" set statusline+=\ %F
" set statusline+=%=
" set statusline+=\ ‹‹
" set statusline+=\ %{strftime('%R', getftime(expand('%')))}
" set statusline+=\ ::
" set statusline+=\ %n
" set statusline+=\ ››\ %*
" ~~~

" -----------------------------
" --- Немного про emoji -------
" -----------------------------

" Вероятно, открыв файл с emoji c помощью Vim
" или любого другого редактора в системе, основанной на Linux
" (Debian/Ubuntu, Arch/Manjaro, Fedora/CentOS/OpenSUSE, и т.д.),
" вы увидете не сами emoji, а лишь непонятные квадраты с 6 символами внутри.
"
" Технически, это и есть emoji, т.е. специальные символы в Unicode, просто система
" не знает, как их отображать, поэтому просто пишет их коды (U+"Те 6 символов")
"
" Чтобы система поняла, как их нужно выводить emoji, ей нужен шрифт, поддерживающий их.
" Простой способ работы со шрифтами в любой Linux-подобной системе это fontconfig.
"
" Установите его:
" Debian/Ubuntu: apt install fontconfig
" Arch/Manjaro: pacman -S fontconfig
" CentOS/Fedora/RHEL/OpenSUSE: yum install fontconfig
" и т.д., для вашей системы будет похожая команда.
"
" Затем, нужно скачать 2 .ttf файла (два шрифта) из папки fonts
" в https://github.com/googlefonts/noto-emoji
"
" И поместить их в ~/.local/share/fonts или ~/.fonts
" (Если нет таких папок, то создайте)
"
" После того, как поместили, можно воспользоваться fontconfig
" и обновить кэш шрифтов в системе командой:
" fc-cache -f -v
"
" Теперь, если откроете файл с emoji, они будут отображаться, как надо,
" как в Vim и терминале, так и за их пределами.

" -----------------------------

" И, напоследок, если хочется большего, то есть:
" 1. https://habr.com/ru/post/468265/
" 2. vimtutor
" 3. Vim Wiki
" 4. https://github.com/learnbyexample/vim_reference
" 5. https://github.com/mhinz/vim-galore
" 6. https://github.com/mireadev/vim-cheat-sheet
" 7. https://vimhelp.org/repeat.txt.html
" 8. Google/Yandex/DuckDuckGo, ну или Bing (sarcasm)

" Если вам vi/Vim ухудшает работу, а не улучшает, посмотрите:
" 1. https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
" 2. Ещё более развёрнутый вариант из первого пункта:
"    https://gist.github.com/nifl/1178878
" 3. https://stackoverflow.com/questions/1088387/what-specific-productivity-gains-do-vim-emacs-provide-over-gui-text-editors

" Как говорится, 'У Vim есть не только кривая входа, но и довольно крутая кривая выхода =)'

" Удачи!
" P.S.: не забудь поставить <Звезду>, мне будет приятно :)
" P.P.S.: вот сюда для Vim: https://gist.github.com/novusnota/65dcc593df6d9909ffb59eb83fe69a28
" а сюда — для NeoVim: https://github.com/novusnota/ru-neovim

" -----------------------------
" --- ОФФТОП-ОФФТОП -----------
" --- Плагин-песочница --------
" --- (тестирую разное) -------
" -----------------------------

" let g:keysound_enable = 1
" let g:keysound_theme = 'default'
" или default, typewriter, mario, sword, bubble

" let g:keysound_py_version = 2
" let g:keysound_volume = 500

" abbreviate
ab :computer: 💻

" ab :ec: !# 'file.js' javascript
" ab :ec: [embedmd]:# (file.js javascript)
" https://github.com/campoy/embedmd

" emojilib - make it real
" работает только в рамках одного ввода и только если
" под конец поставить пробел
"
" TODO:
" Alt + left/right для переключения вкладок
" В NeoVim работает Alt! Ю-ху!
" Возможно, надо на Alt+Вверх/Вниз изменять числа (или ещё какие-нибудь операции над строками)
"
" Также, пора разделить файлик на две части, внизу указав всё для neovim'а / vim, если есть раздельное
" vim:
" neovim / vim
" neovim specific (extras)
" use qq or just q for Ctrl+w ???
" JUST USE <M-C-Left><M-C-Right> for tab switch
" and alt <Up><Down><Left><Right> to use  and switch windows
" switch windows on alt + ...

" shift+U for :redo???
" tab — choose between completions
" ctrl + space — highly unused
" also check out new plugins
"
" J — for join
" K — for break
" H — top of the screen (high)
" L — bottom of the screen (low)

" ------------------------------------------ TODO: lexical

" Проверка орфографии в Vim
" https://superuser.com/questions/911412/how-to-configure-vim-spellcheck-to-use-two-languages
" http://ashep.org/2010/proverka-pravopisaniya-v-vim/#.YBHvLNYenMU
" set spell spelllang=en,ru

augroup Lexical
    autocmd!
    autocmd FileType
        \ markdown,mkd,md,text,txt,html,yaml,yml,toml,plaintex,tex,latex,sh,bash
        \ setlocal spell spelllang=en,ru
augroup END

" Настройка и включение
"
" Для начала необходимо загрузить с ftp://ftp.vim.org/pub/vim/runtime/spell/ файлы словарей, соответственно языкам, регионам и кодировкам,
" проверка правописания которых вам необходима.
" Для меня пока что достаточно проверки русского в UTF-8 и поэтому я загрузил файлы ru.utf-8.spl и ru.utf-8.sug.
" Скаченные файлы необходимо разместить в каталоге ~/.vim/spell.
"
" Собственно, на этом настройка правописания завершена и теперь осталось её включить. Делается это следующей командой в Vim:
"
" set spell spelllang=ru
"
" ru замените, если нужно, на код языка, правописание которого вам необходимо проверять. Если вам нужно, чтобы включение проверки правописания происходило автоматически при запуске Vim, добавьте приведённую строку в файл ~/.vimrc и/или в ~/.gvimrc по вашему вкусу. Вот, что должно получиться в итоге:

" Работа с ошибками
"
" При помощи следующих команд Vim вы можете быстро перемещаться по словам, написанным с ошибками:
"
"     ]s — перемещает курсор на следующее слово с ошибкой;
"     [s - перемещает курсор на предыдущее слово с ошибкой;
"     ]S — то же, что и ]s, только курсор не будет останавливаться на словах, которые считаются неправильным для определённого региона выбранного языка;
"     [S - то же, что и ]S, но в обратном направлении.
"
" Для добавления ошибочно написанных слов в ваш собственный список слов можно использовать следующие команды:
"
"     zg — добавляет слово, находящееся под курсором в spellfile;
"     zG — то же, что и zg, однако слово будет добавлено в internal-wordlist;
"     zw — то же, что и zg, однако слово будет помечено как ошибочно-написанное;
"     zW — то же, что и zw, только слово будет добавлено в internal-wordlist;
"
" Чтобы отменить действие добавления слова, используйте команды:
"
"     zug и zuw — отменяет действие zg и zw соответственно;
"     zuG и zuW — отменяет действие zG и zW соответственно;
"
" Для того, чтобы Vim показал вам предложения по исправлению ошибочно-написанного слова, используйте команду z=:

" https://thoughtbot.com/blog/vim-spell-checking
" https://thejakeharding.com/using-spell-check-in-vim
" https://www.linux.com/training-tutorials/using-spell-checking-vim/

" -------------------------- TODO: /lexical

" -------------------------- TODO: fold

set foldmethod=indent
" Default (and max) is 20
" set foldnestmax=10
" Make folds, but don't close them by default
set nofoldenable
set foldlevel=10

" The command zc will close a fold (if the cursor is in an open fold),
" and zo will open a fold (if the cursor is in a closed fold).
" It's easier to just use za which will toggle the current fold (close it if it was open, or open it if it was closed).
"
" The commands zc (close), zo (open), and za (toggle) operate on one level of folding, at the cursor.
" The commands zC, zO and zA are similar, but operate on all folding levels
" (for example, the cursor line may be in an open fold, which is inside another open fold; typing zC would close all folds at the cursor).
"
" The command zr reduces folding by opening one more level of folds throughout the whole buffer
" (the cursor position is not relevant). Use zR to open all folds.
"
" The command zm gives more folding by closing one more level of folds throughout the whole buffer.
" Use zM to close all folds.
"
" https://www.linux.com/training-tutorials/vim-tips-folding-fun/
" :help z
" https://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim
" https://vim.fandom.com/wiki/Folding
" augroup folding
"   au BufReadPre * setlocal foldmethod=indent
"   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" :lcd %:p:h
" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
" https://vi.stackexchange.com/questions/3674/change-working-directory-to-current-opened-file
"
" backticks for zM / zR toggle `, because they're just aliases for '
" ctrl+` is <C-Space> somehow
" Вообще, редко в Vim открываю несколько вкладок, чтобы Альт был нужен
" Так что, пора попробовать сделать его prefix в tmux,
" А в самом vim вернуть c+w <> и ctrl<>
"
" Ещё, сделать shift+с для удаления остатка строки и редактирования на месте

" https://devhints.io/vimscript
" learn vimscript hard way
" https://stackoverflow.com/questions/5998374/if-filetype-tex
"
" Пора добавить leader key, и на него вешать сворачивание / разворачивание
" u и U
" А ещё, <C-Space> пустует :)
" Можно на него toggle повесить -> Да!
" В режиме NORMAL. В INSERT же можно расширенное дополнение туда
" Leader or LocalLeader -> :help
" , но надо аккуратно, чтобы не переназначить нечаянно.
" inoremap <C-v> <C-v>...
" или же imap <...>

let g:vim_jsx_pretty_colorful_config = 1 " default 0

" ctrl+f to fold / unfold everything (toggle)
" https://unix.stackexchange.com/questions/46827/vim-executing-a-key-command-in-a-function
" https://vi.stackexchange.com/questions/20206/using-a-special-key-in-function
let s:everyfold_is_open = 1
function! EveryFoldIsOpen()
    if s:everyfold_is_open == 1
        let s:everyfold_is_open = 0
        execute "normal zM"
    else
        let s:everyfold_is_open = 1
        execute "normal zR"
    endif
endfunction

nnoremap <silent> <C-f> :call EveryFoldIsOpen()<CR>

" -------------------------- TODO: /fold

" using
" https://github.com/gko/vim-coloresque
" instead of:
" https://github.com/ap/vim-css-color
"
" ^ они требовательные к ресурсам

" using
" https://github.com/terryma/vim-expand-region
" + and _ inside normal/visual to expand selection
" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
    \ 'iw'  :0,
    \ 'iW'  :0,
    \ 'i"'  :0,
    \ 'i''' :0,
    \ 'i]'  :1,
    \ 'ib'  :1,
    \ 'iB'  :1,
    \ 'il'  :0,
    \ 'ip'  :0,
    \ 'ie'  :0,
    \ }

""
"""" -------------------------
""" Отличия между Vim и NeoVim
"""" -------------------------
""

if has('nvim')
    " -----------------------------
    " --- Привычные комбинации ----
    " --- клавиш для редакторов ---
    " --- вне терминала -----------
    " -----------------------------

    " В случае NeoVim, полностью работает клавиша Alt, поэтому сделал
    " возврат к изменениям на Alt+z
    " В NeoVim, Alt - клавиша модификатор, так же, как и кнопка Win,
    " поэтому она пишется в командах, как <M>, от слова Modifier
    nnoremap <M-z> :redo<CR>
    vnoremap <M-z> <Esc>:redo<CR>
    inoremap <M-z> <Esc>:redo<CR>i

    " -----------------------------
    " --- Терминал в NeoVim -------
    " -----------------------------

    " Настройки взяты из:
    " https://neovim.io/doc/user/nvim_terminal_emulator.html

    " Выходим из терминала по нажатию Escape
    tnoremap <Esc> <C-\><C-n>

    " tnoremap <A-h> <C-\><C-N><C-w>h
    " tnoremap <A-j> <C-\><C-N><C-w>j
    " tnoremap <A-k> <C-\><C-N><C-w>k
    " tnoremap <A-l> <C-\><C-N><C-w>l
    " inoremap <A-h> <C-\><C-N><C-w>h
    " inoremap <A-j> <C-\><C-N><C-w>j
    " inoremap <A-k> <C-\><C-N><C-w>k
    " inoremap <A-l> <C-\><C-N><C-w>l
    " nnoremap <A-h> <C-w>h
    " nnoremap <A-j> <C-w>j
    " nnoremap <A-k> <C-w>k
    " nnoremap <A-l> <C-w>l

    " -----------------------------
    " --- Прочие сочетания --------
    " --- клавиш ------------------
    " -----------------------------

    " Открыть терминал по нажатию Ctrl+q в режиме NORMAL
    " В NeoVim, открывается отдельный буфер с терминалом и даже новый режим — TERMINAL
    " Поэтому, открываем сначала новую вкладку, а уже затем её превращаем в терминал:
    nnoremap <C-q> :tabnew<CR>:terminal<CR>
    " Или, можно в одну команду:
    " :tabnew | term

    " Перемещение по открытым окнам в текущей вкладке
    " по нажатию Alt+Влево/Вправо/Вверх/Вниз
    " в режиме NORMAL для NeoVim
    nnoremap <M-Left> <C-w><Left>
    nnoremap <M-Right> <C-w><Right>
    nnoremap <M-Up> <C-w><Up>
    nnoremap <M-Down> <C-w><Down>

    " Перемещение к предыдущей/следующей вкладке по нажатию Ctrl+Alt+Влево/Вправо
    " в режиме NORMAL для NeoVim
    nnoremap <silent> <M-C-Left> gT
    nnoremap <silent> <M-C-Right> gt

    " То же, для Alt + h/l
    nnoremap <silent> <M-C-h> gT
    nnoremap <silent> <M-C-l> gt

else  " Vim или vi

    " -----------------------------
    " --- Привычные комбинации ----
    " --- клавиш для редакторов ---
    " --- вне терминала -----------
    " -----------------------------

    nnoremap <C-x> :redo<CR>
    vnoremap <C-x> <Esc>:redo<CR>
    inoremap <C-x> <Esc>:redo<CR>i

    " -----------------------------
    " --- Курсор и мышь -----------
    " -----------------------------

    " Убрать мерцание курсора в режиме INSERT
    " и превратить его в линию, вместо блока
    " Эта настройка (или нечто, дающее тот же результат)
    " есть в NeoVim по умолчанию
    let &t_SI = "\<Esc>[6 q"
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[4 q"

    " -----------------------------
    " --- Прочие сочетания --------
    " --- клавиш ------------------
    " -----------------------------

    " Открыть терминал по нажатию Ctrl+q в режиме NORMAL
    " Терминал откроется в разделённом окне. Работа с окнами
    " в Vim похожа на tmux, управляющее сочетание по умолчанию: Ctrl+w
    " Переключиться между окнами: <Сочетание>+Стрелка Вверх/Вниз/Вправо/Влево
    nnoremap <C-q> :terminal<CR>

endif

" (neo)vim — sane defaults (this file)
" Add some guiding to it (basic operations, philosophy, keystrokes
